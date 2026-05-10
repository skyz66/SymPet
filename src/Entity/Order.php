<?php
namespace App\Entity;

use App\Repository\OrderRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderRepository::class)]
#[ORM\Table(name: '`order`')]
class Order
{
    const STATUS_PENDING   = 'pending';
    const STATUS_PAID      = 'paid';
    const STATUS_SHIPPED   = 'shipped';
    const STATUS_CANCELLED = 'cancelled';

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20)]
    private string $status = self::STATUS_PENDING;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $total = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $stripePaymentId = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\ManyToOne(inversedBy: 'orders')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    #[ORM\OneToMany(mappedBy: 'customerOrder', targetEntity: OrderLine::class,
                    cascade: ['persist', 'remove'], orphanRemoval: true)]
    private Collection $orderLines;

    public function __construct()
    {
        $this->orderLines = new ArrayCollection();
        $this->createdAt  = new \DateTimeImmutable();
    }

    public function getId(): ?int { return $this->id; }

    public function getStatus(): string { return $this->status; }
    public function setStatus(string $status): static { $this->status = $status; return $this; }

    public function getTotal(): ?string { return $this->total; }
    public function setTotal(string $total): static { $this->total = $total; return $this; }

    public function getStripePaymentId(): ?string { return $this->stripePaymentId; }
    public function setStripePaymentId(?string $id): static { $this->stripePaymentId = $id; return $this; }

    public function getCreatedAt(): ?\DateTimeImmutable { return $this->createdAt; }

    public function getUser(): ?User { return $this->user; }
    public function setUser(?User $user): static { $this->user = $user; return $this; }

    public function getOrderLines(): Collection { return $this->orderLines; }

    public function addOrderLine(OrderLine $line): static
    {
        if (!$this->orderLines->contains($line)) {
            $this->orderLines->add($line);
            $line->setCustomerOrder($this);
        }
        return $this;
    }

    public function removeOrderLine(OrderLine $line): static
    {
        if ($this->orderLines->removeElement($line)) {
            if ($line->getCustomerOrder() === $this) {
                $line->setCustomerOrder(null);
            }
        }
        return $this;
    }
}