<?php
namespace App\Service;

use App\Entity\Order;
use App\Entity\OrderLine;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Twig\Environment;

class OrderService
{
    public function __construct(
        private EntityManagerInterface $em,
        private MailerInterface $mailer,
        private CartService $cartService,
        private Environment $twig,
        private LoggerInterface $logger,
        private string $mailerFrom = 'rayenkaraborni138@gmail.com'
    ) {}

    public function createFromCart(User $user): Order
    {
        $order = new Order();
        $order->setUser($user);
        $order->setStatus(Order::STATUS_PENDING);
        $order->setTotal((string) $this->cartService->getTotal());

        foreach ($this->cartService->getItems() as $item) {
            $line = new OrderLine();
            $line->setProduct($item['product']);
            $line->setQuantity($item['qty']);
            $line->setUnitPrice($item['product']->getPrice());

            $newStock = $item['product']->getStock() - $item['qty'];
            $item['product']->setStock(max(0, $newStock));

            $order->addOrderLine($line);
            $this->em->persist($line);
        }

        $this->em->persist($order);
        $this->em->flush();
        $this->cartService->clear();

        return $order;
    }

    public function sendConfirmationEmail(Order $order): void
    {
        $html = $this->twig->render('email/order_confirmation.html.twig', [
            'order' => $order,
        ]);

        $email = (new Email())
            ->from($this->mailerFrom)
            ->to($order->getUser()->getEmail())
            ->subject('Order #' . $order->getId() . ' confirmed — SymPET')
            ->html($html);

        $this->mailer->send($email);
    }

    public function markAsPaid(Order $order, string $stripeId): void
    {
        $order->setStatus(Order::STATUS_PAID);
        $order->setStripePaymentId($stripeId);
        $this->em->flush();

        try {
            $this->sendConfirmationEmail($order);
        } catch (TransportExceptionInterface $e) {
            $this->logger->error('Failed to send order confirmation email.', [
                'order_id' => $order->getId(),
                'user_email' => $order->getUser()->getEmail(),
                'error' => $e->getMessage(),
            ]);
        }
    }
}