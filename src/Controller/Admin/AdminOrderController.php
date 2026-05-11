<?php
namespace App\Controller\Admin;

use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/admin/orders', name: 'admin_order_')]
#[IsGranted('ROLE_ADMIN')]
class AdminOrderController extends AbstractController
{
    #[Route('', name: 'index')]
    public function index(OrderRepository $orderRepo): Response
    {
        return $this->render('admin/order/index.html.twig', [
            'pending'  => $orderRepo->findByStatus('pending'),
            'paid'     => $orderRepo->findByStatus('paid'),
            'shipped'  => $orderRepo->findByStatus('shipped'),
        ]);
    }

    #[Route('/status/{id}/{status}', name: 'status')]
    public function updateStatus(int $id, string $status, OrderRepository $orderRepo, EntityManagerInterface $em): Response
    {
        $order = $orderRepo->find($id);
        if ($order) {
            $order->setStatus($status);
            $em->flush();
            $this->addFlash('success', 'Order status updated.');
        }
        return $this->redirectToRoute('admin_order_index');
    }
}