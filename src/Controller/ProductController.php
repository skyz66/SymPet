<?php
namespace App\Controller;

use App\Entity\Category;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use App\Repository\ProductReviewRepository;
use App\Entity\User;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ProductController extends AbstractController
{
    private const ALLOWED_ANIMAL_TYPES = ['dog', 'cat', 'bird', 'fish', 'rabbit'];

    #[Route('/home', name: 'home')]
    #[Route('/product', name: 'product_legacy_index')]
    #[Route('/products', name: 'product_index')]
    public function index(
        Request $request,
        ProductRepository $productRepo,
        CategoryRepository $categoryRepo,
        PaginatorInterface $paginator
    ): Response {
        $query = $request->query->get('q');

        // Avoid BadRequestHttpException on invalid non-integer query values.
        $categoryId = $request->query->filter('category', null, \FILTER_VALIDATE_INT, \FILTER_NULL_ON_FAILURE);
        if (null !== $categoryId && $categoryId < 1) {
            $categoryId = null;
        }

        $animalType = $request->query->get('animal');
        if (!\in_array($animalType, self::ALLOWED_ANIMAL_TYPES, true)) {
            $animalType = null;
        }

        $minPrice = $request->query->filter('min_price', null, \FILTER_VALIDATE_FLOAT, \FILTER_NULL_ON_FAILURE);
        $maxPrice = $request->query->filter('max_price', null, \FILTER_VALIDATE_FLOAT, \FILTER_NULL_ON_FAILURE);

        if (null !== $minPrice && $minPrice < 0) {$minPrice = null;}

        if (null !== $maxPrice && $maxPrice < 0) {
            $maxPrice = null;
        }

        if (null !== $minPrice && null !== $maxPrice && $minPrice > $maxPrice) {
            [$minPrice, $maxPrice] = [$maxPrice, $minPrice];
        }

        $categories = $categoryRepo->findAll();
        $categoryAnimalMap = [];
        $selectedCategoryAnimal = null;

        foreach ($categories as $category) {
            $mappedAnimalType = $this->inferAnimalTypeFromCategory($category);
            $categoryAnimalMap[(string) $category->getId()] = $mappedAnimalType;

            if (null !== $categoryId && $category->getId() === $categoryId) {
                $selectedCategoryAnimal = $mappedAnimalType;
            }
        }

        if (null !== $selectedCategoryAnimal) {
            // Keep category/animal filters consistent for animal-specific categories.
            $animalType = $selectedCategoryAnimal;
        }

        $queryBuilder = $productRepo->search($query, $categoryId, $animalType, $minPrice, $maxPrice);

        $page = $request->query->filter('page', 1, \FILTER_VALIDATE_INT, \FILTER_NULL_ON_FAILURE);
        $page = (null !== $page && $page > 0) ? $page : 1;

        $products = $paginator->paginate(
            $queryBuilder,
            $page,
            8
        );

        return $this->render('product/index.html.twig', [
            'products' => $products,
            'categories' => $categories,
            'query' => $query,
            'selectedCat' => $categoryId,
            'animalType' => $animalType,
            'minPrice' => $minPrice,
            'maxPrice' => $maxPrice,
            'categoryAnimalMap' => $categoryAnimalMap,
        ]);
    }

    #[Route('/products/{id}', name: 'product_show')]
    public function show(int $id, ProductRepository $repo, ProductReviewRepository $reviewRepo): Response
    {
        $product = $repo->find($id);
        if (!$product) {
            throw $this->createNotFoundException('Product not found');
        }

        $currentUserReview = null;
        $user = $this->getUser();
        if ($user instanceof User) {
            $currentUserReview = $reviewRepo->findByProductAndUser($product, $user);
        }

        return $this->render('product/show.html.twig', [
            'product' => $product,
            'reviews' => $reviewRepo->findByProduct($product),
            'ratingStats' => $reviewRepo->getStatsForProduct($product),
            'currentUserReview' => $currentUserReview,
        ]);
    }

    private function inferAnimalTypeFromCategory(Category $category): ?string
    {
        $slug = (string) $category->getSlug();

        foreach (self::ALLOWED_ANIMAL_TYPES as $animalType) {
            if (str_starts_with($slug, $animalType . '-')) {
                return $animalType;
            }
        }

        return null;
    }
}
