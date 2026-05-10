<?php
namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    public function search(?string $query, ?int $categoryId): array
    {
        $qb = $this->createQueryBuilder('p')
            ->leftJoin('p.category', 'c')
            ->addSelect('c');

        if ($query) {
            $qb->andWhere('p.name LIKE :q OR p.description LIKE :q')
               ->setParameter('q', '%' . $query . '%');
        }

        if ($categoryId) {
            $qb->andWhere('p.category = :cat')
               ->setParameter('cat', $categoryId);
        }

        return $qb->orderBy('p.name', 'ASC')
                  ->getQuery()
                  ->getResult();
    }

    public function findMostSold(): array
    {
        return $this->createQueryBuilder('p')
            ->select('p.name, SUM(ol.quantity) as totalSold')
            ->join('App\Entity\OrderLine', 'ol', 'WITH', 'ol.product = p')
            ->groupBy('p.id')
            ->orderBy('totalSold', 'DESC')
            ->setMaxResults(5)
            ->getQuery()
            ->getResult();
    }
}