<?php
namespace App\Controller;

use App\Repository\OrderRepository;
use App\Service\CartService;
use App\Service\OrderService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/order', name: 'order_')]
#[IsGranted('ROLE_USER')]
class OrderController extends AbstractController
{
    #[Route('/history', name: 'history')]
    public function history(OrderRepository $orderRepo): Response
    {
        $orders = $orderRepo->findBy(
            ['user' => $this->getUser()],
            ['createdAt' => 'DESC']
        );

        return $this->render('order/history.html.twig', [
            'orders' => $orders,
        ]);
    }

    #[Route('/detail/{id}', name: 'detail')]
    public function detail(int $id, OrderRepository $orderRepo): Response
    {
        $order = $orderRepo->find($id);

        if (!$order || $order->getUser() !== $this->getUser()) {
            throw $this->createNotFoundException('Order not found');
        }

        return $this->render('order/detail.html.twig', [
            'order' => $order,
        ]);
    }
}