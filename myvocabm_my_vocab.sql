-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 03, 2025 at 05:44 AM
-- Server version: 8.0.40-cll-lve
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myvocabm_my_vocab`
--

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20240318025309-create-user.js'),
('20240318025319-create-vocab.js'),
('20240318025325-create-type-vocab.js');

-- --------------------------------------------------------

--
-- Table structure for table `TypeVocabs`
--

CREATE TABLE `TypeVocabs` (
  `id` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TypeVocabs`
--

INSERT INTO `TypeVocabs` (`id`, `type`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'Noun (Kata Benda)', 'Noun atau kata benda digunakan untuk nama orang, benda, hewan, tempat, dan ide atau konsep. Noun sendiri dapat dibagi lagi ke berbagai jenis, seperti countable, uncountable / mass, common, proper, concrete, abstract, dan collective noun.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(2, 'Pronoun (Kata Ganti)', 'Pronoun adalah kata yang digunakan untuk menggantikan noun. Terdapat 8 jenis pronoun, yaitu personal, demonstrative, interrogative, indefinite, possessive, reciprocal, relative, reflexive, dan intensive pronoun.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(3, 'Verb (Kata Kerja)', 'Verb adalah kata kerja yang digunakan untuk menunjukkan tindakan atau keadaan. Verb dapat dibagi ke dalam beberapa jenis, seperti action verb dan linking verb.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(4, 'Adjective (Kata Sifat)', 'Adjective adalah kata sifat yang digunakan untuk memberi keterangan pada noun atau pronoun.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(5, 'Adverb (Kata Keterangan)', 'Sebagai kata keterangan, fungsi adverb adalah untuk memberikan keterangan tambahan pada verb, adjective, atau adverb itu sendiri. Adverb juga bisa dikelompokkan menjadi beberapa jenis, seperti manner, degree, frequency, place, dan time.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(6, 'Preposition (Kata Depan)', 'Fungsi preposition adalah untuk menunjukkan hubungan antara noun dan kata-kata lainnya dalam sebuah kalimat.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(7, 'Conjunction (Kata Hubung)', 'Conjunction digunakan untuk menghubungkan dua kata, frasa, klausa hingga kalimat. Terdapat 3 jenis conjuction, yaitu coordinating, subordinating, dan correlative conjuction.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(8, 'Interjection (Kata Seru)', 'Jenis kata yang satu ini biasanya digunakan untuk mengungkapkan emosi.', '2024-03-19 14:54:19', '2024-03-19 14:54:19'),
(9, 'Phrase', 'A phrase is a group of words forming a part of a sentence', '2024-03-19 22:30:39', '2024-03-19 22:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `email`, `password`, `fullname`, `profile`, `createdAt`, `updatedAt`) VALUES
(1, 'farhan@gmail.com', '$2a$10$jf5KCM7cLLQYVZ/KiRpPz.eYKXd8pulKXf/1t7xgNwIfixcFbfzqm', 'Farhan Fadhilah', './public/1705075266918676307.jpg', '2024-01-12 16:01:06', '2024-01-12 16:01:06'),
(2, 'test@gmail.com', '$2b$10$IlMLMjg2WWrC5I3p95HrwOqWs1VZ4AyQXbKcbQelheWPun9atUwzO', 'frierien', '04a8d93d-6b93-4241-b.jpg', '2024-03-19 15:16:00', '2024-03-19 15:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `Vocabs`
--

CREATE TABLE `Vocabs` (
  `id` int NOT NULL,
  `idUser` int DEFAULT NULL,
  `idType` int DEFAULT NULL,
  `vocab` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vocabs`
--

INSERT INTO `Vocabs` (`id`, `idUser`, `idType`, `vocab`, `translation`, `variation`, `note`, `createdAt`, `updatedAt`) VALUES
(6, 1, 3, 'Regret', 'Menyesali', '- regret (v1) \n- regretted (v2) \n- regretted (v3) ', 'Example sentence :\n- he regretted to not turn off the AC yesterday. Now he have to pay the bill\n- do you ever regret to brake up with her? \n', '2024-01-18 10:38:13', '2024-01-18 10:38:13'),
(7, 1, 3, 'Insist', 'Bersikeras', '- Insist (v1) \n- Insisted (v2) \n- Insisted (v3) \n', 'Example sentence :\n- okay then if you insist (Futari) \n- do you insist to stay in the office where can\'t pay your salary enough? ', '2024-01-17 14:03:22', '2024-01-17 14:03:22'),
(8, 1, 3, 'Persist', 'Bertahan / Bersikeras', '- Persist (v1) \n- Persisted (v2) \n- Persisted (v3) ', 'Example sentence :\n- If the symtoms persist for more than a few days, i recommend to go to hospital\n- She persisr to stay there until last time of her life', '2024-01-17 14:10:27', '2024-01-17 14:10:27'),
(9, 1, 4, 'Persistent', 'Gigih', '- Persistently : terus menerus', 'Example sentence :\n- Persistent to finish the task today\n- I can\'t take much more of this persistent error', '2024-01-17 14:16:27', '2024-01-17 14:16:27'),
(10, 1, 5, 'Eventually', 'Pada akhirnya', '-', 'Example sentence :\n- Eventually, I was able to finish the ticket before it\'s time to go home \n- The system slow down and eventually died', '2024-01-17 14:21:12', '2024-01-17 14:21:12'),
(11, 1, 1, 'Coincidence', 'Kebetulan', '-', 'Example sentence :\n- What a coincidence, i wasn\'t expecting to see you here! \n- it is not coincidence that all of the guest are women', '2024-01-17 14:23:55', '2024-01-17 14:23:55'),
(12, 1, 3, 'Tend', 'Cenderung', '- Tend (v1) \n- Tended (v2) \n- Tended (v3) ', 'Example sentence :\n1. I tended to resign from my precious office because of the rule that i can\'t use the money from riba things\n2. does it tend to explode if you add some water ? ', '2024-01-17 14:29:25', '2024-01-17 14:29:25'),
(13, 1, 4, 'Dull ', 'Membosankan / Kusam / Pudar', '-', 'Example sentence :\n- his hair looks dull (kusam) \n- you\'re dull ', '2024-01-17 14:33:02', '2024-01-17 14:33:02'),
(14, 1, 4, 'Imperceptive', 'Tidak peka', '-', 'Example sentence :\n- you\'re smart but imperceptive\n- Did you see old woman fall from her bike? if yes why you didn\'t help her? you\'re really imperceptive person', '2024-01-17 14:34:51', '2024-01-17 14:34:51'),
(15, 1, 3, 'Distinguish', 'Membedakan', '- Distinguish (v1) \n- Distinguished (v2) \n- Distinguished (v3) ', 'Example sentence :\n- we still hard to distinguish the quintuplets\n- How can you distinguish the tank category? as far as i know it\'s looks same', '2024-01-18 14:51:21', '2024-01-18 14:51:21'),
(16, 1, 3, 'Desire', 'Menginginkan', '- Desire (v1) \n- Desired (v2) \n- Desired (V3) ', 'Example sentence :\n- To be honest, i really desire to take a holiday this weekend, because lately i\'ve got a ton of task that make me overwhelming \n- The decisions took because of  his desire to bring peace in this world', '2024-01-18 14:57:03', '2024-01-18 14:57:03'),
(17, 1, 3, 'Urge', 'Keinginan / Ingin sekali', '- Urge (v1) \n- Urged (v2) \n- Urged (v3) \n', 'urge can be as noun or verb. \nExample sentence :\n- He urged her to stay with us at least until the rain stop\n- The urge for revenge\n\n', '2024-01-28 22:37:57', '2024-01-28 22:37:57'),
(18, 1, 6, 'Despite', 'Meskipun', '-', 'Example sentence :\n- Despite his home is far from the office, he always comes on time', '2024-01-18 15:11:47', '2024-01-18 15:11:47'),
(19, 1, 3, 'Encounter', 'Menghadapi / Bertemu', '- Encounter (v1) \n- Encountered (v2) \n- Encountered (v3) ', 'Example sentence :\n- I encountered hard situation last friday\n- Does he encounter a hard situation last friday? ', '2024-01-21 03:21:34', '2024-01-21 03:21:34'),
(20, 1, 3, 'Reveal', 'Mengungkapkan ', '- Reveal (v1) \n- Revealed (v2) \n- Revealed (v3) \n', 'Example sentence :\n- I have revealed your true form\n- Does he already reveal the thief? ', '2024-01-21 04:54:02', '2024-01-21 04:54:02'),
(21, 1, 3, 'Endure', 'Menahan', '- Endure (v1) \n- Endured (v2) \n- Endured (v3) ', 'Example sentence :\n- I always endure to say this, but now i can\'t. I have to say it frankly now\n- Did you endure it? just say it directly to me now ', '2024-01-21 10:16:33', '2024-01-21 10:16:33'),
(22, 1, 5, 'Hereby', 'Dengan ini', '-', 'Example sentence :\n- I hereby declere to propose someone to be my wife\n- I hereby pronounce you man and wife', '2024-01-21 10:22:17', '2024-01-21 10:22:17'),
(23, 1, 3, 'Obtain', 'Memperoleh', '- Obtain (v1) \n- Obtained (v2) \n- Obtained (v3) ', 'Example sentence :\n- I have been obtain something great today, that is new reference and experience from my friend\n- Do you obtain any customer today? ', '2024-01-22 12:07:14', '2024-01-22 12:07:14'),
(24, 1, 3, 'Intend', 'Bermaksud', '- Intend (v1) \n- Intended (v2) \n- Intended (v3) ', 'Example sentence :\n- The system intend to give you information by sending an message\n- Do you intend to porpose my daughter today? ', '2024-01-22 12:12:27', '2024-01-22 12:12:27'),
(25, 1, 3, 'Encourage', 'Mendorong', '- Encourage (v1) \n- Encouraged (v2) \n- Encouraged (v3) \n', 'Example sentence :\n- I need encouragement from someone\n- I think the new regulation will encourage people to invest', '2024-01-22 12:17:29', '2024-01-22 12:17:29'),
(26, 1, 3, 'Prevent', 'Mencegah', '- Prevent (v1) \n- Prevented (v2) \n- Prevented (v3) ', 'Example sentence :\n- I prevent my phone being stolen by hiding in the pocket\n- I have prevented her to go out tonight', '2024-01-22 14:33:19', '2024-01-22 14:33:19'),
(27, 1, 3, 'Enchant', 'Mempesona', '- Enchant (v1) \n- Enchanted (v2) \n- Enchanted (v3)', 'Example sentence :\n- Wow the flowers has been enchanting people for 2 years\n- am i enchanting in your eyes? \n', '2024-01-22 14:40:57', '2024-01-22 14:40:57'),
(28, 1, 1, 'Victim', 'Korban', '-', 'Example sentence :\n- I saw the news about gaza yesterday. I felt so sad because there are a lot innocent victim ', '2024-01-22 14:46:48', '2024-01-22 14:46:48'),
(29, 1, 3, 'Cherish', 'Menghargai', '- Cherish (v1) \n- Cherised (v2) \n- Cherised (v3) ', 'Example sentence :\n- aww thank you for the gift. i\'ll cherish it \n- Did you cherish about the gift that have been given to you? ', '2024-01-22 14:49:25', '2024-01-22 14:49:25'),
(30, 1, 3, 'Despair', 'Putus asa', '- Despair (v1) \n- Despaired (v2) \n- Despaired (v3) ', 'Example sentence :\n- You look sad, what happened to you? \n- Its okay, i just despaired about my decision last night, I think my decision isn\'t correct', '2024-01-22 14:53:16', '2024-01-22 14:53:16'),
(31, 1, 3, 'Assure', 'Memastikan / Terjamin', '- Assure (v1) \n- Assured (v2) \n- Assured (v3) ', 'Example sentance:\n- I assure you they will be perfectly safe\n- Did you already say to mr jhon yesterday that assure to finish the task before next sprint? \n', '2024-01-26 12:08:06', '2024-01-26 12:08:06'),
(32, 1, 9, 'Rest Assured', 'Yakinlah', '-', 'Example sentence :\n- Outside is fun and wonderful, just hold my hand you will be safe, rest assured', '2024-01-26 12:19:16', '2024-01-26 12:19:16'),
(33, 1, 1, 'Prejudice', 'Prasangka (Noun) / Merugikan (Verb) ', '- Prejudice (v1) \n- Prejudiced (v2) \n- Prejudiced (v3) \n', 'Example sentence :\n- There is widespread projudice against TKA workers in Indonesia (noun) \n- I prejudice she is guilty in this case (verb) ', '2024-01-26 12:25:53', '2024-01-26 12:25:53'),
(34, 1, 3, 'Ensure', 'Memastikan', '- Ensure (v1)\n- Ensured (v2) \n- Ensured (v3) ', 'Example sentence :\n- She ensures the customers they will be safe as long as they have an assurance\n- This line of code ensure to protect from overlap bottomSlider in JMO app', '2024-01-26 12:28:59', '2024-01-26 12:28:59'),
(35, 1, 1, 'Crop', 'Tanaman', '-', 'Example sentence :\n- Look at there! there are a lot of crops\n- My mother really love to plant crop at home', '2024-01-26 12:31:30', '2024-01-26 12:31:30'),
(36, 1, 4, 'Ferocious', 'Ganas', '- Ferociousness (Keganasan) ', 'Example sentence :\n- A ferocious wind swept the village\n- The shark is ferocious', '2024-01-29 05:48:24', '2024-01-29 05:48:24'),
(37, 1, 4, 'Negligible', 'Dapat diabaikan / Tak Berarti', '-', 'Example sentence :\n- Comments on code can be negligible\n- Actually comments on code can relay an information, so it can\'t be negligible', '2024-01-29 06:10:49', '2024-01-29 06:10:49'),
(38, 1, 1, 'Witness', 'Saksi / Bukti / Menyaksikan (Verb) ', '- Witness (v1) \n- Witnessed (v2) \n- Witnessed (v3) ', 'Example sentence :\n- Anyone who witnessed the attack should call the police (verb) \n-  Witnesses to the crash say they saw an explosion just before the disaster. (noun) ', '2024-01-29 06:16:27', '2024-01-29 06:16:27'),
(39, 1, 1, 'Anvil', 'Landasan', '-', 'Example sentence :\n- They are trained on the anvil of experience.\n- I think the anvil must be made of asphalt', '2024-01-29 06:19:11', '2024-01-29 06:19:11'),
(40, 1, 4, 'Fearful', 'Takut', '- ', 'Example sentence :\n- I felt fearful for my life\n- They were understandably fearful about the future', '2024-01-29 06:22:44', '2024-01-29 06:22:44'),
(41, 1, 1, 'Affection', 'Kasih Sayang', '-', 'Example sentence :\n- I will give all my affection to my family', '2024-01-30 09:51:29', '2024-01-30 09:51:29'),
(42, 1, 9, 'Bid Farewell', 'Mengucapkan selamat tinggal', '-', 'Example sentence :\n- have you bid farewell to her? \n- In resigning, he bid farewell to one of my friends', '2024-01-30 09:55:49', '2024-01-30 09:55:49'),
(43, 1, 3, 'Accuse', 'Menuduh', '- Accuse (v1) \n- Accused (v2) \n- Accused (v3) ', 'Example sentence :\n- Did you accuse me because of your fault? \n- He was accused of stealing the money\n', '2024-01-30 09:58:10', '2024-01-30 09:58:10'),
(44, 1, 3, 'Persuade', 'Membujuk / Mengajak', '- Persuade (v1) \n- Persuaded (v2) \n- Persuaded (v3) \n', 'Example sentence :\n- He persuaded his friend to go back to school\n- I am not easily persuaded', '2024-01-30 10:01:04', '2024-01-30 10:01:04'),
(45, 1, 3, 'Accomplish', 'Menyelesaikan', '- Accomplish (v1) \n- Accomplished (v2) \n- Accomplished (v3) ', 'Example sentence :\n- I already accomplished the task last night', '2024-01-30 10:04:19', '2024-01-30 10:04:19'),
(46, 1, 4, 'Clumsy', 'Canggung / Kikuk', '-', 'Example sentence :\n- Its gonna be clumsy', '2024-01-31 09:07:32', '2024-01-31 09:07:32'),
(47, 1, 3, 'Scent / Smell', 'Mencium (v)/ Aroma (n) / Bau (n) ', '- Scent (v1) \n- Scented (v2) \n- Scented (v3) \n- Smell (v1) \n- Smelt (v2) \n- Smelt (v3) ', 'Example sentence :\n- The flower has a wonderfull scent (noun) \n- The dog scented a rabit (verb) \n', '2024-01-31 09:12:44', '2024-01-31 09:12:44'),
(48, 1, 3, 'Devote', 'Mendedikasikan / Setia', '- Devote (v1) \n- Devoted (v2) \n- Devoted (v3) ', 'Example sentence :\n- he really devote to the company\n- do you devote to our company? ', '2024-01-31 09:14:19', '2024-01-31 09:14:19'),
(49, 1, 1, 'Treasury', 'Perbendaharaan / Kas', '-', 'Example sentence :\n- Our treasury is managed with carefully', '2024-01-31 09:15:32', '2024-01-31 09:15:32'),
(50, 1, 3, 'Settle', 'Menetap', '- Settle (v1) \n- Settled (v2) \n- Settled (v3) ', 'Example sentence :\n- it\'s a convinience place, lets settle here', '2024-01-31 09:17:09', '2024-01-31 09:17:09'),
(51, 1, 3, 'Unsettle', 'Meresahkan / Mengganggu Ketenangan', '- Settle (v1) \n- Unsettled (v2) \n- Unsettled (v3) \n', 'Example sentence :\n- My neighbour it\'s so annoying, because he unsettles me at night with his sound', '2024-02-01 09:11:09', '2024-02-01 09:11:09'),
(52, 1, 3, 'Owe', 'Hutang', '- Owe (v1) \n- Owed (v2) \n- Owed (v3) ', 'Example sentence :\n- I owe you\n- Did you owe with her yesterday? ', '2024-02-01 09:12:28', '2024-02-01 09:12:28'),
(53, 1, 1, 'Superstition', 'Takhayul', '-', 'Example sentence :\n- Do you believe with superstition? \n- I saw him last night and he did something suspecious. In my opinion, he believed to superstition thing', '2024-02-01 09:16:40', '2024-02-01 09:16:40'),
(54, 1, 1, 'Treasure', 'Harta Karun (n) / Menghargai (v) ', '-', 'Example sentence :\n- You\'re really beautiful, please treasure you\'re self', '2024-02-01 09:18:46', '2024-02-01 09:18:46'),
(55, 1, 4, 'Ominous', 'Yang tidak menyenangkan', '-', 'Example sentence :\n - My neighbour did ominous things yesterday', '2024-02-01 09:19:45', '2024-02-01 09:19:45'),
(56, 1, 4, 'Pleasant', 'Menyenangkan', '- Unpleasant (tidak menyenangkan) ', 'Example sentence :\n- She is very friendly and pleasant presenter', '2024-02-06 08:59:25', '2024-02-06 08:59:25'),
(57, 1, 3, 'Divert', 'Mengalihkan', '- Divert (v1)\n- Diverted (v2) \n- Diverted (v3) ', 'Example sentence :\n- I devert the topic in the forum\n- Police diverted traffic to a side street', '2024-02-06 09:01:13', '2024-02-06 09:01:13'),
(58, 1, 3, 'Chant', 'Nyanyian (n) / Menyanyi (v) ', '- Chant (v1)\n- Chanted (v2) \n- Chanted (v3) ', 'Example sentence :\n- they chanted \"sara, sara\" until she came back to the stage\n- Protesters were chanting outside of governor\'s home', '2024-02-06 09:03:51', '2024-02-06 09:03:51'),
(59, 1, 3, 'Gloat', 'Melihat dengan tamak / Sombong', '- Gloat (v1) \n- Gloated (v2) \n- Gloated (v3) ', 'Example sentence:\n- When they have something to gloat about they are happy\n- The leaders of the campaign will gloat over what they have achieved', '2024-02-06 09:06:28', '2024-02-06 09:06:28'),
(60, 1, 3, 'Gain', 'Memperoleh', '- Gain (v1) \n- Gained (v2) \n- Gained (v3) ', 'Example sentence :\n- I gained this achievement because of my parent\n- she gained her goal to get a scholarship', '2024-02-06 09:08:07', '2024-02-06 09:08:07'),
(61, 1, 3, 'Fracture / Break', 'Patah', '- Fracture (v1) \n- Fractured (v2) \n- Fractured (v3) \n- Break (v1) \n- Broke (v2) \n- Broken (v3) ', 'Example sentence :\n- You have fractured your ribs. you have to take care immediately\n', '2024-02-07 11:03:11', '2024-02-07 11:03:11'),
(62, 1, 1, 'Dignity', 'Harga diri', '-', 'Example sentence :\n- we cant let them insult our dignity', '2024-02-07 11:04:46', '2024-02-07 11:04:46'),
(63, 1, 1, 'Trident', 'Trisula', '-', 'Example sentence :\n- One of rudeus friend has a trident to defeat their enemies', '2024-02-07 11:06:19', '2024-02-07 11:06:19'),
(64, 1, 4, 'Ruthless', 'Kejam', '-', 'Example sentence :\n- The enemies are ruthless, they even don\'t hesitate to steal our treasure', '2024-02-07 11:09:21', '2024-02-07 11:09:21'),
(65, 1, 3, 'Restrain', 'Menahan', '- Restrain (v1)\n- Restrained (v2) \n- Restrained (v3) ', 'Example sentence :\n- I restrain my self for a long time a go to not reveal her mistake', '2024-02-07 11:10:58', '2024-02-07 11:10:58'),
(66, 1, 4, 'Intentional', 'Disengaja', '-', 'Example sentence :\n- It\'s not intentional', '2024-02-12 15:37:01', '2024-02-12 15:37:01'),
(67, 1, 3, 'Glimpse', 'Melihat sekilas', '- Glimpse (v1) \n- Glimpsed (v2)\n- Glimpsed (v3) ', 'Example sentence :\n- he glimpsed a figure standing in the shade(naungan) ', '2024-02-12 15:40:20', '2024-02-12 15:40:20'),
(68, 1, 3, 'Bargain', 'Tawar-menawar (n) / Berdagang (v) ', '- Bargain (v1) \n- Bargained (v2) \n- Bargained (v3) ', 'Example sentence :\n- do you already bargain the price before buy it? (v) ', '2024-02-12 22:18:36', '2024-02-12 22:18:36'),
(69, 1, 3, 'Conjure', 'Menyulap', '- Conjure up (Membayangkan) \n- Conjure (v1) \n- Conjured (v2) \n- Conjured (v3) ', 'Example sentence :\n- You have to be able to conjure up, how to do things and pull out of your brain', '2024-02-13 07:58:09', '2024-02-13 07:58:09'),
(70, 1, 3, 'Absorb', 'Menyerap', '- Absorb (v1) \n- Absorbed (v2) \n- Absorbed (v3) \n', 'Example sentence :\n- The crop absorbs a lot of carbon dioxide', '2024-02-13 08:00:39', '2024-02-13 08:00:39'),
(71, 1, 3, 'Acquire', 'Mendapatkan', '- Acquire (v1) \n- Acquired (v2) \n- Acquired (v3) ', 'Example sentence :\n- We must acquire a power to revenge those robots', '2024-03-01 15:09:17', '2024-03-01 15:09:17'),
(72, 1, 3, 'Avert / Avoid', 'Mencegah', '- Avoid (v1) \n- Avoided (v2)\n- Avoided (v3) \n', 'Example sentence :\n- He managed to avoid the pothole (lubang dijalan) last night ', '2024-02-16 09:06:55', '2024-06-04 13:00:53'),
(73, 1, 5, 'Vague ', 'Tidak jelas / Samar-samar / kabur', '- Vaguely (samar-samar) \n- obscure (samar) ', 'Example sentence :\n- I vaguely remembered having met her before', '2024-02-17 22:26:52', '2024-02-17 22:26:52'),
(74, 1, 3, 'Tear', 'Merobek', '- Tear (v1) \n- Tore (v2) \n- Torn (v3) ', 'Example sentence :\n- My sister tore his letter to pieces', '2024-02-17 22:28:41', '2024-02-17 22:28:41'),
(75, 1, 1, 'Tears', 'Air mata', '-', 'Example sentence :\n- Police used tear gas to put the riot down', '2024-02-16 09:14:38', '2024-02-16 09:14:38'),
(76, 1, 3, 'Brace', 'Menguatkan (v) / Penjepit (n) ', '- Brace (v1) \n- Braced (v2) \n- Braced (v3) ', 'Example sentence :\n- The pressure is the reason to brace yourself', '2024-02-19 10:33:57', '2024-02-19 10:33:57'),
(77, 1, 3, 'Intervene ', 'Campur tangan', '- Intervene (v1) \n- Intervened (v2) \n- Intervened (v3) ', 'Example sentence :\n- West countries always intervene another country in the world', '2024-02-19 10:37:41', '2024-02-19 10:37:41'),
(78, 1, 1, 'Intention', 'Niat / Maksud', '- ', 'Example sentence : \n- you have a bad intention inside', '2024-02-19 10:39:38', '2024-02-19 10:39:38'),
(79, 1, 1, 'Leverage', 'Pengaruh / Manfaat', '-', 'Example sentence : \n- This medicine has good leverage to my body', '2024-02-19 10:44:20', '2024-02-19 10:44:20'),
(80, 1, 5, 'Occasionally', 'Kadang', '- Sometimes\n', 'Example sentence :\n- Occasionally in the night, Jakarta has an event', '2024-02-19 10:46:22', '2024-02-19 10:46:22'),
(81, 1, 1, 'Detour', 'Jalan Memutar', '-', 'Example sentence :\n- I will take detour road around town', '2024-02-26 08:56:46', '2024-02-26 08:56:46'),
(82, 1, 4, 'Distinct', 'Berbeda', '- ', 'Example sentence :\n- it is necessary to keep these two issues distinct\n- The two concepts are quite distinct\n- Did you see the scenery of the mountain yesterday? could you be able distinct the tree\'s? ', '2024-02-26 09:01:06', '2024-02-26 09:01:06'),
(83, 1, 4, 'Diverse / Different / Distinct', 'Beragam', '-', 'Example sentence :\n- The opinions of the two factions are quite diverse', '2024-02-26 09:03:51', '2024-02-26 09:03:51'),
(84, 1, 3, 'Differ', 'Berbeda', '- Differ (v1) \n- Differed (v2) \n- Differed (v3) ', 'Example sentence :\n- the quints look alike, but they differ in temprament', '2024-02-26 09:05:37', '2024-02-26 09:05:37'),
(85, 1, 5, 'Allegedly', 'Diduga', '-', 'Example sentence :\n- Allegedly, she was cheating on me', '2024-02-26 09:06:48', '2024-02-26 09:06:48'),
(86, 1, 3, 'Cultivate', 'Mengolah', '- Cultivate (v1) \n- Cultivated (v2) \n- Ctivated (v3) ', 'Example sentence :\n- Chocolate is cultivate as coco powder using modern machine\n- Peoples settled and began to cultivate the land', '2024-02-27 08:54:20', '2024-02-27 08:54:20'),
(87, 1, 3, 'Bestow', 'Memberikan', '- Bestow (v1) \n- Bestowed (v2) \n- Bestowed (v3) \n- Bestower (Maha pemberi nikmat) ', 'Example sentence :\n- Oh Allah, you are bestower, I beg to you the palestinians be able to win of this war', '2024-02-27 08:58:26', '2024-02-27 08:58:26'),
(88, 1, 3, 'Relieve', 'Meredakan', '- Relieve (v1) \n- Relieved (v2) \n- Relieved (v3) ', 'Example sentence :\n- I hope the UN can relieve the conflict between Palestina and Israel', '2024-02-27 09:00:56', '2024-02-27 09:00:56'),
(89, 1, 1, 'Peril / Danger', 'Bahaya', '- Danger\n- Hazard', 'Example sentence :\n- it\'s peril to go so far from the beach, because huge wave will comes ', '2024-02-27 09:04:12', '2024-02-27 09:04:12'),
(90, 1, 3, 'Procure', 'Mendapatkan', '- Procure (v1) \n- Procured (v2) \n- Procured (v3) ', 'Example sentence :\n- Is there anything that i can procure for you? ', '2024-02-27 09:07:37', '2024-02-27 09:07:37'),
(91, 1, 3, 'Preserve', 'Mengawetkan / Melestarikan', '- Preserve (v1) \n- Preserved (v2) \n- Preserved (v3) ', 'Example sentence :\n- We preserve meat for next winter', '2024-02-28 08:50:47', '2024-02-28 08:50:47'),
(92, 1, 1, 'Sieve', 'Saringan', '-', 'Example sentence :\n- We filter the grain with a sieve', '2024-02-28 08:52:21', '2024-02-28 08:52:21'),
(93, 1, 3, 'Fend / Fend Off / Defend', 'Menangkis / Menghidupi / Membela', '- Fend (v1) \n- Fended (v2) \n- Fended (v3) ', 'Example sentence :\n- More women are fending themselves without support of a husband', '2024-02-28 09:19:59', '2024-02-28 09:19:59'),
(94, 1, 3, 'Establish', 'Mendirikan', '- Establish (v1) \n- Establish (v2) \n- Establish (v3) ', 'Example sentence :\n- She established a reputation as hard worker', '2024-02-28 09:22:19', '2024-02-28 09:22:19'),
(95, 1, 3, 'Refrain', 'Menahan diri', '- Refrain (v1) \n- Refrained (v2) \n- Refrained (v3) ', 'Example sentence :\n- dont refrain yourself', '2024-02-28 09:24:49', '2024-02-28 09:24:49'),
(96, 1, 1, 'Conviction', 'Keyakinan / Pengakuan', '-', 'Example sentence :\n- She had a firm conviction(keyakinan yg teguh) that the would meet again in the hereafter', '2024-03-01 08:46:07', '2024-03-01 08:46:07'),
(97, 1, 1, 'Hunch / Feeling', 'Firasat', '-', 'Example sentence :\n- I have bad hunch for tomorrow, because he already went to Palembang yesterday', '2024-03-01 08:47:40', '2024-03-01 08:47:40'),
(98, 1, 3, 'Utter', 'Mengucapkan / Menyuarakan', '- Utter (v1) \n- Utter (v2) \n- Utter (v3) ', 'Example sentence :\n- They departed without uttering a word', '2024-03-01 08:50:04', '2024-03-01 08:50:04'),
(99, 1, 4, 'Hostile', 'Agresif / Bermusuhan', '-', 'Example sentence :\n- Their hostile looks showed that he was unwelcome', '2024-03-01 08:53:59', '2024-03-01 08:53:59'),
(100, 1, 3, 'Lurk / Spy / Hide', 'Mengintai / Bersembunyi', '- Lurk (v1) \n- Lurked (v2) \n- Lurked (v3) ', 'Example sentence :\n- Underneath is the basement, in which a suspicious man is lurking, waiting for his chance to enter the room', '2024-03-01 08:59:13', '2024-03-01 08:59:13'),
(101, 1, 3, 'Rehearse', 'Berlatih / Mengulangi Permainan', '- Rehearse (v1) \n- Rehearsed (v2) \n- Rehearsed (v3) ', 'Example sentence :\n- The band stayed up late rehearsing for the big show', '2024-03-04 05:49:49', '2024-03-04 05:49:49'),
(102, 1, 4, 'Renowned', 'Terkenal', '-', 'Example sentence :\n- The area is renowned for its school', '2024-03-04 05:51:54', '2024-03-04 05:51:54'),
(103, 1, 3, 'Retain', 'Mempertahankan / Menahan / Memelihara', '- Retain (v1) \n- Retained (v2) \n- Retained (v3) ', 'Example sentence :\n- this rice will retain its heat for a good hour', '2024-03-04 05:55:05', '2024-03-04 05:55:05'),
(104, 1, 1, 'Ferocity', 'Keganasan / Kegarangan / Kebuasan / Kekejaman', '-', 'Example sentence :\n- He is renowned in this area for his ferocity', '2024-03-04 05:58:29', '2024-03-04 05:58:29'),
(105, 1, 3, 'Dread', 'Takut / Rasa Takut / Ketakutan / Takut Pada', '- Dread (v1) \n- Dreaded (v2) \n- Dreaded (v3) ', 'Example sentence :\n- Jane was dreading the party', '2024-03-04 06:02:31', '2024-03-04 06:02:31'),
(106, 1, 3, 'Boast / Boastfully', 'Membanggakan / Dengan Sombong', '- Boast (v1) \n- Boasted (v2) \n- Boadted (v3) ', 'Example sentence :\n- She always boast about her informatics knowledge', '2024-03-07 08:40:02', '2024-03-07 08:40:02'),
(107, 1, 4, 'Mere', 'Sekadar / Belaka / Hanya', '- Merely (Saja/Semata) ', 'Example sentence :\n- The tickets are a mere Rp.7000 at the door', '2024-03-07 08:46:18', '2024-03-07 08:46:18'),
(108, 1, 3, 'Shove', 'Mendorong / Menggeser / Menerobos', '- Shove (v1) \n- Shoved (v2) \n- Shoved (v3) ', 'Example sentence :\n- He shoved me into the pool', '2024-03-07 08:48:19', '2024-03-07 08:48:19'),
(109, 1, 3, 'Sever', 'Memotong / Memutuskan / Memisahkan', '- Sever (v1) \n- Severed (v2) \n- Severed (v3) ', 'Example sentence :\n- The activists are asking the goverment to sever all diplomatic relations with the country', '2024-03-07 08:51:45', '2024-03-07 08:51:45'),
(110, 1, 3, 'Elaborate', 'Menguraikan', '- Elaborate (v1) \n- Elaborated (v2) \n- Elaborated (v3) ', 'Example sentence :\n- can you elaborate the case to me? ', '2024-03-07 08:53:52', '2024-03-07 08:53:52'),
(111, 1, 4, 'Vibrant', 'Bersemangat / Bergetar', '-', 'Example sentence :\n- She has vibrant personality', '2024-03-07 08:55:03', '2024-03-07 08:55:03'),
(112, 1, 3, 'Revive', 'Membangkitkan / Menghidupkan / Menghidupkan Kembali', '- Revive (v1) \n- Revived (v2) \n- Revived (v3) ', 'Example sentence :\n- The success of the movie has revived her career', '2024-03-13 05:45:29', '2024-03-13 05:45:29'),
(113, 1, 4, 'Imprudent', 'Lalai', '-', 'Example sentence :\n- The banks made hunders of imprudent loans in the 1970s (imprudent loans = pinjaman yg tidak bijaksana) \n- It would be imprudent to rely on it for ever', '2024-03-13 09:16:50', '2024-03-13 09:16:50'),
(114, 1, 1, 'Occasion', 'Kesempatan', '-', 'Example sentence :\n- Perhaps there will be another occasion', '2024-03-13 09:26:59', '2024-03-13 09:26:59'),
(115, 1, 3, 'Paddle', 'Mendayung', '- Paddle (v1) \n- Paddled (v2) \n- Paddled (v3) ', 'Example sentence :\n- She paddled our canoe across the lake this morning', '2024-03-13 09:38:13', '2024-03-13 09:38:13'),
(116, 1, 2, 'Whatsoever', 'Sama sekali / Apa pun / Apa saja', '- anything\n- whatever', 'Example sentence :\n- He has no respect for authority whatsoever (sama sekali) \n- All things whatsoever ye(you) would that men should do to you, do you even so to them', '2024-03-14 11:06:27', '2024-03-14 11:06:27'),
(117, 1, 3, 'Convince', 'Meyakinkan', '- Convince (v1) \n- Convinced (v2) \n- Convinced (v3) \n', 'Example sentence :\n- Parliament convinced the protesters of the demand', '2024-03-14 14:31:30', '2024-03-14 14:31:30'),
(118, 1, 3, 'Abide', 'Patuh / Tunduk / Tinggal', '- Abide (v1) \n- Abided (v2) \n- Abided (v3) ', 'Example sentence :\n- We have to abide by the rules', '2024-03-14 14:33:31', '2024-03-14 14:33:31'),
(119, 1, 1, 'Prostration', 'Sujud', '-', 'Example sentence :\n- Almost all the words for worship are about bowing down or prostation', '2024-03-15 14:35:01', '2024-03-15 14:35:01'),
(120, 1, 1, 'Tendency', 'Kecenderungan', '-', 'Example sentence :\n- He has a tendency to forget things', '2024-03-14 14:39:32', '2024-03-14 14:39:32'),
(121, 1, 3, 'Tidy Up / Tidy', 'Merapikan', '- Tidy (v1) \n- Tidied (v2) \n- Tidied (v3) ', 'Example sentence :\n- lets tidy up our code ', '2024-03-23 07:37:46', '2024-03-23 07:37:46'),
(122, 1, 4, 'Neat', 'Rapi', '-', 'Example sentence :\n- our code is pretty neat, next step we\'re gonna sever ViewController into several parts using extension', '2024-03-23 07:40:43', '2024-03-23 07:40:43'),
(123, 1, 4, 'Sufficient', 'Memadai / Mencukupi', '-', 'Example sentence :\n- Our needs are sufficient', '2024-03-23 07:43:13', '2024-03-23 07:43:13'),
(124, 1, 4, 'ingenious', 'Terampil / Berbakat / Pandai', '- Skilled\n- Clever \n- Talented', 'Example sentence :\n- Thanks to ingenious person who have made efficient and fast processors in macbook laptop', '2024-03-23 07:54:29', '2024-03-23 07:54:29'),
(125, 1, 5, 'Roughly / Approximately', 'Kira - Kira / Sekitar', '- ', 'Example sentence :\n- In 2006, roughly a billion people had access to the internet', '2024-03-23 07:59:36', '2024-03-23 07:59:36'),
(126, 1, 1, 'Appointment', 'Janji temu', 'None', 'example sentence :\r\n- I make appointment with ms Katri to conduct the class tomorrow', '2024-03-23 15:12:56', '2024-03-23 15:12:56'),
(127, 1, 3, 'Follow Up', 'Menindaklanjuti', '- Follow up (v1) \r\n- Followed up (v2) \r\n- Followed up (v3) ', 'example sentence \r\n- active : she followed up about kiosk project but her IT head didnt response to her\r\n- passive : Kiosk project has beeen followed up by her, because it has been stuck for 3 months', '2024-03-23 15:12:56', '2024-04-22 05:47:50'),
(128, 1, 1, 'Fortune', 'Harta benda / Nasib', 'Synonym :\r\n- fate\r\n- luck \r\n- wealth (kekayaan) ', 'Example sentence\r\n- I hope this years i will get great fortune', '2024-03-23 15:12:56', '2024-03-23 15:12:56'),
(129, 1, 4, 'Herculean', 'Sangat kuat / sulit dikerjakan', 'Synonym :\r\n- overpowering\r\n- as hard as rock', 'Example sentence :\r\n- I have to lead my team properly, because it is my herculean responsibility (tanggung jawab yang sangat besar) ', '2024-03-23 15:12:56', '2024-03-23 15:12:56'),
(130, 1, 3, 'Perceive', 'Melihat / merasa', '- Perceive (V1) \n- Perceived (V2) \r\n- Perceived (V3) ', 'Example sentence :\r\n- Active : My brain perceive a 20 minute task doesn\'t require a lot of effort\r\n- Passive : a great food from the chef is perceived by food critic', '2024-03-23 15:12:56', '2024-03-24 05:34:47'),
(131, 1, 3, 'Acquiring', 'Mengakuisisi', 'Base from \'acquire\'', 'Example sentence :\n- they were acquiring the bca stock yesterday', '2024-03-24 06:36:22', '2024-03-24 06:36:22'),
(132, 1, 4, 'Genuine', 'Asli / Murni', '-', 'Example sentence :\n- You can get genuine honey on farah store\n- Farah\'s slight smile was more genuine this time', '2024-03-24 06:38:43', '2024-03-24 06:38:43'),
(133, 1, 5, 'Genuinely', 'Benar-benar / Betul-betul', '-', 'Example sentence :\n- he genuinely believes that what he is saying is true', '2024-03-24 06:42:27', '2024-03-24 06:42:27'),
(134, 1, 4, 'Tremendous', 'Luar biasa / Sangat/ Luar biasa besar / Besar Sekali', '-', 'Example sentence :\n- Thank you, i think that would be a tremendous help (sangat membantu) ', '2024-03-24 06:48:44', '2024-03-24 06:48:44'),
(135, 1, 4, 'Numinous', 'Sangat banyak', '-', 'Example sentence :\n- I have numinous thoughts', '2024-03-24 06:52:02', '2024-03-24 06:52:02'),
(136, 1, 4, 'Numerous', 'Banyak Sekali', '-', 'Example sentence :\n- He has attended numerous meeting and social events', '2024-03-26 05:42:44', '2024-03-26 05:42:44'),
(137, 1, 4, 'Enormous', 'Sangat Besar / Besar Sekali / Hebat', '-', 'Example sentence :\n- The possibilities are enormous', '2024-03-26 05:44:31', '2024-03-26 12:20:28'),
(138, 1, 4, 'Outrageous / Embarrassing', 'Memalukan ', '-', 'Example sentence :\n- They will be punished for their outregeous behavior', '2024-03-26 05:46:43', '2024-03-26 12:20:38'),
(139, 1, 3, 'Amuse', 'Menghibur / Menawan', '- Amuse (v1) \n- Amused (v2) \n- Amused (v3) \n', 'Example sentence :\n- The was amused by the teather yesterday', '2024-03-26 05:54:42', '2024-03-26 05:54:42'),
(140, 1, 3, 'Procrastinate / Procrastination(n) ', 'Penundaan', '- Procrastinate (v1) \n- Procrastinated (v2) \n- Procrastinated (v3) ', 'Example sentence : \n- She always proscratinate the course ', '2024-03-26 12:27:54', '2024-03-26 12:27:54'),
(141, 1, 3, 'Detain', 'Menahan', '- Detain (v1) \n- Detained (v2) \n- Detained (v3) ', 'Example sentence :\n- He was detained and sent to his parents house', '2024-04-01 10:53:15', '2024-04-01 10:53:15'),
(142, 1, 4, 'Miraculous', 'Ajaib / Menakjubkan', '-', 'Example sentence :\n- he made miraculous recovery after the accident', '2024-04-01 10:56:06', '2024-04-01 10:56:06'),
(143, 1, 3, 'Envelop', 'Menyelimuti / Membungkus / Menyelubungi', '- Envelop (v1) \n- Enveloped (v2) \n- Enveloped (v3) ', 'Example sentence :\n- Clouds enveloped the mountain tops', '2024-04-02 10:59:48', '2024-04-02 10:59:48'),
(144, 1, 3, 'Embark', 'Memulai / Mengambil Bagian', '- Embark (v1) \n- Embarked (v2) \n- Embarked (v3) ', 'Example sentence :\n- I will embarks this things from the beginning', '2024-04-28 11:55:53', '2024-05-12 15:27:33'),
(145, 1, 4, 'Tough', 'Keras', '-', 'Example sentence :\n- The IS-7 armor\'s is too tough to penetrate', '2024-04-28 11:57:31', '2024-04-28 11:57:31'),
(146, 1, 3, 'Deduce / Conclude', 'Menyimpulkan', '- Deduct (v1) \n- Deducted (v2) \n- Deducted (v3) \n', 'Example sentence :\n- Using the evidance available it is possible to deduct quite a lot how these people lived', '2024-06-01 08:16:43', '2024-06-01 12:30:48'),
(147, 1, 3, 'Assess', 'Menilai', '- Assess (v1) \n- Assessed (v2) \n- Assessed (v3) ', 'Example sentence :\n- After the hurricane, officials assessed the town\'s need for aid', '2024-06-01 11:56:21', '2024-06-01 11:56:21'),
(148, 1, 1, 'Courage / Couragement', 'Keberanian', '-', 'Example sentence :\n- Where is my courage? ', '2024-06-01 11:57:28', '2024-06-01 11:57:28'),
(149, 1, 3, 'Masquerade / Disguise', 'Menyamar', '- Masquerade (v1) \n- Masqueraded (v2) \n- Masqueraded (v3) ', 'Example sentence :\n- He masquerade as a doctor and fooled everyone ', '2024-06-01 12:00:39', '2024-06-01 12:00:39'),
(150, 1, 3, 'Disguise', 'Samaran / Menyamarkan', '- Disguise (v1) \n- Disguised (v2) \n- Disguised (v3) ', 'Example sentence :\n- He tried to disguise his voice on the phone but i could tell it was him', '2024-06-01 12:03:51', '2024-06-01 12:03:51'),
(151, 1, 1, 'Procurement / Purchase', 'Pengadaan / Pembelian', '-', 'Example sentence :\n- The head of IT has set procurement of human resources for the project next years ', '2024-06-27 08:57:11', '2024-06-27 08:57:11'),
(152, 1, 1, 'Hindrance / Obstacle', 'Halangan / Hambatan ', '-', 'Example :\n- There are hindrances in the BUMN recruitment', '2024-06-27 08:59:49', '2024-06-27 08:59:49'),
(153, 1, 1, 'Demeanor', 'Sikap', '-', 'Example :\n- I appreciate your calm demeanor', '2024-06-27 09:01:01', '2024-06-27 09:01:01'),
(154, 1, 4, 'Concussed', 'Gegar Otak', '-', 'Example :\n- I hit my head and i was concussed for a few days', '2024-06-27 09:03:16', '2024-06-27 09:06:19'),
(155, 1, 3, 'Possess', 'Memiliki', '- Possess (v1) \n- Possessed (v2) \n- Possessed (v3) ', 'Example :\n- he doesnt possess the skills required to the job', '2024-06-27 09:05:39', '2024-09-27 22:58:10'),
(156, 1, 3, 'Confiscate', 'Menyita', '- Confiscate (v1) \n- Confiscated (v2) \n- Confiscated (v3) ', 'Examples sentence :\n1. Do i need to confiscate the magazine?\n2. I\'ll confiscate this from you', '2024-08-02 10:47:46', '2024-08-02 10:47:46'),
(157, 1, 3, 'Obliterate', 'Melenyapkan / Memusnahkan', '- Obliterate (v1) \n- Obliterated (v2) \n- Obliterated (v3) ', 'Example sentence :\n1. She will obliterate the decency army', '2024-08-02 10:50:08', '2024-08-02 10:50:08'),
(158, 1, 3, 'Deplete', 'Menghabiskan / Menguras', '- Deplete (v1) \n- Depleted (v2) \n- Depleted (v3) ', 'Example sentence :\n1. We completely deplete our savings when we bought our new house\n2. Activities such as logging and mining deplete our natural resources', '2024-08-23 10:46:46', '2024-08-23 10:46:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `TypeVocabs`
--
ALTER TABLE `TypeVocabs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Vocabs`
--
ALTER TABLE `Vocabs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `TypeVocabs`
--
ALTER TABLE `TypeVocabs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Vocabs`
--
ALTER TABLE `Vocabs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
