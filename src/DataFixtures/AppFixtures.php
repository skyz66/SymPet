<?php
namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\ProductReview;
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
        // Admin user
        $admin = new User();
        $admin->setEmail('admin@sympet.com');
        $admin->setFirstName('Admin');
        $admin->setLastName('SymPET');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setIsVerified(true);
        $admin->setPassword($this->hasher->hashPassword($admin, 'Admin123'));
        $manager->persist($admin);

        // Test customers
        $customers = [];
        $customerData = [
            ['user@test.com', 'Ahmed', 'Ben Ali', 'User1234'],
            ['sarra@test.com', 'Sarra', 'Trabelsi', 'User1234'],
            ['yassine@test.com', 'Yassine', 'Mansouri', 'User1234'],
        ];

        foreach ($customerData as [$email, $firstName, $lastName, $plainPassword]) {
            $user = new User();
            $user->setEmail($email);
            $user->setFirstName($firstName);
            $user->setLastName($lastName);
            $user->setRoles(['ROLE_USER']);
            $user->setIsVerified(true);
            $user->setPassword($this->hasher->hashPassword($user, $plainPassword));
            $manager->persist($user);
            $customers[] = $user;
        }

        // Categories
        $categories = [];
        $catData = [
            ['Dog Food', 'dog-food', 'Premium food for dogs'],
            ['Cat Food', 'cat-food', 'Balanced food and treats for cats'],
            ['Dog Accessories', 'dog-accessories', 'Collars, leashes and everyday dog accessories'],
            ['Cat Accessories', 'cat-accessories', 'Cat trees, scratching posts and comfort accessories'],
            ['Toys', 'toys', 'Interactive toys for all pets'],
            ['Bird & Fish Supplies', 'bird-fish-supplies', 'Food and accessories for birds and fish'],
        ];

        foreach ($catData as [$name, $slug, $desc]) {
            $cat = new Category();
            $cat->setName($name);
            $cat->setSlug($slug);
            $cat->setDescription($desc);
            $manager->persist($cat);
            $categories[] = $cat;
        }

        // Products: enough realistic demo data to test search, categories, stock and product detail pages.
        $productEntities = [];
        $products = [
            ['Royal Canin Adult', 'Premium dry food for adult dogs with balanced nutrients.', '45.99', 50, 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=800', 0, 'dog'],
            ['Pedigree Puppy', 'Complete nutrition for growing puppies.', '32.50', 80, 'https://images.unsplash.com/photo-1601758124096-519e856a89c6?w=800', 0, 'dog'],
            ['Chicken Training Treats', 'Soft bite-sized rewards for dog training sessions.', '14.90', 65, 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=800', 0, 'dog'],
            ['Whiskas Tuna', 'Wet food with real tuna for cats.', '18.99', 60, 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=800', 1, 'cat'],
            ['Felix Chicken', 'Tender chicken cat food in sauce.', '16.50', 75, 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=800', 1, 'cat'],
            ['Crunchy Cat Treats', 'Crunchy salmon treats for playful cats.', '9.90', 90, 'https://images.unsplash.com/photo-1519052537078-e6302a4968d4?w=800', 1, 'cat'],
            ['Leather Collar', 'Adjustable leather collar for dogs.', '12.99', 30, 'https://images.unsplash.com/photo-1567612529009-afe25813a308?w=800', 2, 'dog'],
            ['Reflective Leash', 'Strong reflective leash for safe evening walks.', '19.90', 45, 'https://images.unsplash.com/photo-1534361960057-19889db9621e?w=800', 2, 'dog'],
            ['Dog Rain Jacket', 'Light waterproof jacket for rainy walks.', '39.90', 22, 'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?w=800', 2, 'dog'],
            ['Cat Tree Deluxe', 'Multi-level play tower for cats.', '89.99', 15, 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=800', 3, 'cat'],
            ['Scratch Post', 'Durable sisal scratching post for indoor cats.', '27.50', 40, 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=800', 3, 'cat'],
            ['Cozy Cat Bed', 'Soft washable bed for naps and comfort.', '34.90', 33, 'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=800', 3, 'cat'],
            ['Rope Toy', 'Durable chew rope toy for dogs.', '8.99', 100, 'https://images.unsplash.com/photo-1535268647677-300dbf3d78d1?w=800', 4, 'dog'],
            ['Feather Wand', 'Interactive feather wand for cats.', '6.50', 120, 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=800', 4, 'cat'],
            ['Treat Puzzle', 'Puzzle feeder that keeps pets mentally active.', '24.90', 38, 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=800', 4, 'dog'],
            ['Bird Seed Mix', 'Vitamin-rich seed mix for small birds.', '11.90', 55, 'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?w=800', 5, 'bird'],
            ['Bird Swing Perch', 'Wooden swing perch for cages.', '13.50', 28, 'https://images.unsplash.com/photo-1522926193341-e9ffd686c60f?w=800', 5, 'bird'],
            ['Fish Flakes', 'Daily flake food for aquarium fish.', '7.90', 70, 'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?w=800', 5, 'fish'],
            ['Aquarium Plant Decor', 'Safe decorative plant for aquariums.', '15.90', 35, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', 5, 'fish'],
            ['Rabbit Hay Feeder', 'Practical hay feeder for rabbits and small pets.', '21.90', 24, 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=800', 5, 'rabbit'],
        ];

        foreach ($products as [$name, $desc, $price, $stock, $imageUrl, $catIdx, $animalType]) {
            $product = new Product();
            $product->setName($name);
            $product->setDescription($desc);
            $product->setPrice($price);
            $product->setStock($stock);
            $product->setImageUrl($imageUrl);
            $product->setCategory($categories[$catIdx]);
            $product->setAnimalType($animalType);
            $manager->persist($product);
            $productEntities[] = $product;
        }

        // Reviews bonus: preloaded ratings so the product detail page is not empty.
        $reviewData = [
            [0, 0, 5, 'Excellent quality and fast delivery.'],
            [0, 1, 4, 'Good value for the price.'],
            [9, 0, 5, 'My cat loves it. Very stable and easy to assemble.'],
            [9, 2, 4, 'Nice product, looks good in the living room.'],
            [13, 1, 5, 'Simple toy but very effective.'],
            [17, 2, 4, 'Good daily food for my aquarium.'],
        ];

        foreach ($reviewData as [$productIdx, $customerIdx, $rating, $comment]) {
            $review = new ProductReview();
            $review->setProduct($productEntities[$productIdx]);
            $review->setUser($customers[$customerIdx]);
            $review->setRating($rating);
            $review->setComment($comment);
            $manager->persist($review);
        }

        $manager->flush();
    }
}
