<?php
namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    public function __construct(
        private UserPasswordHasherInterface $hasher
    ) {}

    public function load(ObjectManager $manager): void
    {
        // ── Admin user ──────────────────────────────
        $admin = new User();
        $admin->setEmail('admin@sympet.com');
        $admin->setFirstName('Admin');
        $admin->setLastName('SymPET');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setIsVerified(true);
        $admin->setPassword($this->hasher->hashPassword($admin, 'Admin123'));
        $manager->persist($admin);

        // ── Test customer ────────────────────────────
        $user = new User();
        $user->setEmail('user@test.com');
        $user->setFirstName('Ahmed');
        $user->setLastName('Ben Ali');
        $user->setRoles(['ROLE_USER']);
        $user->setIsVerified(true);
        $user->setPassword($this->hasher->hashPassword($user, 'User1234'));
        $manager->persist($user);

        // ── Categories ───────────────────────────────
        $categories = [];
        $catData = [
            ['Dog Food', 'dog-food', 'Premium food for dogs'],
            ['Cat Food', 'cat-food', 'Premium food for cats'],
            ['Accessories', 'accessories', 'Pet accessories'],
            ['Toys', 'toys', 'Toys for all pets'],
        ];

        foreach ($catData as [$name, $slug, $desc]) {
            $cat = new Category();
            $cat->setName($name);
            $cat->setSlug($slug);
            $cat->setDescription($desc);
            $manager->persist($cat);
            $categories[] = $cat;
        }

        // ── Products ─────────────────────────────────
        $products = [
            ['Royal Canin Adult', 'Premium dry food for adult dogs', '45.99', 50, 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=400', 0, 'dog'],
            ['Pedigree Puppy', 'Nutrition for growing puppies', '32.50', 80, 'https://images.unsplash.com/photo-1601758124096-519e856a89c6?w=400', 0, 'dog'],
            ['Whiskas Tuna', 'Wet food with real tuna for cats', '18.99', 60, 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400', 1, 'cat'],
            ['Felix Chicken', 'Tender chicken cat food', '16.50', 75, 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=400', 1, 'cat'],
            ['Leather Collar', 'Adjustable leather collar for dogs', '12.99', 30, 'https://images.unsplash.com/photo-1567612529009-afe25813a308?w=400', 2, 'dog'],
            ['Cat Tree Deluxe', 'Multi-level play tower for cats', '89.99', 15, 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=400', 2, 'cat'],
            ['Rope Toy', 'Durable chew rope toy for dogs', '8.99', 100, 'https://images.unsplash.com/photo-1535268647677-300dbf3d78d1?w=400', 3, 'dog'],
            ['Feather Wand', 'Interactive feather wand for cats', '6.50', 120, 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=400', 3, 'cat'],
        ];

    foreach ($products as [$name, $desc, $price, $stock, $imageUrl, $catIdx, $animalType]) {
        $p = new Product();
        $p->setName($name);
        $p->setDescription($desc);
        $p->setPrice($price);
        $p->setStock($stock);
        $p->setImageUrl($imageUrl);
        $p->setCategory($categories[$catIdx]);
        $p->setAnimalType($animalType);
        $manager->persist($p);
        }
    }
}