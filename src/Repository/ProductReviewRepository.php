<?php
namespace App\Repository;

use App\Entity\Product;
use App\Entity\ProductReview;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ProductReview>
 */
class ProductReviewRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProductReview::class);
    }

    /**
     * @return ProductReview[]
     */
    public function findByProduct(Product $product): array
    {
        return $this->createQueryBuilder('r')
            ->addSelect('u')
            ->join('r.user', 'u')
            ->andWhere('r.product = :product')
            ->setParameter('product', $product)
            ->orderBy('r.createdAt', 'DESC')
            ->getQuery()
            ->getResult();
    }

    /**
     * @return array{averageRating: ?float, reviewsCount: int}
     */
    public function getStatsForProduct(Product $product): array
    {
        $result = $this->createQueryBuilder('r')
            ->select('AVG(r.rating) AS averageRating, COUNT(r.id) AS reviewsCount')
            ->andWhere('r.product = :product')
            ->setParameter('product', $product)
            ->getQuery()
            ->getSingleResult();

        $averageRating = null;
        if (null !== $result['averageRating']) {
            $averageRating = round((float) $result['averageRating'], 1);
        }

        return [
            'averageRating' => $averageRating,
            'reviewsCount' => (int) $result['reviewsCount'],
        ];
    }

    public function findByProductAndUser(Product $product, User $user): ?ProductReview
    {
        return $this->findOneBy([
            'product' => $product,
            'user' => $user,
        ]);
    }
}