<?php
namespace App\Controller;

use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ProductController extends AbstractController
{
    #[Route('/products', name: 'product_index')]
    public function index(
        Request $request,
        ProductRepository $productRepo,
        CategoryRepository $categoryRepo,
        PaginatorInterface $paginator
    ): Response {
        $query      = $request->query->get('q');
        $categoryId = $request->query->getInt('category');
        $animalType = $request->query->get('animal');
        $minPrice   = $request->query->get('min_price') ? (float) $request->query->get('min_price') : null;
        $maxPrice   = $request->query->get('max_price') ? (float) $request->query->get('max_price') : null;

        $queryBuilder = $productRepo->search($query, $categoryId ?: null, $animalType, $minPrice, $maxPrice);

        $products = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            6
        );

        $categories = $categoryRepo->findAll();

        return $this->render('product/index.html.twig', [
            'products'    => $products,
            'categories'  => $categories,
            'query'       => $query,
            'selectedCat' => $categoryId,
            'animalType'  => $animalType,
            'minPrice'    => $minPrice,
            'maxPrice'    => $maxPrice,
        ]);
    }

    #[Route('/products/{id}', name: 'product_show')]
    public function show(int $id, ProductRepository $repo): Response
    {
        $product = $repo->find($id);
        if (!$product) {
            throw $this->createNotFoundException('Product not found');
        }

        return $this->render('product/show.html.twig', [
            'product' => $product,
        ]);
    }
}