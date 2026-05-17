-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2026 at 10:46 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sympet`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Dog Food', 'dog-food', 'Premium food for dogs'),
(2, 'Cat Food', 'cat-food', 'Balanced food and treats for cats'),
(3, 'Dog Accessories', 'dog-accessories', 'Collars, leashes and everyday dog accessories'),
(4, 'Cat Accessories', 'cat-accessories', 'Cat trees, scratching posts and comfort accessories'),
(5, 'Toys', 'toys', 'Interactive toys for all pets'),
(6, 'Bird & Fish Supplies', 'bird-fish-supplies', 'Food and accessories for birds and fish');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260510195818', '2026-05-10 19:58:25', 141),
('DoctrineMigrations\\Version20260510231638', '2026-05-10 23:16:42', 228),
('DoctrineMigrations\\Version20260510234437', '2026-05-10 23:44:39', 277),
('DoctrineMigrations\\Version20260511105015', '2026-05-11 10:50:17', 71),
('DoctrineMigrations\\Version20260516230500', '2026-05-16 22:22:29', 378);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(12, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:5:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}s:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\";a:1:{i:0;O:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\":4:{s:67:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionClass\\\";s:67:\\\"Symfony\\\\Component\\\\HttpFoundation\\\\Exception\\\\SessionNotFoundException\\\";s:66:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionCode\\\";i:0;s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionMessage\\\";s:40:\\\"There is currently no session available.\\\";s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0flattenException\\\";O:57:\\\"Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\\":12:{s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0message\\\";s:40:\\\"There is currently no session available.\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0code\\\";i:0;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0previous\\\";N;s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0trace\\\";a:1:{i:0;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:0:\\\"\\\";s:4:\\\"file\\\";s:69:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\http-foundation\\\\RequestStack.php\\\";s:4:\\\"line\\\";i:115;s:4:\\\"args\\\";a:0:{}}}s:72:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0traceAsString\\\";s:9014:\\\"#0 C:\\\\laragon\\\\www\\\\sympet\\\\src\\\\Service\\\\CartService.php(18): Symfony\\\\Component\\\\HttpFoundation\\\\RequestStack->getSession()\n#1 C:\\\\laragon\\\\www\\\\sympet\\\\src\\\\Service\\\\CartService.php(23): App\\\\Service\\\\CartService->getSession()\n#2 C:\\\\laragon\\\\www\\\\sympet\\\\src\\\\Service\\\\CartService.php(79): App\\\\Service\\\\CartService->getRaw()\n#3 C:\\\\laragon\\\\www\\\\sympet\\\\src\\\\Twig\\\\CartExtension.php(15): App\\\\Service\\\\CartService->getCount()\n#4 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\ExtensionSet.php(365): App\\\\Twig\\\\CartExtension->getGlobals()\n#5 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php(908): Twig\\\\ExtensionSet->getGlobals()\n#6 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php(398): Twig\\\\Environment->getGlobals()\n#7 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php(358): Twig\\\\Template->yield(Array, Array)\n#8 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php(373): Twig\\\\Template->display(Array)\n#9 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php(51): Twig\\\\Template->render(Array)\n#10 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php(333): Twig\\\\TemplateWrapper->render(Array)\n#11 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\twig-bridge\\\\Mime\\\\BodyRenderer.php(67): Twig\\\\Environment->render(\\\'registration/co...\\\', Array)\n#12 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\twig-bridge\\\\Mime\\\\BodyRenderer.php(87): Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\BodyRenderer->{closure:Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\BodyRenderer::render():51}()\n#13 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\EventListener\\\\MessageListener.php(124): Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\BodyRenderer->render(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail))\n#14 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\EventListener\\\\MessageListener.php(71): Symfony\\\\Component\\\\Mailer\\\\EventListener\\\\MessageListener->renderMessage(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail))\n#15 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\event-dispatcher\\\\EventDispatcher.php(206): Symfony\\\\Component\\\\Mailer\\\\EventListener\\\\MessageListener->onMessage(Object(Symfony\\\\Component\\\\Mailer\\\\Event\\\\MessageEvent), \\\'Symfony\\\\\\\\Compone...\\\', Object(Symfony\\\\Component\\\\EventDispatcher\\\\EventDispatcher))\n#16 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\event-dispatcher\\\\EventDispatcher.php(56): Symfony\\\\Component\\\\EventDispatcher\\\\EventDispatcher->callListeners(Array, \\\'Symfony\\\\\\\\Compone...\\\', Object(Symfony\\\\Component\\\\Mailer\\\\Event\\\\MessageEvent))\n#17 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\event-dispatcher\\\\Debug\\\\TraceableEventDispatcher.php(111): Symfony\\\\Component\\\\EventDispatcher\\\\EventDispatcher->dispatch(Object(Symfony\\\\Component\\\\Mailer\\\\Event\\\\MessageEvent), \\\'Symfony\\\\\\\\Compone...\\\')\n#18 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php(75): Symfony\\\\Component\\\\EventDispatcher\\\\Debug\\\\TraceableEventDispatcher->dispatch(Object(Symfony\\\\Component\\\\Mailer\\\\Event\\\\MessageEvent))\n#19 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(138): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), Object(Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope))\n#20 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php(51): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), NULL)\n#21 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php(29): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), NULL)\n#22 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(148): Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler->__invoke(Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage))\n#23 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(90): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->callHandler(Object(Closure), Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage), NULL, NULL)\n#24 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php(75): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#25 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php(34): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#26 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php(68): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#27 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php(41): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#28 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php(35): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#29 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddDefaultStampsMiddleware.php(33): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#30 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php(36): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddDefaultStampsMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#31 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php(69): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#32 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php(30): Symfony\\\\Component\\\\Messenger\\\\MessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#33 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php(51): Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#34 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(187): Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope))\n#35 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(126): Symfony\\\\Component\\\\Messenger\\\\Worker->handleMessage(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), \\\'async\\\')\n#36 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php(283): Symfony\\\\Component\\\\Messenger\\\\Worker->run(Array)\n#37 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php(341): Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand->execute(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#38 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(1117): Symfony\\\\Component\\\\Console\\\\Command\\\\Command->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#39 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(123): Symfony\\\\Component\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#40 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(356): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#41 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(77): Symfony\\\\Component\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#42 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(195): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#43 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php(49): Symfony\\\\Component\\\\Console\\\\Application->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#44 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\autoload_runtime.php(32): Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner->run()\n#45 C:\\\\laragon\\\\www\\\\sympet\\\\bin\\\\console(15): require_once(\\\'C:\\\\\\\\laragon\\\\\\\\www\\\\\\\\...\\\')\n#46 {main}\\\";s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0class\\\";s:67:\\\"Symfony\\\\Component\\\\HttpFoundation\\\\Exception\\\\SessionNotFoundException\\\";s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusCode\\\";i:400;s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusText\\\";s:11:\\\"Bad Request\\\";s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0headers\\\";a:0:{}s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0file\\\";s:69:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\http-foundation\\\\RequestStack.php\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0line\\\";i:115;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0asString\\\";N;}}}s:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\";a:3:{i:0;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:956;}i:1;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:2149;}i:2;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:3909;}}s:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\";a:3:{i:0;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:58.551813\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:1;}i:1;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:58.658041\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:2;}i:2;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:56:00.979248\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:3;}}s:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\";a:1:{i:0;O:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\":1:{s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\0id\\\";i:8;}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://localhost:8000/verify/email?expires=1778972034&id=4&signature=LtFtp2dwPA10d8wXrOGM2LAUeJGiekdnT0h2LyAH7io&token=7ZM5DVbAnzjCxu3K6z5%2ByKcxXeFZeFaiwS9XPwk%2FH1s%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:26:\\\"rayenkarborni138@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:6:\\\"SymPet\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"ahmedskyzit@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-05-16 21:56:00', '2026-05-16 21:56:03', NULL),
(13, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:5:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}s:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\";a:1:{i:0;O:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\":4:{s:67:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionClass\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:66:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionCode\\\";i:0;s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionMessage\\\";s:217:\\\"Connection could not be established with host \\\"smtp.gmail.com:587\\\": stream_socket_client(): Unable to connect to smtp.gmail.com:587 (An attempt was made to access a socket in a way forbidden by its access permissions)\\\";s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0flattenException\\\";O:57:\\\"Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\\":12:{s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0message\\\";s:217:\\\"Connection could not be established with host \\\"smtp.gmail.com:587\\\": stream_socket_client(): Unable to connect to smtp.gmail.com:587 (An attempt was made to access a socket in a way forbidden by its access permissions)\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0code\\\";i:0;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0previous\\\";N;s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0trace\\\";a:1:{i:0;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:0:\\\"\\\";s:4:\\\"file\\\";s:82:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:4:\\\"line\\\";i:154;s:4:\\\"args\\\";a:0:{}}}s:72:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0traceAsString\\\";s:7104:\\\"#0 [internal function]: Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->{closure:Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream::initialize():153}(2, \\\'stream_socket_c...\\\', \\\'C:\\\\\\\\laragon\\\\\\\\www\\\\\\\\...\\\', 157)\n#1 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php(157): stream_socket_client(\\\'smtp.gmail.com:...\\\', 0, \\\'\\\', 60.0, 4, Resource id #965)\n#2 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(268): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->initialize()\n#3 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(200): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->start()\n#4 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php(90): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->doSend(Object(Symfony\\\\Component\\\\Mailer\\\\SentMessage))\n#5 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(138): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), Object(Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope))\n#6 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php(51): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#7 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php(29): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#8 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(148): Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler->__invoke(Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage))\n#9 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(90): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->callHandler(Object(Closure), Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage), NULL, NULL)\n#10 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php(75): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#11 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php(34): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#12 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php(68): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#13 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php(41): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#14 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php(35): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#15 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddDefaultStampsMiddleware.php(33): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#16 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php(36): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddDefaultStampsMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#17 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php(69): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#18 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php(30): Symfony\\\\Component\\\\Messenger\\\\MessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#19 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php(51): Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#20 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(187): Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope))\n#21 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(126): Symfony\\\\Component\\\\Messenger\\\\Worker->handleMessage(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), \\\'async\\\')\n#22 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php(283): Symfony\\\\Component\\\\Messenger\\\\Worker->run(Array)\n#23 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php(341): Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand->execute(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#24 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(1117): Symfony\\\\Component\\\\Console\\\\Command\\\\Command->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#25 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(123): Symfony\\\\Component\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#26 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(356): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#27 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(77): Symfony\\\\Component\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#28 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(195): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#29 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php(49): Symfony\\\\Component\\\\Console\\\\Application->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#30 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\autoload_runtime.php(32): Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner->run()\n#31 C:\\\\laragon\\\\www\\\\sympet\\\\bin\\\\console(15): require_once(\\\'C:\\\\\\\\laragon\\\\\\\\www\\\\\\\\...\\\')\n#32 {main}\\\";s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusCode\\\";i:500;s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusText\\\";s:21:\\\"Internal Server Error\\\";s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0headers\\\";a:0:{}s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0file\\\";s:82:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0line\\\";i:154;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0asString\\\";N;}}}s:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\";a:3:{i:0;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:1029;}i:1;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:2013;}i:2;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:4133;}}s:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\";a:3:{i:0;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:58.471295\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:1;}i:1;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:59.822146\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:2;}i:2;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:56:01.073622\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:3;}}s:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\";a:1:{i:0;O:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\":1:{s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\0id\\\";i:10;}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;N;i:1;N;i:2;s:1993:\\\"<!DOCTYPE html>\n<html>\n<head>\n    <meta charset=\\\"UTF-8\\\">\n    <style>\n        body { font-family: Arial, sans-serif; color: #333; }\n        .container { max-width: 600px; margin: 0 auto; padding: 20px; }\n        .header { background: #0d6efd; color: white; padding: 20px; text-align: center; }\n        .content { padding: 20px; }\n        table { width: 100%; border-collapse: collapse; margin: 20px 0; }\n        th { background: #f8f9fa; padding: 10px; text-align: left; border: 1px solid #dee2e6; }\n        td { padding: 10px; border: 1px solid #dee2e6; }\n        .total { font-size: 18px; font-weight: bold; color: #0d6efd; }\n        .footer { text-align: center; color: #999; font-size: 12px; margin-top: 20px; }\n    </style>\n</head>\n<body>\n<div class=\\\"container\\\">\n    <div class=\\\"header\\\">\n        <h1>🐾 SymPET</h1>\n        <p>Order Confirmation</p>\n    </div>\n    <div class=\\\"content\\\">\n        <p>Hello <strong>Admin SymPET</strong>,</p>\n        <p>Thank you for your order! Here are your order details:</p>\n\n        <p><strong>Order Number:</strong> #4</p>\n        <p><strong>Date:</strong> 16/05/2026 17:01</p>\n        <p><strong>Status:</strong> paid</p>\n\n        <table>\n            <thead>\n                <tr>\n                    <th>Product</th>\n                    <th>Quantity</th>\n                    <th>Unit Price</th>\n                    <th>Subtotal</th>\n                </tr>\n            </thead>\n            <tbody>\n                                <tr>\n                    <td>Cat Tree Deluxe</td>\n                    <td>1</td>\n                    <td>89.99 €</td>\n                    <td>89.99 €</td>\n                </tr>\n                            </tbody>\n        </table>\n\n        <p class=\\\"total\\\">Total: 89.99 €</p>\n        <p>We will notify you when your order is shipped.</p>\n        <p>Thank you for shopping with SymPET! 🐾</p>\n    </div>\n    <div class=\\\"footer\\\">\n        <p>© 2026 SymPET — All rights reserved</p>\n    </div>\n</div>\n</body>\n</html>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"rayenkaraborni138@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"admin@sympet.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:29:\\\"Order #4 confirmed — SymPET\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-05-16 21:56:01', '2026-05-16 21:56:05', NULL);
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(14, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:6:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}s:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\";a:1:{i:0;O:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\":4:{s:67:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionClass\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:66:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionCode\\\";i:0;s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionMessage\\\";s:217:\\\"Connection could not be established with host \\\"smtp.gmail.com:587\\\": stream_socket_client(): Unable to connect to smtp.gmail.com:587 (An attempt was made to access a socket in a way forbidden by its access permissions)\\\";s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0flattenException\\\";O:57:\\\"Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\\":12:{s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0message\\\";s:217:\\\"Connection could not be established with host \\\"smtp.gmail.com:587\\\": stream_socket_client(): Unable to connect to smtp.gmail.com:587 (An attempt was made to access a socket in a way forbidden by its access permissions)\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0code\\\";i:0;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0previous\\\";N;s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0trace\\\";a:1:{i:0;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:0:\\\"\\\";s:4:\\\"file\\\";s:82:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:4:\\\"line\\\";i:154;s:4:\\\"args\\\";a:0:{}}}s:72:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0traceAsString\\\";s:7105:\\\"#0 [internal function]: Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->{closure:Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream::initialize():153}(2, \\\'stream_socket_c...\\\', \\\'C:\\\\\\\\laragon\\\\\\\\www\\\\\\\\...\\\', 157)\n#1 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php(157): stream_socket_client(\\\'smtp.gmail.com:...\\\', 0, \\\'\\\', 60.0, 4, Resource id #1062)\n#2 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(268): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->initialize()\n#3 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(200): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->start()\n#4 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php(90): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->doSend(Object(Symfony\\\\Component\\\\Mailer\\\\SentMessage))\n#5 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(138): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), Object(Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope))\n#6 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php(51): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#7 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php(29): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#8 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(148): Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler->__invoke(Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage))\n#9 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(90): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->callHandler(Object(Closure), Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage), NULL, NULL)\n#10 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php(75): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#11 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php(34): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#12 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php(68): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#13 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php(41): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#14 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php(35): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#15 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddDefaultStampsMiddleware.php(33): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#16 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php(36): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddDefaultStampsMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#17 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php(69): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#18 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php(30): Symfony\\\\Component\\\\Messenger\\\\MessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#19 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php(51): Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#20 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(187): Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope))\n#21 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(126): Symfony\\\\Component\\\\Messenger\\\\Worker->handleMessage(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), \\\'async\\\')\n#22 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php(283): Symfony\\\\Component\\\\Messenger\\\\Worker->run(Array)\n#23 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php(341): Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand->execute(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#24 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(1117): Symfony\\\\Component\\\\Console\\\\Command\\\\Command->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#25 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(123): Symfony\\\\Component\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#26 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(356): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#27 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(77): Symfony\\\\Component\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#28 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\console\\\\Application.php(195): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#29 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php(49): Symfony\\\\Component\\\\Console\\\\Application->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#30 C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\autoload_runtime.php(32): Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner->run()\n#31 C:\\\\laragon\\\\www\\\\sympet\\\\bin\\\\console(15): require_once(\\\'C:\\\\\\\\laragon\\\\\\\\www\\\\\\\\...\\\')\n#32 {main}\\\";s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusCode\\\";i:500;s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusText\\\";s:21:\\\"Internal Server Error\\\";s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0headers\\\";a:0:{}s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0file\\\";s:82:\\\"C:\\\\laragon\\\\www\\\\sympet\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0line\\\";i:154;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0asString\\\";N;}}}s:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\";a:4:{i:0;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:954;}i:1;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:1954;}i:2;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:3951;}i:3;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:0;}}s:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\";a:4:{i:0;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:58.604702\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:1;}i:1;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:58.727555\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:2;}i:2;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:55:59.865052\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:3;}i:3;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-05-16 21:56:02.156214\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:0;}}s:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\";a:1:{i:0;O:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\":1:{s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\0id\\\";i:11;}}s:61:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\\";a:1:{i:0;O:61:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\\":1:{s:83:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\0originalReceiverName\\\";s:5:\\\"async\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;N;i:1;N;i:2;s:1993:\\\"<!DOCTYPE html>\n<html>\n<head>\n    <meta charset=\\\"UTF-8\\\">\n    <style>\n        body { font-family: Arial, sans-serif; color: #333; }\n        .container { max-width: 600px; margin: 0 auto; padding: 20px; }\n        .header { background: #0d6efd; color: white; padding: 20px; text-align: center; }\n        .content { padding: 20px; }\n        table { width: 100%; border-collapse: collapse; margin: 20px 0; }\n        th { background: #f8f9fa; padding: 10px; text-align: left; border: 1px solid #dee2e6; }\n        td { padding: 10px; border: 1px solid #dee2e6; }\n        .total { font-size: 18px; font-weight: bold; color: #0d6efd; }\n        .footer { text-align: center; color: #999; font-size: 12px; margin-top: 20px; }\n    </style>\n</head>\n<body>\n<div class=\\\"container\\\">\n    <div class=\\\"header\\\">\n        <h1>🐾 SymPET</h1>\n        <p>Order Confirmation</p>\n    </div>\n    <div class=\\\"content\\\">\n        <p>Hello <strong>Ahmed LAHBIB</strong>,</p>\n        <p>Thank you for your order! Here are your order details:</p>\n\n        <p><strong>Order Number:</strong> #5</p>\n        <p><strong>Date:</strong> 16/05/2026 21:54</p>\n        <p><strong>Status:</strong> paid</p>\n\n        <table>\n            <thead>\n                <tr>\n                    <th>Product</th>\n                    <th>Quantity</th>\n                    <th>Unit Price</th>\n                    <th>Subtotal</th>\n                </tr>\n            </thead>\n            <tbody>\n                                <tr>\n                    <td>Cat Tree Deluxe</td>\n                    <td>1</td>\n                    <td>89.99 €</td>\n                    <td>89.99 €</td>\n                </tr>\n                            </tbody>\n        </table>\n\n        <p class=\\\"total\\\">Total: 89.99 €</p>\n        <p>We will notify you when your order is shipped.</p>\n        <p>Thank you for shopping with SymPET! 🐾</p>\n    </div>\n    <div class=\\\"footer\\\">\n        <p>© 2026 SymPET — All rights reserved</p>\n    </div>\n</div>\n</body>\n</html>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"rayenkaraborni138@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"ahmedskyzit@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:29:\\\"Order #5 confirmed — SymPET\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'failed', '2026-05-16 21:56:02', '2026-05-16 21:56:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `stripe_payment_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `status`, `total`, `stripe_payment_id`, `created_at`, `user_id`) VALUES
(1, 'paid', 89.99, 'pi_3TXlTGFA56fhgGat1tSELos7', '2026-05-16 16:55:01', 2),
(2, 'paid', 0.00, 'pi_3TXlTGFA56fhgGat1tSELos7', '2026-05-16 16:56:35', 2),
(3, 'paid', 179.98, 'pi_3TXlWUFA56fhgGat2hzFWHlT', '2026-05-16 16:57:38', 2),
(4, 'paid', 89.99, 'pi_3TXlafFA56fhgGat2GPzitio', '2026-05-16 17:01:45', 2),
(5, 'paid', 89.99, 'pi_3TXq9xFA56fhgGat28SiHfgN', '2026-05-16 21:54:26', 4),
(6, 'paid', 89.99, 'pi_3TXqSFFA56fhgGat2mohN77R', '2026-05-16 22:13:21', 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `customer_order_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`id`, `quantity`, `unit_price`, `customer_order_id`, `product_id`) VALUES
(1, 1, 89.99, 1, 6),
(2, 2, 89.99, 3, 6),
(3, 1, 89.99, 4, 6),
(4, 1, 89.99, 5, 6),
(5, 1, 89.99, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `category_id` int NOT NULL,
  `animal_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `stock`, `image_url`, `created_at`, `category_id`, `animal_type`) VALUES
