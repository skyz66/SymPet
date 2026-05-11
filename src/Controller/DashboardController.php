<?php
namespace App\Controller;

use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/admin')]
#[IsGranted('ROLE_ADMIN')]
class DashboardController extends AbstractController
{
    #[Route('/dashboard', name: 'admin_dashboard')]
    public function index(
        OrderRepository $orderRepo,
        ProductRepository $productRepo,
        UserRepository $userRepo
    ): Response {
        $revenueByMonth    = $orderRepo->getRevenueByMonth();
        $ordersByMonth     = $orderRepo->getOrderCountByMonth();
        $topProducts       = $productRepo->findMostSold();
        $totalClients      = $userRepo->count([]);
        $totalRevenue      = $orderRepo->getTotalRevenue();
        $pendingOrders     = $orderRepo->findByStatus('pending');
        $paidOrders        = $orderRepo->findByStatus('paid');

        // Format data for Chart.js
        $revenueLabels = array_column($revenueByMonth, 'month');
        $revenueData   = array_column($revenueByMonth, 'revenue');

        $orderLabels   = array_column($ordersByMonth, 'month');
        $orderData     = array_column($ordersByMonth, 'orderCount');

        $topProductNames  = array_column($topProducts, 'name');
        $topProductSales  = array_column($topProducts, 'totalSold');

        return $this->render('admin/dashboard.html.twig', [
            'revenueLabels'    => $revenueLabels,
            'revenueData'      => $revenueData,
            'orderLabels'      => $orderLabels,
            'orderData'        => $orderData,
            'topProductNames'  => $topProductNames,
            'topProductSales'  => $topProductSales,
            'totalClients'     => $totalClients,
            'totalRevenue'     => $totalRevenue,
            'pendingOrders'    => count($pendingOrders),
            'paidOrders'       => count($paidOrders),
        ]);
    }
}