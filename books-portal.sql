-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2020 at 06:03 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books-portal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `param_username` VARCHAR(255), IN `param_password` VARCHAR(255), IN `param_email` VARCHAR(255), IN `param_firstName` VARCHAR(255), IN `param_middleName` VARCHAR(255), IN `param_lastName` VARCHAR(255), IN `param_city` VARCHAR(255), IN `param_pincode` INT(11), IN `param_category` VARCHAR(255), IN `param_role` VARCHAR(255), IN `param_contact` VARCHAR(20), IN `param_isverified` VARCHAR(25), IN `param_date` DATE)  BEGIN
        	INSERT INTO users(username,password,email,first_name,middle_name,last_name,city,pincode,user_category,role,is_verified,date)  VALUES(param_username,param_password,param_email,param_firstName,param_middleName,param_lastName,param_city,param_pincode,param_category,param_role,param_isverified,param_date);
            INSERT INTO contacts(username,contact_no) VALUES(param_username,param_contact);
       END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `book_price` int(11) NOT NULL DEFAULT 0,
  `book_original_price` int(11) NOT NULL DEFAULT 0,
  `book_description` varchar(1000) DEFAULT 'No Description Available',
  `book_image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `book_status` varchar(255) NOT NULL DEFAULT 'available',
  `date` date NOT NULL DEFAULT '1920-05-20'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `username`, `book_name`, `author`, `edition`, `subject`, `category_id`, `book_price`, `book_original_price`, `book_description`, `book_image`, `book_status`, `date`) VALUES
(1, 'meet', 'Concepts of Database Systems', 'Silberghatz', '6', 'DBMS', 1, 800, 1000, '<p>The sixth edition of Database System Concepts is popularly considered to be one of the cornerstone texts of database education. The basic and fundamental concepts are presented in an intuitive manner, and is designed to help students begin working with databases as soon as possible.</p><p>The book commences with a basic introduction, which discusses fundamental topics like Database Languages, Database Users and Administrators, Database Design, and Data Storage and Querying. Then, the book is segregated into ten section. Relational Databases, System Architecture, Speciality Databases, and Transaction Management are a few. Chapters like Object-Relational Mapping, Relevance Ranking Using Terms, and Distributed Data Storage are discussed in detail. This edition also provides a revised coverage of SQL, with greater attention to variants of SQL in actual systems and SQL features. There is also new material on support vector machines, and validation of classifiers.</p><p>The text supplied ', 'Concepts of Database Systems_meet_17.png', 'unavailable', '2020-04-14'),
(2, 'abhi', 'Modern Operating Systems', 'Andrew S Tanenbaum', '3', 'Operating Systems', 1, 700, 1200, '<p>Modern Operating Systems, Fourth Edition, is intended for introductory courses in Operating Systems in Computer Science, Computer Engineering and Electrical Engineering programs</p>', 'Modern Operating Systems_abhi_90.png', 'unavailable', '2020-04-14'),
(3, 'jivansu', 'Computer System Architecture', 'Morris Mano', '3', 'Computer Architecture', 5, 300, 500, '<p>Pearson presents the much-awaited revised edition of its pioneer title on Computer System Architecture by Morris Mano.<br>This revised text is spread across fifteen chapters with substantial updates to include the latest developments in the field. The first eight chapters of the book focuses on the hardware design and computer organization, while the remaining seven chapters introduces the functional Units of digital computer. The pedagogy of the book has been enhanced to enable the learners in assessing their understanding of the key concepts.</p>', 'Computer System Architecture_jivansu_56.png', 'available', '2020-04-15'),
(37, 'yashvi', 'Fourier Analysis-A signal Processing Approach', 'D.Sundarajan', '4', 'Signals and Systems', 4, 1000, 1500, '<p>This book provides a concrete introduction to a number of topics in Harmonic analysis, accessible at the early graduate Level or, in some cases, at an upper undergraduate level. Necessary prerequisites to using the text are rudiments of the Lebesgue measure and integration on the real line. It begins with a thorough treatment of Fourier series on the circle and their applications to approximation theory, probability, and plane Geometry. Frequently, more than one proof is offered for a given theorem to illustrate the multiplicity of approaches</p>', 'Fourier Analysis-A signal Processing Approach_yashvi_7.png', 'available', '2020-04-15'),
(39, 'yash', 'Mechanics of Solids', 'S.S.Bhaktivati', '3', 'MOS', 2, 1400, 2000, '<p>ANALYSIS OF STRESS AND STRAIN - ELASTIC SOLIDS - AXISYMMETRY - UNSYMMETRICAL BENDING - ENERGY METHODS - TORSION</p>', 'Mechanics of Solids_yash_40.png', 'available', '2020-04-15'),
(40, 'nihar', 'Theory of Machines', 'D.P.Malhotra', '2', 'TOM', 3, 1300, 2500, '<p>The book covers the entire syllabus with a holistic approach. Contents such as the Kinematics of Motion, Kinetics of Motion, Simple Harmonic Motion, Simple Mechanisms, Velocity in Mechanisms, Turning Moment Diagrams and Flywheel, Steam Engine Valves and Reversing Gears, Torsional Vibrations, Computer Aided Analysis and Synthesis of Mechanisms and Automatic Control formed an important part and have been explained very well.</p>', 'Theory of Machines_nihar_52.png', 'unavailable', '2020-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `transaction_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`username`, `book_name`, `seller_name`, `date`, `price`, `transaction_method`) VALUES
('yash', 'Theory of Machines', 'nihar', '2020-04-15', 1300, 'Cash'),
('yashvi', 'Concepts of Database Systems', 'meet', '2020-04-15', 800, 'Cash'),
('jivansu', 'Modern Operating Systems', 'abhi', '2020-04-15', 700, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_category_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`) VALUES
(1, 'Computer Engineering', 0),
(2, 'Mechanical Engineering', 0),
(3, 'Civil Engineering', 0),
(4, 'Electrical Engineering', 0),
(5, 'Electronics and Communication', 0),
(6, 'Any other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `username` varchar(255) NOT NULL,
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`username`, `contact_no`) VALUES
('abhi', '9898845567'),
('admin1', '9426236105'),
('jivansu', '9909975430'),
('meet', '8141587064'),
('nihar', '9825059546'),
('yash', '7976157017'),
('yashvi', '7600066804');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Unseen',
  `buyer_name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `offer_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `username`, `message`, `status`, `buyer_name`, `date`, `offer_status`) VALUES
(22, 'nihar', 'yash is interested in buying Theory of Machines , Preferred payment method: Cash , Preferred delivary mode: Personal', 'Unseen', 'yash', '2020-04-15 03:54:31', 'pending'),
(23, 'meet', 'yashvi is interested in buying Concepts of Database Systems , Preferred payment method: Cash , Preferred delivary mode: Courier', 'Unseen', 'yashvi', '2020-04-15 03:55:10', 'pending'),
(24, 'abhi', 'jivansu is interested in buying Modern Operating Systems , Preferred payment method: Cash , Preferred delivary mode: Personal', 'Unseen', 'jivansu', '2020-04-15 04:01:13', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `review_content` varchar(255) NOT NULL DEFAULT 'No Review Content'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT 'noemail@noemail@noemail',
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL DEFAULT -1,
  `user_category` varchar(255) NOT NULL DEFAULT 'FirstYear',
  `role` varchar(255) NOT NULL,
  `street_no` int(11) DEFAULT -1,
  `area` varchar(255) DEFAULT NULL,
  `is_verified` varchar(25) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `first_name`, `middle_name`, `last_name`, `city`, `pincode`, `user_category`, `role`, `street_no`, `area`, `is_verified`, `date`) VALUES
('abhi', '$2y$10$D8HNU.NsP9HIakOI5oGdc.03FGnB3zpumriXfa4fvL02mC5flDUm2', '18bce229@nirmauni.ac.in', 'Abhi', 'Sinojia', 'Prakashbhai', 'Bhavnagar', 364002, 'Computer', 'user', -1, NULL, 'true', '2020-04-14'),
('admin1', '$2y$10$.92GmqMA0nDv283A1.oriez2rOj0MjIQzisAoABnjP.M0YT.njDXK', 'meetmavani98@gmail.com', 'L', 'M', 'Mavani', 'Bhavnagar', 364001, 'EXTC', 'admin', -1, NULL, 'true', '2020-04-15'),
('jivansu', '$2y$10$2yKdUWboxNHeSe/C7vWKJOVQfeq/E8dIu85MfHf18EAPuZ1HUaJqu', '18n045@nirmauni.ac.in', 'Jivansu', 'Vyas', 'a', 'Ahmedabad', 344448, 'Electronics', 'user', -1, NULL, 'true', '2020-04-14'),
('meet', '$2y$10$jckxgyxbc5TrFC3gQOxP.uRFq./62jVu0GI9QqdR./apMkRfeMTLC', '18bce118@nirmauni.ac.in', 'Meet', 'Mava', 'Lavjibhai', 'Bhavnagar', 364001, 'Computer', 'user', -1, NULL, 'true', '2020-04-14'),
('nihar', '$2y$10$GfR.jiEdtzeNZo8q.YhX1eNsCuzO1wnq9GBv3ki4GTfKFooR1Y5oq', '18bce133@nirmauni.ac.in', 'Nihar', 'Thakkar', 'L', 'Ahmedabad', 364003, 'IT', 'user', -1, NULL, 'true', '2020-04-15'),
('yash', '$2y$10$n1uIWanZ476Xkf9V3b1lBeSA9NJQndC9xOvWlNiq/p5GLCkPjdGAe', '18bce263@nirmauni.ac.in', 'Yash', 'Chelani', 'L', 'Udaipur', 364003, 'Mechanical', 'user', -1, NULL, 'true', '2020-04-15'),
('yashvi', '$2y$10$EfKvBXnE6nJKHWL7QmbXiONKW.XbvOhw5nkPwQv/CJZyISAFlbT0K', '18n059@nirmaunni.ac.in', 'Yashvi', 'Shah', 'L', 'Ahmedabad', 364002, 'Electronics', 'user', -1, NULL, 'true', '2020-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `email_id` varchar(255) NOT NULL,
  `code` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`email_id`, `code`) VALUES
('18bce094@nirmauni.ac.in', 478646),
('meetmavani98@gmail.com', 712487);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_bookmark` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_books_username` (`username`),
  ADD KEY `book_price` (`book_price`),
  ADD KEY `book_name` (`book_name`),
  ADD KEY `book_image` (`book_image`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD KEY `fk_username_users` (`username`),
  ADD KEY `fk_book_name` (`book_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_no`),
  ADD KEY `fk_username_contacts` (`username`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_username_users` (`username`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_reviews` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `fk_book_id_bookmark` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_bookmark` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_username_contacts` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_book_id_reviews` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_reviews` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
