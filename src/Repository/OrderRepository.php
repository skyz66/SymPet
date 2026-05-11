<?php
namespace App\Repository;

use App\Entity\Order;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class OrderRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Order::class);
    }

    public function getRevenueByMonth(): array
    {
        return $this->createQueryBuilder('o')
            ->select("DATE_FORMAT(o.createdAt, '%Y-%m') as month, SUM(o.total) as revenue")
            ->where('o.status = :status')
            ->setParameter('status', Order::STATUS_PAID)
            ->groupBy('month')
            ->orderBy('month', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function getOrderCountByMonth(): array
    {
        return $this->createQueryBuilder('o')
            ->select("DATE_FORMAT(o.createdAt, '%Y-%m') as month, COUNT(o.id) as orderCount")
            ->groupBy('month')
            ->orderBy('month', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function findByStatus(string $status): array
    {
        return $this->findBy(['status' => $status], ['createdAt' => 'DESC']);
    }

    public function getTotalRevenue(): float
    {
        $result = $this->createQueryBuilder('o')
            ->select('SUM(o.total) as total')
            ->where('o.status = :status')
            ->setParameter('status', Order::STATUS_PAID)
            ->getQuery()
            ->getSingleScalarResult();

        return (float) $result;
    }
}