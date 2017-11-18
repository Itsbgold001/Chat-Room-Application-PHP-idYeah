-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2017 at 12:19 PM
-- Server version: 10.0.19-MariaDB-1~trusty-log
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `web_programming_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `web_programming_db`;
--
-- Database: `web-programming_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `channel_id` int(20) NOT NULL,
  `channel_name` varchar(20) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `created_by_user_email` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `access_specifiers` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`channel_id`, `channel_name`, `purpose`, `created_by_user_email`, `createdon`, `access_specifiers`) VALUES
(1, 'general', 'all general messages', 'cmuth001@odu.edu', '2017-10-26 07:51:30', 0),
(2, 'random', 'random messages', 'cmuth001@odu.edu', '2017-10-29 06:12:42', 0),
(64, 'privateChannel', 'testing....', 'cmuth001@odu.edu', '2017-10-31 06:42:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_messages`
--

CREATE TABLE IF NOT EXISTS `channel_messages` (
  `cmessage_id` int(10) NOT NULL,
  `channel_id` int(10) NOT NULL,
  `cuser_email` varchar(20) CHARACTER SET latin1 NOT NULL,
  `channel_message` text CHARACTER SET latin1 NOT NULL,
  `has_thread` tinyint(4) NOT NULL DEFAULT '0',
  `cmsg_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channel_messages`
--

INSERT INTO `channel_messages` (`cmessage_id`, `channel_id`, `cuser_email`, `channel_message`, `has_thread`, `cmsg_timestamp`) VALUES
(15, 1, 'cmuth001@odu.edu', 'hey buddy', 1, '2017-10-31 15:44:07'),
(16, 1, 'cmuth001@odu.edu', ' "how do you html?"', 1, '2017-10-31 15:45:23'),
(17, 64, 'mater@rsprings.gov', 'hi folks this is our private channel', 1, '2017-10-31 16:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `channel_message_reaction`
--

CREATE TABLE IF NOT EXISTS `channel_message_reaction` (
  `id` bigint(100) NOT NULL,
  `message_id` int(20) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `emoji_id` bigint(100) NOT NULL DEFAULT '0',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel_message_reaction`
--

INSERT INTO `channel_message_reaction` (`id`, `message_id`, `user_email`, `emoji_id`, `createdon`) VALUES
(143, 15, 'cmuth001@odu.edu', 2, '2017-10-31 15:44:10'),
(144, 17, 'mater@rsprings.gov', 2, '2017-10-31 16:15:21'),
(145, 16, 'mater@rsprings.gov', 1, '2017-10-31 16:16:02'),
(146, 17, 'cmuth001@odu.edu', 1, '2017-10-31 16:17:46'),
(147, 16, 'cmuth001@odu.edu', 1, '2017-10-31 16:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `direct_message`
--

CREATE TABLE IF NOT EXISTS `direct_message` (
  `directmsg_id` int(10) NOT NULL,
  `from_email` varchar(20) NOT NULL,
  `to_email` varchar(20) NOT NULL,
  `direct_message` varchar(2000) NOT NULL,
  `dm_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emojis`
--

CREATE TABLE IF NOT EXISTS `emojis` (
  `emoji_id` bigint(100) NOT NULL,
  `unicode` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emojis`
--

INSERT INTO `emojis` (`emoji_id`, `unicode`) VALUES
(1, 'like'),
(2, 'dislike');

-- --------------------------------------------------------

--
-- Table structure for table `invite_user`
--

CREATE TABLE IF NOT EXISTS `invite_user` (
  `invite_id` bigint(100) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `channel_id` int(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(10) NOT NULL,
  `message` varchar(10000) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message`, `timestamp`) VALUES
(3, 'message-1', '2017-10-06 06:52:32'),
(4, 'message-1', '2017-10-06 06:52:32'),
(5, 'message-2', '2017-10-06 06:52:32'),
(10, 'whatsup', '2017-10-06 06:52:32'),
(13, 'I am hungry', '2017-10-06 18:15:59'),
(14, 'asa', '2017-10-06 20:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `modes`
--

CREATE TABLE IF NOT EXISTS `modes` (
  `mode_id` int(10) NOT NULL,
  `mode_txt` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `display_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`email`, `password`, `user_name`, `display_name`) VALUES
('mater@rsprings.gov', '@mater', 'Tow Mater', 'Tow Mater'),
('porsche@rsprings.gov', '@sally', 'Sally Carrera', 'Sally Carrera'),
('hornet@rsprings.gov', '@doc', 'Doc Hudson', 'Doc Hudson'),
('topsecret@agent.org', '@mcmissile', 'Finn McMissile', 'Finn McMissile'),
('kachow@rusteze.com', '@mcqueen', 'Lightning McQueen', 'Lightning McQueen'),
('chinga@cars.com', '@chick', 'Chick Hicks', 'Chick Hicks'),
('cmuth001@odu.edu', '@cmuth001', 'chandu_muthyala', 'chandu_muthyala'),
('npabb001@odu.edu', 'Neutral@123', 'vamsi', 'vamsi'),
('skand001@odu.edu', 'She3ple!', 'yashkandukuri', 'whaike'),
('mkuku002@odu.edu', 'asdf', 'mahesh', 'mahesh');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `user_email` varchar(50) NOT NULL,
  `status_txt` varchar(100) NOT NULL,
  `status_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `threaded_messages`
--

CREATE TABLE IF NOT EXISTS `threaded_messages` (
  `thread_id` bigint(100) NOT NULL,
  `message_id` int(100) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threaded_messages`
--

INSERT INTO `threaded_messages` (`thread_id`, `message_id`, `user_email`, `message`, `createdon`) VALUES
(30, 15, 'cmuth001@odu.edu', 'checking thread', '2017-10-31 15:44:07'),
(31, 16, 'cmuth001@odu.edu', '"what does <!-- mean"', '2017-10-31 15:45:23'),
(32, 16, 'cmuth001@odu.edu', '"what happens when I ~!@#$%^&*()_+_)(*&^%$#@!~}{:"><??:{}+}|}{P{}|-/*?"', '2017-10-31 15:45:50'),
(33, 16, 'cmuth001@odu.edu', '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. "', '2017-10-31 15:46:04'),
(34, 15, 'mater@rsprings.gov', 'ha ha ha', '2017-10-31 16:15:38'),
(35, 16, 'mater@rsprings.gov', 'I can also Comment :P', '2017-10-31 16:15:53'),
(36, 17, 'cmuth001@odu.edu', 'yes I only created for us', '2017-10-31 16:17:35'),
(37, 15, 'cmuth001@odu.edu', 'awesome bro ...', '2017-10-31 16:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `userChannels`
--

CREATE TABLE IF NOT EXISTS `userChannels` (
  `user_email` varchar(20) NOT NULL,
  `channel_id` int(10) NOT NULL,
  `channel_name` varchar(20) NOT NULL DEFAULT 'empty',
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `starred` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userChannels`
--

INSERT INTO `userChannels` (`user_email`, `channel_id`, `channel_name`, `isPublic`, `join_time`, `starred`) VALUES
('chinga@cars.com', 1, 'general', 0, '2017-10-27 01:36:18', 0),
('chinga@cars.com', 2, 'random', 0, '2017-10-27 01:36:18', 0),
('chinga@cars.com', 64, 'privateChannel', 1, '2017-10-31 06:42:25', 0),
('cmuth001@odu.edu', 1, 'general', 0, '2017-10-31 01:48:07', 0),
('cmuth001@odu.edu', 2, 'random', 0, '2017-10-31 01:48:07', 0),
('cmuth001@odu.edu', 64, 'privateChannel', 1, '2017-10-31 06:42:25', 0),
('hornet@rsprings.gov', 1, 'general', 0, '2017-10-27 01:36:40', 0),
('hornet@rsprings.gov', 2, 'random', 0, '2017-10-27 01:36:40', 0),
('hornet@rsprings.gov', 64, 'empty', 0, '2017-10-31 15:25:22', 0),
('kachow@rusteze.com', 1, 'general', 0, '2017-10-27 01:37:01', 0),
('kachow@rusteze.com', 2, 'random', 0, '2017-10-27 01:37:23', 0),
('kachow@rusteze.com', 64, 'empty', 0, '2017-10-31 15:18:37', 0),
('mater@rsprings.gov', 1, 'general', 0, '2017-10-27 01:37:41', 0),
('mater@rsprings.gov', 2, 'random', 0, '2017-10-27 01:37:41', 0),
('mater@rsprings.gov', 64, 'empty', 0, '2017-10-31 15:27:04', 0),
('npabb001@odu.edu', 1, 'general', 0, '2017-10-27 01:38:00', 0),
('npabb001@odu.edu', 2, 'random', 0, '2017-10-27 01:38:00', 0),
('porsche@rsprings.gov', 1, 'general', 0, '2017-10-27 01:38:22', 0),
('porsche@rsprings.gov', 2, 'random', 0, '2017-10-27 01:38:22', 0),
('skand001@odu.edu', 1, 'general', 0, '2017-10-27 01:38:42', 0),
('skand001@odu.edu', 2, 'random', 0, '2017-10-27 01:38:42', 0),
('topsecret@agent.org', 1, 'general', 0, '2017-10-27 01:38:58', 0),
('topsecret@agent.org', 2, 'random', 0, '2017-10-27 01:38:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(50) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `display_name` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Available',
  `mode_id` int(10) NOT NULL DEFAULT '0',
  `display_pic` varchar(50) NOT NULL DEFAULT 'no pic',
  `description` varchar(200) NOT NULL DEFAULT 'bio',
  `password` varchar(20) NOT NULL,
  `phone_no` int(13) DEFAULT NULL,
  `skype_id` varchar(20) NOT NULL DEFAULT 'skype id',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `user_name`, `display_name`, `status`, `mode_id`, `display_pic`, `description`, `password`, `phone_no`, `skype_id`, `timestamp`) VALUES
('chinga@cars.com', 'Chick Hicks', 'Chick Hicks', 'Available', 0, '', '', '@chick', 0, '', '2017-10-29 23:05:07'),
('cmuth001@odu.edu', 'chandu muthyala', 'cmuth001', 'Interested in web-programming', 0, '', '', '@cmuth001', 0, '', '2017-10-29 23:11:54'),
('hornet@rsprings.gov', 'Doc Hudson', 'Doc Hudson', 'Available', 0, '', '', '@doc', 0, '', '2017-10-29 23:05:07'),
('kachow@rusteze.com', 'Lightning McQueen', 'Lightning McQueen', 'Available', 0, '', '', '@mcqueen', 0, '', '2017-10-29 23:05:07'),
('mater@rsprings.gov', 'Tow Mater', 'Tow Mater', 'Available', 0, '', '', '@mater', 0, '', '2017-10-29 23:05:07'),
('mchandrasekharreddym@gmail.com', 'chandu', 'chandu', 'Available', 0, 'no pic', 'bio', 'asdf', NULL, 'skype id', '2017-10-29 23:05:07'),
('npabb001@odu.edu', 'Vamsi', 'Vamsi', 'Available', 0, '', '', 'Neutral@123', 0, '', '2017-10-29 23:05:07'),
('porsche@rsprings.gov', 'Sally Carrera', 'Sally Carrera', 'Available', 0, '', '', '@sally', 0, '', '2017-10-29 23:05:07'),
('skand001@odu.edu', 'yashkandukuri', 'whaike', 'Available', 0, '', '', 'She3ple!', 0, '', '2017-10-29 23:05:07'),
('topsecret@agent.org', 'Finn McMissile', 'Finn McMissile', 'Available', 0, '', '', '@mcmissile', 0, '', '2017-10-29 23:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `workspace`
--

CREATE TABLE IF NOT EXISTS `workspace` (
  `ws_id` int(20) NOT NULL,
  `ws_name` varchar(20) NOT NULL,
  `ws_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `created_by_user_email` (`created_by_user_email`),
  ADD KEY `created_by_user_email_2` (`created_by_user_email`);

--
-- Indexes for table `channel_messages`
--
ALTER TABLE `channel_messages`
  ADD PRIMARY KEY (`cmessage_id`),
  ADD KEY `cuser_email` (`cuser_email`),
  ADD KEY `cuser_email_2` (`cuser_email`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `channel_id_2` (`channel_id`),
  ADD KEY `channel_id_3` (`channel_id`);

--
-- Indexes for table `channel_message_reaction`
--
ALTER TABLE `channel_message_reaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `emoji_id` (`emoji_id`);

--
-- Indexes for table `direct_message`
--
ALTER TABLE `direct_message`
  ADD PRIMARY KEY (`directmsg_id`),
  ADD KEY `from_email` (`from_email`,`to_email`),
  ADD KEY `to_email` (`to_email`);

--
-- Indexes for table `emojis`
--
ALTER TABLE `emojis`
  ADD PRIMARY KEY (`emoji_id`);

--
-- Indexes for table `invite_user`
--
ALTER TABLE `invite_user`
  ADD PRIMARY KEY (`invite_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `user_email_2` (`user_email`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `modes`
--
ALTER TABLE `modes`
  ADD PRIMARY KEY (`mode_id`),
  ADD KEY `mode_id` (`mode_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `threaded_messages`
--
ALTER TABLE `threaded_messages`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `message_id_2` (`message_id`),
  ADD KEY `user_email_2` (`user_email`);

--
-- Indexes for table `userChannels`
--
ALTER TABLE `userChannels`
  ADD PRIMARY KEY (`user_email`,`channel_id`),
  ADD KEY `user_id` (`user_email`),
  ADD KEY `user_id_2` (`user_email`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `channel_id_2` (`channel_id`),
  ADD KEY `channel_id_3` (`channel_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `mode_id` (`mode_id`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`ws_id`),
  ADD KEY `ws_id` (`ws_id`),
  ADD KEY `ws_id_2` (`ws_id`),
  ADD KEY `ws_id_3` (`ws_id`),
  ADD KEY `ws_id_4` (`ws_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `channel_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `channel_messages`
--
ALTER TABLE `channel_messages`
  MODIFY `cmessage_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `channel_message_reaction`
--
ALTER TABLE `channel_message_reaction`
  MODIFY `id` bigint(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `emojis`
--
ALTER TABLE `emojis`
  MODIFY `emoji_id` bigint(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `invite_user`
--
ALTER TABLE `invite_user`
  MODIFY `invite_id` bigint(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `threaded_messages`
--
ALTER TABLE `threaded_messages`
  MODIFY `thread_id` bigint(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`created_by_user_email`) REFERENCES `users` (`email`) ON UPDATE CASCADE;

--
-- Constraints for table `channel_messages`
--
ALTER TABLE `channel_messages`
  ADD CONSTRAINT `channel_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`),
  ADD CONSTRAINT `channel_messages_ibfk_2` FOREIGN KEY (`cuser_email`) REFERENCES `users` (`email`);

--
-- Constraints for table `channel_message_reaction`
--
ALTER TABLE `channel_message_reaction`
  ADD CONSTRAINT `channel_message_reaction_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `channel_message_reaction_ibfk_2` FOREIGN KEY (`emoji_id`) REFERENCES `emojis` (`emoji_id`);

--
-- Constraints for table `direct_message`
--
ALTER TABLE `direct_message`
  ADD CONSTRAINT `direct_message_ibfk_1` FOREIGN KEY (`to_email`) REFERENCES `users` (`email`) ON UPDATE CASCADE,
  ADD CONSTRAINT `direct_message_ibfk_2` FOREIGN KEY (`from_email`) REFERENCES `users` (`email`) ON UPDATE CASCADE;

--
-- Constraints for table `invite_user`
--
ALTER TABLE `invite_user`
  ADD CONSTRAINT `invite_user_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `invite_user_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);

--
-- Constraints for table `threaded_messages`
--
ALTER TABLE `threaded_messages`
  ADD CONSTRAINT `threaded_messages_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `channel_messages` (`cmessage_id`),
  ADD CONSTRAINT `threaded_messages_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);

--
-- Constraints for table `userChannels`
--
ALTER TABLE `userChannels`
  ADD CONSTRAINT `userChannels_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`),
  ADD CONSTRAINT `userChannels_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;