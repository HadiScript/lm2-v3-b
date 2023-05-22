-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 02:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_files`
--

CREATE TABLE `assignment_files` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `folder_id` char(36) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `stu_id` char(36) NOT NULL,
  `stu_name` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assignment_files`
--

INSERT INTO `assignment_files` (`id`, `folder_id`, `file`, `file_name`, `stu_id`, `stu_name`, `created_at`, `updated_at`) VALUES
('e45a1320-e78b-4c3b-b235-dd8615f12a6f', 'first task', 'https://res.cloudinary.com/dvfpbqemp/raw/upload/v1684750852/vctcwdv5rhmbrnotmskj.sql', 'first assignment complete', '57e0b484-935c-45b3-adcf-fe5170c660b4', 'stu five', '2023-05-22 10:20:52', '2023-05-22 10:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
('2f8c1e7e-69da-4b80-a32f-23d9d62bcd5d', 'AutoCAD', 'autocad', '2023-04-23 13:18:50', '2023-04-23 13:18:50'),
('dabdec3a-58f9-4d14-a3bd-26921e701ce9', 'Designing', 'designing', '2023-04-23 13:19:04', '2023-04-23 13:19:04'),
('ea0a14ea-4fe3-48ec-9eb5-58c6fdb04b9e', 'Development', 'development', '2023-04-23 13:18:41', '2023-04-23 13:18:41'),
('f0538287-46c2-4452-9f44-d1c256f9c436', '3D Max', '3d-max', '2023-04-23 13:18:58', '2023-04-23 13:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `text` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `course_id`, `text`, `created_at`, `updated_at`) VALUES
('142a2058-d782-46a8-8dbe-5875fa81df5e', '406075f1-7ecc-42ae-a905-61b3da4538d1', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', 'useCallback is a React Hook that lets you cache a function definition between re-renders. confusions', '2023-05-22 05:04:49', '2023-05-22 05:04:49'),
('41c10a5d-d2fa-4c62-abb5-bd208c00ae65', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '1b2795ec-fe2c-4e8c-9a0e-e9b7e84f588d', 'hi buddy', '2023-05-22 10:20:08', '2023-05-22 10:20:08'),
('a309428f-0782-4eae-be34-d4dea8222171', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', 'Hello everyone if you have any query related any lesson\nso you can post your comment', '2023-05-22 04:46:54', '2023-05-22 04:46:54'),
('ca3e29eb-51a7-4e58-8a86-f0ff6c4d9341', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', 'helo everyone if you have any query related any lesson... please post your question here', '2023-05-22 10:43:43', '2023-05-22 10:43:43'),
('e32e4378-c396-4e92-ab44-0d14ee367be8', '406075f1-7ecc-42ae-a905-61b3da4538d1', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', 'Ok sire', '2023-05-22 04:48:16', '2023-05-22 04:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) NOT NULL,
  `live_link` varchar(400) DEFAULT NULL,
  `cdId` char(36) NOT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT 0,
  `tuesday` tinyint(1) NOT NULL DEFAULT 0,
  `wednesday` tinyint(1) NOT NULL DEFAULT 0,
  `thursday` tinyint(1) NOT NULL DEFAULT 0,
  `friday` tinyint(1) NOT NULL DEFAULT 0,
  `startingFrom` char(50) NOT NULL,
  `_to` char(50) NOT NULL,
  `slug` char(120) NOT NULL,
  `startingDate` date DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `deactive` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses_teachers`
--

CREATE TABLE `courses_teachers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `checkId` char(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_assets`
--

CREATE TABLE `course_assets` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lecture_name` varchar(255) DEFAULT NULL,
  `lecture_file` varchar(255) DEFAULT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_batch`
--

CREATE TABLE `course_batch` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `batchName` char(100) NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT 0,
  `tuesday` tinyint(1) NOT NULL DEFAULT 0,
  `wednesday` tinyint(1) NOT NULL DEFAULT 0,
  `thursday` tinyint(1) NOT NULL DEFAULT 0,
  `friday` tinyint(1) NOT NULL DEFAULT 0,
  `startingFrom` char(50) NOT NULL,
  `_to` char(50) NOT NULL,
  `course` char(120) NOT NULL,
  `slug` char(120) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `startingDate` date DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `deactive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE `course_details` (
  `id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `latest_price` float DEFAULT NULL,
  `before_price` float DEFAULT NULL,
  `lessons` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `access_time` enum('Lifetime','Three Months','Six Months','1 Year') NOT NULL DEFAULT 'Lifetime',
  `requirements` text DEFAULT NULL,
  `what_you_will_learn` text DEFAULT NULL,
  `who_is_this_course_for` text DEFAULT NULL,
  `userId` char(36) NOT NULL,
  `catId` char(36) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `in_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `in_home_page_set_at` datetime DEFAULT NULL,
  `is_class` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_notice`
--

CREATE TABLE `course_notice` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `heading` char(50) NOT NULL,
  `text` varchar(200) NOT NULL,
  `variant` char(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_progresses`
--

CREATE TABLE `course_progresses` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `finished` tinyint(1) DEFAULT 1,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `videoId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drop_students`
--

CREATE TABLE `drop_students` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_cord` char(36) NOT NULL,
  `stu_name` varchar(100) NOT NULL,
  `stu_email` varchar(100) NOT NULL,
  `joining_date` datetime NOT NULL,
  `course` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrolments`
--

CREATE TABLE `enrolments` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bought_price` float DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_avatar` varchar(255) DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` enum('paid','unpaid') DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `folder_name` varchar(100) NOT NULL,
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `course_id` char(36) NOT NULL,
  `creator_id` varchar(36) NOT NULL,
  `creator_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`folder_name`, `id`, `course_id`, `creator_id`, `creator_name`, `created_at`, `updated_at`) VALUES
('Backend', '345da5f3-47f9-4118-87be-191d9c718ca4', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 04:42:07', '2023-05-22 04:42:07'),
('first assignment', '348a3b70-2ce3-44af-9c57-b8095b174245', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 10:42:33', '2023-05-22 10:42:33'),
('first task', '382fc4b4-1960-4597-b564-50a1d39c2f25', '1b2795ec-fe2c-4e8c-9a0e-e9b7e84f588d', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 10:20:39', '2023-05-22 10:20:39'),
('Integrations', '5d875b70-d9e2-48d3-a854-f31f4f5af316', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 04:42:11', '2023-05-22 04:42:11'),
('JSX - task', 'daab94c9-9051-482f-b784-02fa643bf50a', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 04:41:51', '2023-05-22 04:41:51'),
('React Router & Navigations', 'f13dbd2c-79ae-49e3-859c-5be746cadb91', 'd4c1b0a2-e202-4cb9-9b8f-3405b777d950', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '', '2023-05-22 04:42:03', '2023-05-22 04:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_earnings`
--

CREATE TABLE `instructor_earnings` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `earnings` float DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` enum('due','paid','cancelled') DEFAULT 'due',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `completed` tinyint(1) DEFAULT 0,
  `short_id` int(11) NOT NULL DEFAULT 0,
  `link` varchar(255) NOT NULL,
  `userId` char(36) NOT NULL,
  `courseId` char(36) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `group_name`, `title`, `completed`, `short_id`, `link`, `userId`, `courseId`, `created_at`, `updated_at`) VALUES
('655cc805-0328-4335-a301-9b0e3aa632fc', 'ReactJs', 'lesson 4', 0, 4, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:36', '2023-05-22 10:41:36'),
('7ea14e07-47f7-4d39-abfb-b58d2cb8a7f7', 'ReactJs', 'lesson 8', 0, 8, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:53', '2023-05-22 10:41:53'),
('8834c34b-3b82-4da2-89d1-b8b004dbed2d', 'ReactJs', 'lesson 5', 0, 5, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:40', '2023-05-22 10:41:40'),
('9f9f5f7c-a3a8-449b-bf78-c1071d23919d', 'ReactJs', 'lesson 7', 0, 7, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:49', '2023-05-22 10:41:49'),
('a818b79b-7de9-4af6-ba81-2b4ac751858e', 'ReactJs', 'lesson 3', 0, 3, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:32', '2023-05-22 10:41:32'),
('c56bab61-3694-4445-870b-ad0f6c0f6697', 'ReactJs', 'lesson 6', 0, 6, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:44', '2023-05-22 10:41:44'),
('dcd3e630-323e-4005-b613-fe8e4bfb81ce', 'ReactJs', 'lesson 1', 0, 1, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:15', '2023-05-22 10:41:15'),
('e98e2c41-509d-4a4f-8598-d4111da3a726', 'ReactJs', 'lesson 1', 0, 1, 'The library for web and native user interfaces', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', '1b2795ec-fe2c-4e8c-9a0e-e9b7e84f588d', '2023-05-22 10:19:07', '2023-05-22 10:19:07'),
('f998401d-3882-4eb5-88c1-d65b5126b184', 'ReactJs', 'lesson 2', 0, 2, 'useCallback is a React Hook that lets you cache a function definition between re-renders.', '2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'b66a6c66-3a7b-4319-aba0-cf014605764a', '2023-05-22 10:41:27', '2023-05-22 10:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partner_image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replys`
--

CREATE TABLE `replys` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `text` varchar(700) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220807061714-create-user.js'),
('20220809153209-create-category.js'),
('20220810055344-create-testimonial.js'),
('20220810071953-create-partner.js'),
('20220811031005-create-course.js'),
('20220814043222-create-video.js'),
('20220815063929-create-course-asset.js'),
('20220816105113-create-favourite.js'),
('20220817092028-create-enrolment.js'),
('20220817092044-create-instructor-earning.js'),
('20220821065623-create-course-progress.js'),
('20220822101406-create-subscription.js');

-- --------------------------------------------------------

--
-- Table structure for table `studentbatches`
--

CREATE TABLE `studentbatches` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` char(100) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `batchId` char(100) NOT NULL,
  `checkId` char(75) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students_applications`
--

CREATE TABLE `students_applications` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` char(50) NOT NULL,
  `lastName` char(50) NOT NULL,
  `email` char(100) NOT NULL,
  `phoneNumber` char(13) NOT NULL,
  `address` char(100) NOT NULL,
  `idCard` char(50) NOT NULL,
  `city` char(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `parentName` char(50) NOT NULL,
  `parentOccupations` char(100) NOT NULL,
  `parentPhoneNumber` char(14) NOT NULL,
  `interest` char(200) NOT NULL,
  `wantToAchieve` char(200) NOT NULL,
  `course` char(100) NOT NULL,
  `education` char(100) NOT NULL,
  `gender` char(50) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `rejected` tinyint(1) NOT NULL DEFAULT 0,
  `registered` tinyint(1) NOT NULL DEFAULT 0,
  `isPaid` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` char(150) NOT NULL,
  `enrollTo` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `my_course` varchar(100) DEFAULT NULL,
  `my_batch` char(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reset_password_token` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reset_password_send_at` datetime DEFAULT NULL,
  `reset_password_at` datetime DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `role` enum('student','admin','instructor','cord') DEFAULT 'student',
  `instructor_status` tinyint(1) DEFAULT NULL,
  `instructor_subject` varchar(255) DEFAULT NULL,
  `instructor_description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `is_profile_public` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `batchAssigned` int(36) NOT NULL,
  `batchCourse1` varchar(100) NOT NULL,
  `batchCourse2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `my_course`, `my_batch`, `password`, `gender`, `designation`, `bio`, `profile_photo`, `location`, `phone`, `reset_password_token`, `reset_password_send_at`, `reset_password_at`, `website`, `twitter`, `facebook`, `linkedin`, `youtube`, `role`, `instructor_status`, `instructor_subject`, `instructor_description`, `status`, `is_profile_public`, `created_at`, `updated_at`, `batchAssigned`, `batchCourse1`, `batchCourse2`) VALUES
('2dcd45db-7437-4947-9288-e82277246274', 'hadi', 'raza', 'hadiraza@gmail.com', NULL, '', '$2b$10$4ba7Ra.Q9ITP96bt09uTsuJPGiOSj/IyCTboDQhMFJ9F89lTjwhAK', NULL, NULL, NULL, NULL, NULL, NULL, '5bbd41b6-758c-495a-ace8-a975bc9aba29', '2023-04-30 12:32:02', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, NULL, NULL, 1, 1, '2023-04-30 12:32:02', '2023-04-30 12:32:02', 0, '', ''),
('2e61ea02-440b-4151-9a6c-17d7f9dcee9a', 'mukhtar', 'Ali', 'teacher1@gmail.com', NULL, '', '$2b$10$8WyuUc4CdejpkIyfOcXBnuSHuVvhY6LCl9VELvqrXkOE.kC0raRHm', NULL, NULL, NULL, NULL, NULL, NULL, '72180336-a0f8-40e5-aa5d-6e5a95eb2fed', '2023-04-28 11:44:35', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, NULL, NULL, 1, 1, '2023-04-28 11:44:35', '2023-04-28 11:44:35', 0, '', ''),
('406075f1-7ecc-42ae-a905-61b3da4538d1', 'stu', 'seven', 'stuseven@gmail.com', NULL, '', '$2b$10$56eAEiuBIF2aYhFXdhxQwunjFj/s.tXgcJnech/I/kE9q.UtgJNu.', NULL, NULL, NULL, 'https://res.cloudinary.com/dvfpbqemp/image/upload/v1684729515/rvkuseslcdkpg34pf2my.jpg', NULL, NULL, 'cded75df-49e0-4465-ab4c-b099782edb17', '2023-05-14 11:17:30', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 11:17:30', '2023-05-22 04:32:56', 0, '', ''),
('42073abd-7c48-4ec7-bbe6-c945cf1e30e1', 'stu', 'two', 'stutwo@gmail.com', NULL, '', '$2b$10$gVnqJLY6qOFnQ422FBgbSuX/NqVnl3net.0ckTbMnubTt5qfVoQQu', NULL, NULL, NULL, NULL, NULL, NULL, '7c33a489-d4eb-49e8-be5d-a71e11f6715f', '2023-05-14 06:45:05', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 06:45:05', '2023-05-14 10:39:51', 0, '', ''),
('45718c12-0edc-4871-bc53-13346a5121af', 'stu', 'eight', 'stuseight@gmail.com', NULL, '', '$2b$10$Y/eXtD7HapWmjML1kjQw1ODxkfJI6GmghwHn4qhVZUlsv0APDY/gi', NULL, NULL, NULL, NULL, NULL, NULL, 'ea2d7175-57a1-4537-b706-9ffe118f0cba', '2023-05-14 11:17:38', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 11:17:38', '2023-05-14 11:18:41', 0, '', ''),
('57e0b484-935c-45b3-adcf-fe5170c660b4', 'stu', 'five', 'stufive@gmail.com', NULL, '', '$2b$10$OMc34pBjXZf9Xvq1ucPFee2Y4FvO3TbamBiIqSlijj26LoCXPShMG', NULL, NULL, NULL, 'https://res.cloudinary.com/dvfpbqemp/image/upload/v1684750914/rdboh30gtsnzutkdletz.jpg', NULL, NULL, 'aef71a45-fe08-47dc-bff6-5c63f330e827', '2023-05-14 11:17:12', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 11:17:12', '2023-05-22 10:21:54', 0, '', ''),
('5ddc897c-2ecf-4986-a853-3657876b67fb', 'stu', 'three', 'stuthree@gmail.com', NULL, '', '$2b$10$1XQSL45yVgn9PGMvVGtcweC4IjP0D3nwuWu1PC8SvRnJ2RPViCVxS', NULL, NULL, NULL, NULL, NULL, NULL, '2aa9788d-76e0-4ba2-bc4b-a20fd5303d33', '2023-05-14 06:45:15', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 06:45:15', '2023-05-20 10:05:07', 0, '', ''),
('5e3241cd-8b75-4e0c-bae5-2f3227e4e0bf', 'stu', 'cord', 'stuCord@gmail.com', NULL, '', '$2b$10$LssjL2LsZ0pFKglpvfynTO8ZP.8u7QcQsmSjjUDznxRTloRDrnyq2', NULL, NULL, NULL, NULL, NULL, NULL, '9ba842dd-39a3-4fd7-a00e-a91366293156', '2023-04-28 11:45:21', NULL, NULL, NULL, NULL, NULL, NULL, 'cord', 1, NULL, NULL, 1, 1, '2023-04-28 11:45:21', '2023-04-28 11:45:21', 0, '', ''),
('6d863e67-11d7-45fa-838c-01e4f11321b5', 'stu', 'one', 'stuone@gmail.com', NULL, '', '$2b$10$AcfI.0onv1wXuHjO7pNWguesZuLqGSJHJdpYHqsKuol296b/pVLja', NULL, NULL, NULL, NULL, NULL, NULL, 'cf80b375-eaf3-4a09-9ce4-131f3e6f2e0c', '2023-05-14 06:44:54', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 06:44:54', '2023-05-14 10:39:53', 0, '', ''),
('72b7e9bf-4480-443f-896c-b7f5803b759e', 'stu', 'six', 'stusix@gmail.com', NULL, '', '$2b$10$2eELTNrlzlHYfrhXBX0ieuARz07v0Mxahyh6u6JUAUy2u3Lp1XcBu', NULL, NULL, NULL, NULL, NULL, NULL, '8a149e0f-f362-4bac-957a-ca9d1ee357f2', '2023-05-14 11:17:21', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 11:17:21', '2023-05-14 11:18:33', 0, '', ''),
('94e8b47d-bcb4-4934-a341-78ea2424e895', 'hussain', 'Ali', 'teacher2@gmail.com', NULL, '', '$2b$10$YMkSjx5L.KWx2Bsg3JnYNuLJrDQOfvwsL8VHyiQQSUnGrdcP7t5Ju', NULL, NULL, NULL, NULL, NULL, NULL, '2cc40b8f-3ec6-459b-9d90-b8b9155c4f34', '2023-04-28 11:44:45', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, NULL, NULL, 1, 1, '2023-04-28 11:44:45', '2023-04-28 11:44:45', 0, '', ''),
('aa673f7f-5787-488c-8ceb-4e8d7ae408d6', 'stu', 'nine', 'stunine@gmail.com', NULL, '', '$2b$10$.69opJY.WxCMq30mBe.DPuae3g5qcTnMDruhCrvIBEzxmNETTjyYm', NULL, NULL, NULL, NULL, NULL, NULL, 'd5159c74-9e11-4ee3-bba7-89f3850bea9b', '2023-05-14 11:17:55', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 11:17:55', '2023-05-14 11:18:43', 0, '', ''),
('b1ce919a-ec7c-4421-aecd-4a2beecb40d5', 'stu', 'four', 'stufour@gmail.com', NULL, '', '$2b$10$uA1vZdbcHzBvLdJZ/Mun9eqwP8ORwLOjR5AooexBvow2vMLHcjPZG', NULL, NULL, NULL, NULL, NULL, NULL, 'f8d4dd5e-aa11-40f6-80e1-71f06e627b3a', '2023-05-14 06:45:24', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, NULL, NULL, 1, 1, '2023-05-14 06:45:24', '2023-05-22 10:40:23', 0, '', ''),
('c2e47ab8-3a4f-4f3e-b8b4-8c23f3d6ee2c', 'sualeh', 'ali', 'teacher4@gmail.com', NULL, '', '$2b$10$mhdQaEo8o0R.nBOGojluQOOu8W0pFnk6M9Z3dIUKUnjDCqGjWDgYy', NULL, NULL, NULL, NULL, NULL, NULL, '98505402-af5c-4bdd-b87e-d1762a938924', '2023-04-28 11:47:14', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, NULL, NULL, 1, 1, '2023-04-28 11:47:14', '2023-04-28 11:47:14', 0, '', ''),
('cede9e4e-0bae-455a-a579-8fa9ca3ef713', 'idama', 'ali', 'teacher3@gmail.com', NULL, '', '$2b$10$DOqoCsGDeNLj7tvhlth1t.DXr9hQ0PKZNYQZsI..ctLIpPK8y7at.', NULL, NULL, NULL, NULL, NULL, NULL, 'a73cc21e-87dd-46ac-90e3-269015da05b1', '2023-04-28 11:47:03', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, NULL, NULL, 1, 1, '2023-04-28 11:47:03', '2023-04-28 11:47:03', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `video_length` float DEFAULT NULL,
  `is_preview` tinyint(1) DEFAULT 0,
  `short_id` int(11) NOT NULL DEFAULT 0,
  `assets_zip` varchar(255) DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_files`
--
ALTER TABLE `assignment_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `courses_teachers`
--
ALTER TABLE `courses_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_assets`
--
ALTER TABLE `course_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `course_batch`
--
ALTER TABLE `course_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_details`
--
ALTER TABLE `course_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_notice`
--
ALTER TABLE `course_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_progresses`
--
ALTER TABLE `course_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`),
  ADD KEY `videoId` (`videoId`);

--
-- Indexes for table `drop_students`
--
ALTER TABLE `drop_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replys`
--
ALTER TABLE `replys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `studentbatches`
--
ALTER TABLE `studentbatches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_applications`
--
ALTER TABLE `students_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courseId` (`courseId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_assets`
--
ALTER TABLE `course_assets`
  ADD CONSTRAINT `course_assets_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_progresses`
--
ALTER TABLE `course_progresses`
  ADD CONSTRAINT `course_progresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_3` FOREIGN KEY (`videoId`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD CONSTRAINT `instructor_earnings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instructor_earnings_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