(1, 'Royal Canin Adult', 'Premium dry food for adult dogs with balanced nutrients.', 45.99, 50, 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=800', '2026-05-16 23:05:00', 1, 'dog'),
(2, 'Pedigree Puppy', 'Complete nutrition for growing puppies.', 32.50, 80, 'https://images.unsplash.com/photo-1601758124096-519e856a89c6?w=800', '2026-05-16 23:05:00', 1, 'dog'),
(3, 'Chicken Training Treats', 'Soft bite-sized rewards for dog training sessions.', 14.90, 65, 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=800', '2026-05-16 23:05:00', 1, 'dog'),
(4, 'Whiskas Tuna', 'Wet food with real tuna for cats.', 18.99, 60, 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=800', '2026-05-16 23:05:00', 2, 'cat'),
(5, 'Felix Chicken', 'Tender chicken cat food in sauce.', 16.50, 75, 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=800', '2026-05-16 23:05:00', 2, 'cat'),
(6, 'Cat Tree Deluxe', 'Multi-level play tower for cats.', 89.99, 15, 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=800', '2026-05-16 23:05:00', 4, 'cat'),
(7, 'Leather Collar', 'Adjustable leather collar for dogs.', 12.99, 30, 'https://images.unsplash.com/photo-1567612529009-afe25813a308?w=800', '2026-05-16 23:05:00', 3, 'dog'),
(8, 'Reflective Leash', 'Strong reflective leash for safe evening walks.', 19.90, 45, 'https://images.unsplash.com/photo-1534361960057-19889db9621e?w=800', '2026-05-16 23:05:00', 3, 'dog'),
(9, 'Dog Rain Jacket', 'Light waterproof jacket for rainy walks.', 39.90, 22, 'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?w=800', '2026-05-16 23:05:00', 3, 'dog'),
(10, 'Scratch Post', 'Durable sisal scratching post for indoor cats.', 27.50, 40, 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=800', '2026-05-16 23:05:00', 4, 'cat'),
(11, 'Cozy Cat Bed', 'Soft washable bed for naps and comfort.', 34.90, 33, 'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=800', '2026-05-16 23:05:00', 4, 'cat'),
(12, 'Rope Toy', 'Durable chew rope toy for dogs.', 8.99, 100, 'https://images.unsplash.com/photo-1535268647677-300dbf3d78d1?w=800', '2026-05-16 23:05:00', 5, 'dog'),
(13, 'Feather Wand', 'Interactive feather wand for cats.', 6.50, 120, 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=800', '2026-05-16 23:05:00', 5, 'cat'),
(14, 'Treat Puzzle', 'Puzzle feeder that keeps pets mentally active.', 24.90, 38, 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=800', '2026-05-16 23:05:00', 5, 'dog'),
(15, 'Bird Seed Mix', 'Vitamin-rich seed mix for small birds.', 11.90, 55, 'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?w=800', '2026-05-16 23:05:00', 6, 'bird'),
(16, 'Bird Swing Perch', 'Wooden swing perch for cages.', 13.50, 28, 'https://images.unsplash.com/photo-1522926193341-e9ffd686c60f?w=800', '2026-05-16 23:05:00', 6, 'bird'),
(17, 'Fish Flakes', 'Daily flake food for aquarium fish.', 7.90, 70, 'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?w=800', '2026-05-16 23:05:00', 6, 'fish'),
(18, 'Aquarium Plant Decor', 'Safe decorative plant for aquariums.', 15.90, 35, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', '2026-05-16 23:05:00', 6, 'fish'),
(19, 'Rabbit Hay Feeder', 'Practical hay feeder for rabbits and small pets.', 21.90, 24, 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=800', '2026-05-16 23:05:00', 6, 'rabbit'),
(20, 'Crunchy Cat Treats', 'Crunchy salmon treats for playful cats.', 9.90, 90, 'https://images.unsplash.com/photo-1519052537078-e6302a4968d4?w=800', '2026-05-16 23:05:00', 2, 'cat');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` smallint NOT NULL,
  `comment` longtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 5, 'Excellent quality and fast delivery.', '2026-05-16 23:10:00', '2026-05-16 23:10:00'),
(2, 1, 4, 4, 'Good value for the price.', '2026-05-16 23:11:00', '2026-05-16 23:11:00'),
(3, 6, 3, 5, 'My cat loves it. Very stable and easy to assemble.', '2026-05-16 23:12:00', '2026-05-16 23:12:00'),
(4, 6, 4, 4, 'Nice product, looks good in the living room.', '2026-05-16 23:13:00', '2026-05-16 23:13:00'),
(5, 13, 3, 5, 'Simple toy but very effective.', '2026-05-16 23:14:00', '2026-05-16 23:14:00'),
(6, 17, 4, 4, 'Good daily food for my aquarium.', '2026-05-16 23:15:00', '2026-05-16 23:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `first_name`, `last_name`, `password`, `is_verified`) VALUES
(2, 'admin@sympet.com', '[\"ROLE_ADMIN\"]', 'Admin', 'SymPET', '$2y$13$2b0c1YwY9mVy1FQeRp2RYOsGslfVR2abyjPHjXFZMbThaE/rbSRCa', 1),
(3, 'user@test.com', '[\"ROLE_USER\"]', 'Ahmed', 'Ben Ali', '$2y$13$fIrSJPbOssypY6fRvA0WVeXxP2dwlyVo8jiWQGmnSkuIFtdy7dCP6', 1),
(4, 'ahmedskyzit@gmail.com', '[]', 'Ahmed', 'LAHBIB', '$2y$13$B2Uf07cwuc.0NR1YtkTIK.QyZ73rtgEZFQIg3QCl34AL6SiUN/d/G', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE58EE1A15A2E17` (`customer_order_id`),
  ADD KEY `IDX_9CE58EE14584665A` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_product_user_review` (`product_id`,`user_id`),
  ADD KEY `IDX_1B3FC0624584665A` (`product_id`),
  ADD KEY `IDX_1B3FC062A76ED395` (`user_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9CE58EE1A15A2E17` FOREIGN KEY (`customer_order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_review`
--
ALTER TABLE `product_review`
  ADD CONSTRAINT `FK_5E4296F64584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5E4296F6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
