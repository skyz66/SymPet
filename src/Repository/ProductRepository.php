<?php
namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;

class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    public function search(
        ?string $query,
        ?int $categoryId,
        ?string $animalType = null,
        ?float $minPrice = null,
        ?float $maxPrice = null
    ): QueryBuilder {
        $qb = $this->createQueryBuilder('p')
            ->leftJoin('p.category', 'c')
            ->addSelect('c');

        if (null !== $query && '' !== trim($query)) {
            $qb->andWhere('p.name LIKE :q OR p.description LIKE :q')
                ->setParameter('q', '%' . trim($query) . '%');
        }

        if (null !== $categoryId) {
            $qb->andWhere('p.category = :cat')
                ->setParameter('cat', $categoryId);
        }

        if (null !== $animalType) {
            $qb->andWhere('p.animalType = :animalType')
                ->setParameter('animalType', $animalType);
        }

        if (null !== $minPrice) {
            $qb->andWhere('p.price >= :minPrice')
                ->setParameter('minPrice', $minPrice);
        }

        if (null !== $maxPrice) {
            $qb->andWhere('p.price <= :maxPrice')
                ->setParameter('maxPrice', $maxPrice);
        }

        return $qb->orderBy('p.name', 'ASC');
    }

    public function findMostSold(): array
    {
        return $this->createQueryBuilder('p')
            ->select('p.name, SUM(ol.quantity) as totalSold')
            ->join('App\\Entity\\OrderLine', 'ol', 'WITH', 'ol.product = p')
            ->groupBy('p.id')
            ->orderBy('totalSold', 'DESC')
            ->setMaxResults(5)
            ->getQuery()
            ->getResult();
    }
}