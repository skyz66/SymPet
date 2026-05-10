<?php
namespace App\Service;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\RequestStack;

class CartService
{
    private const SESSION_KEY = 'cart';

    public function __construct(
        private RequestStack $requestStack,
        private ProductRepository $productRepository
    ) {}

    private function getSession()
    {
        return $this->requestStack->getSession();
    }

    private function getRaw(): array
    {
        return $this->getSession()->get(self::SESSION_KEY, []);
    }

    public function add(int $productId, int $qty = 1): void
    {
        $cart = $this->getRaw();
        $cart[$productId] = ($cart[$productId] ?? 0) + $qty;
        $this->getSession()->set(self::SESSION_KEY, $cart);
    }

    public function updateQuantity(int $productId, int $qty): void
    {
        $cart = $this->getRaw();
        if ($qty <= 0) {
            unset($cart[$productId]);
        } else {
            $cart[$productId] = $qty;
        }
        $this->getSession()->set(self::SESSION_KEY, $cart);
    }

    public function remove(int $productId): void
    {
        $cart = $this->getRaw();
        unset($cart[$productId]);
        $this->getSession()->set(self::SESSION_KEY, $cart);
    }

    public function clear(): void
    {
        $this->getSession()->remove(self::SESSION_KEY);
    }

    public function getItems(): array
    {
        $items = [];
        foreach ($this->getRaw() as $productId => $qty) {
            $product = $this->productRepository->find($productId);
            if ($product) {
                $items[] = [
                    'product'  => $product,
                    'qty'      => $qty,
                    'subtotal' => (float) $product->getPrice() * $qty,
                ];
            }
        }
        return $items;
    }

    public function getTotal(): float
    {
        return array_sum(array_column($this->getItems(), 'subtotal'));
    }

    public function getCount(): int
    {
        return array_sum($this->getRaw());
    }
}