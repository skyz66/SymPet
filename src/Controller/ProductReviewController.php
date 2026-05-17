<?php
namespace App\Controller;

use App\Entity\ProductReview;
use App\Entity\User;
use App\Repository\ProductRepository;
use App\Repository\ProductReviewRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

class ProductReviewController extends AbstractController
{
    #[Route('/products/{id}/review', name: 'product_review_save', methods: ['POST'])]
    public function save(
        int $id,
        Request $request,
        ProductRepository $productRepository,
        ProductReviewRepository $reviewRepository,
        EntityManagerInterface $entityManager
    ): RedirectResponse {
        $product = $productRepository->find($id);
        if (!$product) {
            throw $this->createNotFoundException('Product not found');
        }

        $user = $this->getUser();
        if (!$user instanceof User) {
            $this->addFlash('warning', 'Please login before reviewing a product.');

            return $this->redirectToRoute('app_login');
        }

        if (!$this->isCsrfTokenValid('review_' . $product->getId(), (string) $request->request->get('_token'))) {
            $this->addFlash('danger', 'Invalid review form. Please try again.');

            return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
        }

        $rating = $request->request->filter('rating', 0, \FILTER_VALIDATE_INT);
        $comment = trim((string) $request->request->get('comment', ''));

        if ($rating < 1 || $rating > 5) {
            $this->addFlash('danger', 'Please choose a rating between 1 and 5 stars.');

            return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
        }

        if (mb_strlen($comment) > 2000) {
            $this->addFlash('danger', 'Your comment is too long. Maximum 2000 characters.');

            return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
        }

        $review = $reviewRepository->findByProductAndUser($product, $user) ?? new ProductReview();
        $review->setProduct($product);
        $review->setUser($user);
        $review->setRating($rating);
        $review->setComment($comment !== '' ? $comment : null);

        $entityManager->persist($review);
        $entityManager->flush();

        $this->addFlash('success', 'Your product review has been saved.');

        return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
    }
}
