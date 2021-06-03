-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2021 at 07:30 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `jobseeker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `post_id`, `company_id`, `jobseeker_id`) VALUES
(1, 'first comment on first post', 1, 7, NULL),
(2, 'second comment on first post', 1, 7, NULL),
(3, 'third comment on second post', 2, NULL, 34),
(4, 'fourth comment on second post', 2, NULL, 34),
(5, 'hello comment', 52, NULL, 34),
(6, 'hello comment', 52, NULL, 34),
(7, 'bye', 52, NULL, 34),
(8, 'bye', 52, NULL, 34),
(9, 'bye', 52, NULL, 34),
(10, 'test', 1, NULL, 34),
(11, 'hai', 53, NULL, 34),
(12, '', 53, NULL, 34),
(13, 'test', 55, NULL, 34),
(14, 'test', 55, NULL, 34),
(15, 'test', 55, NULL, 34),
(16, 'hello', 55, NULL, 34),
(17, 'hello', 57, NULL, 34),
(18, 'hai', 59, NULL, 34);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` text NOT NULL,
  `date_of_establishment` date NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `password`, `photo`, `date_of_establishment`, `type`) VALUES
(7, 'hady', 'hady@gmail', '123', 'www.YTS.LT.jpg', '1950-01-01', 'Company'),
(8, 'company112233', 'company@gmail.com', '123', 'www.YTS.LT.jpg', '2000-01-01', 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `company_likes`
--

CREATE TABLE `company_likes` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker`
--

CREATE TABLE `jobseeker` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `type` text NOT NULL,
  `bio` text NOT NULL,
  `job_title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobseeker`
--

INSERT INTO `jobseeker` (`id`, `name`, `email`, `password`, `photo`, `date_of_birth`, `type`, `bio`, `job_title`) VALUES
(8, 'hady raed mohamad', 'hady@gmail.com', '123', 'my_image.png', '1950-01-01', 'Job Seeker', 'kjasnsa dsoandkalsnd pdiasndam', 'Good Title'),
(10, 'Mohamad Elzahaby', 'zaham2@yahoo.com', '123', 'www.YTS.LT.jpg', '1950-05-31', 'Job Seeker', '', ''),
(11, 'a', 'a', 'a', '', '1950-01-01', 'Job Seeker', '', ''),
(13, 'Mohamad Khalid', 'mo@yahoo.com', '123', 'high_frame_rate_tip1.png', '1950-01-01', 'Job Seeker', '', ''),
(14, 'kaim', 'kaim@gmail.com', '123', '', '1965-10-10', 'Job Seeker', '', ''),
(30, 'mo2', 'mo2@gmail.com', '123', '', '1950-01-01', 'Job Seeker', '', ''),
(32, 'name2', 'email2', '123', '', '1950-01-01', 'Job Seeker', '', ''),
(34, 'Mohamad Elzahabyyyyyyy', 'zaham22@yahoo.com', '123', 'my_image.png', '1950-01-01', 'Job Seeker', '', 'Batee5a'),
(37, 'hady hady', 'hadyhady@gmail.com', '123', 'high_frame_rate_tip1.png', '1950-01-01', 'Job Seeker', '', ''),
(39, 'aa', 'aa@gmail.com', 'aa', '', '1950-01-01', 'Job Seeker', '', ''),
(41, 'bbbb', 'bb@gmail.com', 'bbbb', 'logo.png', '1950-01-01', 'Job Seeker', '', ''),
(42, 'hady2', 'hadyzahaby@gmail.com', '123', 'my_image.png', '1965-01-01', 'Job Seeker', 'my bio', 'my title'),
(43, 'hadyzahaby2', 'hadyzahaby2@yahoo.com', '123', 'my_image.png', '2000-01-01', 'Job Seeker', 'Lorem Ipsum', 'Backend Developer');

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker_skill`
--

CREATE TABLE `jobseeker_skill` (
  `id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobseeker_skill`
--

INSERT INTO `jobseeker_skill` (`id`, `jobseeker_id`, `skill_id`) VALUES
(3, 13, 1),
(4, 13, 4),
(7, 13, 6),
(8, 13, 7),
(9, 13, 8),
(10, 13, 9),
(11, 13, 10),
(12, 41, 1),
(13, 41, 4),
(14, 42, 1),
(15, 42, 4),
(16, 8, 1),
(17, 8, 4),
(18, 8, 6),
(19, 43, 1),
(20, 43, 4),
(21, 43, 6),
(22, 34, 11),
(23, 34, 12),
(24, 34, 13),
(25, 34, 14),
(26, 34, 15);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_type` text NOT NULL,
  `receiver_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `text`, `sender_id`, `receiver_id`, `sender_type`, `receiver_type`) VALUES
(1, 'hello first message', 7, 34, 'Company', 'Job Seeker'),
(2, 'hello second message', 34, 7, 'Job Seeker', 'Company'),
(3, 'hello third message', 7, 34, 'Company', 'Job Seeker'),
(4, 'hello fourth message', 34, 7, 'Job Seeker', 'Company'),
(5, 'hello', 34, 7, 'Job Seeker', 'Company'),
(6, 'hello again', 34, 7, 'Job Seeker', 'Company'),
(7, 'hello again', 34, 7, 'Job Seeker', 'Company'),
(8, 'ezayak ya hady', 34, 7, 'Job Seeker', 'Company'),
(9, 'ya zahabyyyy', 7, 34, 'Company', 'Job Seeker'),
(10, 'hello', 34, 10, 'Job Seeker', 'Job Seeker'),
(11, 'hello', 34, 10, 'Job Seeker', 'Job Seeker'),
(12, 'bye', 34, 10, 'Job Seeker', 'Job Seeker'),
(13, 'ezayak ya hady', 34, 7, 'Job Seeker', 'Company'),
(14, 'ahlan', 34, 7, 'Job Seeker', 'Company'),
(15, 'ezayak', 34, 7, 'Job Seeker', 'Company'),
(16, 'aho', 34, 7, 'Job Seeker', 'Company'),
(17, 'hai', 7, 34, 'Company', 'Job Seeker');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `image` text,
  `num_likes` int(11) NOT NULL,
  `jobseeker_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `text`, `image`, `num_likes`, `jobseeker_id`, `company_id`) VALUES
(1, 'first post', NULL, 2, NULL, 7),
(2, 'second post', NULL, 0, 34, NULL),
(44, 'test', NULL, 0, 34, NULL),
(45, 'hello', NULL, 0, 34, NULL),
(46, '', NULL, 0, 34, NULL),
(47, '', NULL, 0, 34, NULL),
(48, 'kareem', NULL, 0, 34, NULL),
(49, 'kareem', NULL, 0, 34, NULL),
(50, 'teeeest', NULL, 0, 34, NULL),
(51, 'teeeest', NULL, -1, 34, NULL),
(52, 'teeeest', NULL, 0, 34, NULL),
(53, 'teeest pooost', NULL, 1, 34, NULL),
(54, '', NULL, 1, 34, NULL),
(55, 'ten ten post', NULL, 13, 34, NULL),
(56, 'hello', NULL, 0, 34, NULL),
(57, 'test post', NULL, 2, 34, NULL),
(58, '', NULL, 0, 34, NULL),
(59, 'hello', NULL, 0, 34, NULL),
(60, 'test post 3', NULL, 0, 34, NULL),
(61, 'last', 'postImages/default.png', 0, 34, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `jobseeker_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `jobseeker_id`, `company_id`) VALUES
(1, 1, NULL, 7),
(7, 54, 34, NULL),
(8, 53, 34, NULL),
(46, 55, 34, NULL),
(52, 56, 34, NULL),
(61, 57, 14, NULL),
(62, 57, 34, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `name`) VALUES
(1, 'Java'),
(4, 'cpp'),
(6, 'python'),
(7, 'skill1'),
(8, 'skill2'),
(9, 'skill3'),
(10, 'someskill'),
(11, 'skill1,skill2,skill3'),
(12, 'skill4'),
(13, 'skill5'),
(14, 'skill6'),
(15, 'skill7');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `companyid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `companyid`) VALUES
(7, 'staff 1', 8),
(8, 'staff2 ', 8),
(9, ' staff3', 8),
(11, 'staff 1', 8),
(12, 'staff2 ', 8),
(13, ' staff3', 8),
(15, 'staff 1', 8),
(16, 'staff2 ', 8),
(17, ' staff3', 8),
(18, 'staff 1', 8),
(19, 'staff4', 8),
(20, 'staff5', 8),
(21, 'staff6', 8),
(22, 'staff 7', 8),
(23, 'staff  8', 8),
(24, 'staff 1', 8),
(25, 'staff2 ', 8),
(26, ' staff3', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_company` (`company_id`),
  ADD KEY `fk_comments_jobseeker` (`jobseeker_id`),
  ADD KEY `fk_comments_posts` (`post_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `company_likes`
--
ALTER TABLE `company_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_likes_company` (`company_id`),
  ADD KEY `fk_company_likes_user` (`user_id`);

--
-- Indexes for table `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `jobseeker_skill`
--
ALTER TABLE `jobseeker_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jobseeker` (`jobseeker_id`),
  ADD KEY `fk_company` (`company_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post` (`post_id`),
  ADD KEY `fk_likes_company` (`company_id`),
  ADD KEY `fk_likes_jobseeker` (`jobseeker_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyid` (`companyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `company_likes`
--
ALTER TABLE `company_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobseeker`
--
ALTER TABLE `jobseeker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jobseeker_skill`
--
ALTER TABLE `jobseeker_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comments_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comments_posts` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_likes`
--
ALTER TABLE `company_likes`
  ADD CONSTRAINT `fk_company_likes_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_likes_user` FOREIGN KEY (`user_id`) REFERENCES `jobseeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobseeker_skill`
--
ALTER TABLE `jobseeker_skill`
  ADD CONSTRAINT `fk_jobseeker_skill_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jobseeker_skill_skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `fk_likes_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_likes_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_company` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
