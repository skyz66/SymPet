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

        $queryBuilder = $productRepo->search($query, $categoryId ?: null);

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