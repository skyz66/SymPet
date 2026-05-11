<?php
namespace App\Controller;

use App\Service\CartService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/cart', name: 'cart_')]
class CartController extends AbstractController
{
    #[Route('', name: 'index')]
    #[IsGranted('ROLE_USER')]
    public function index(CartService $cart): Response
    {
        return $this->render('cart/index.html.twig', [
            'items' => $cart->getItems(),
            'total' => $cart->getTotal(),
        ]);
    }

    #[Route('/add/{id}', name: 'add')]
    #[IsGranted('ROLE_USER')]
    public function add(int $id, CartService $cart): Response
    {
        $cart->add($id, 1);
        $this->addFlash('success', 'Product added to cart!');
        return $this->redirectToRoute('product_index');
    }

    #[Route('/update/{id}', name: 'update', methods: ['POST'])]
    #[IsGranted('ROLE_USER')]
    public function update(int $id, Request $request, CartService $cart): Response
    {
        $qty = $request->request->getInt('qty');
        $cart->updateQuantity($id, $qty);
        return $this->redirectToRoute('cart_index');
    }

    #[Route('/remove/{id}', name: 'remove')]
    #[IsGranted('ROLE_USER')]
    public function remove(int $id, CartService $cart): Response
    {
        $cart->remove($id);
        $this->addFlash('success', 'Product removed from cart!');
        return $this->redirectToRoute('cart_index');
    }
}