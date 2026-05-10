<?php
namespace App\Controller;

use App\Service\CartService;
use App\Service\OrderService;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/payment')]
#[IsGranted('ROLE_USER')]
class PaymentController extends AbstractController
{
    public function __construct(
        private string $stripeSecretKey,
        private string $stripePublicKey
    ) {}

    #[Route('/checkout', name: 'payment_checkout')]
    public function checkout(CartService $cart): Response
    {
        if ($cart->getCount() === 0) {
            return $this->redirectToRoute('cart_index');
        }

        return $this->render('payment/checkout.html.twig', [
            'items'           => $cart->getItems(),
            'total'           => $cart->getTotal(),
            'stripePublicKey' => $this->stripePublicKey,
        ]);
    }

    #[Route('/create-intent', name: 'payment_intent', methods: ['POST'])]
    public function createIntent(CartService $cart): JsonResponse
    {
        Stripe::setApiKey($this->stripeSecretKey);

        $intent = PaymentIntent::create([
            'amount'   => (int) ($cart->getTotal() * 100),
            'currency' => 'eur',
            'automatic_payment_methods' => ['enabled' => true],
        ]);

        return $this->json(['clientSecret' => $intent->client_secret]);
    }

    #[Route('/success', name: 'payment_success')]
    public function success(Request $request, OrderService $orderService): Response
    {
        $paymentIntentId = $request->query->get('payment_intent');
        $order = $orderService->createFromCart($this->getUser());
        $orderService->markAsPaid($order, $paymentIntentId ?? '');

        return $this->render('payment/success.html.twig', [
            'order' => $order,
        ]);
    }
}