<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20260516230500 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add product reviews and ratings table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE product_review (id INT AUTO_INCREMENT NOT NULL, product_id INT NOT NULL, user_id INT NOT NULL, rating SMALLINT NOT NULL, comment LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_1B3FC0624584665A (product_id), INDEX IDX_1B3FC062A76ED395 (user_id), UNIQUE INDEX uniq_product_user_review (product_id, user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE product_review ADD CONSTRAINT FK_5E4296F64584665A FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE product_review ADD CONSTRAINT FK_5E4296F6A76ED395 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE product_review DROP FOREIGN KEY FK_5E4296F64584665A');
        $this->addSql('ALTER TABLE product_review DROP FOREIGN KEY FK_5E4296F6A76ED395');
        $this->addSql('DROP TABLE product_review');
    }
}
