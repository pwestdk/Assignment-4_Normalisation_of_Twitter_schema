DROP DATABASE twitter;
CREATE DATABASE twitter;

CREATE TABLE `twitter`.`users` (
  `username` VARCHAR(15) NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `bio` VARCHAR(160) NULL,
  `followers` BIGINT(20) NULL,
  `following` BIGINT(20) NULL,
  PRIMARY KEY (`username`));

CREATE TABLE `twitter`.`tweets` (
  `tweet_id` BIGINT(20) NOT NULL,
  `username` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  `hour` DATETIME NOT NULL,
  `message` VARCHAR(280) NOT NULL,
  `latitude` DOUBLE NOT NULL,
  `longtitude` DOUBLE NOT NULL,
  `listed` BIGINT(20) NULL,
  `lang` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `fk_username_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`));

CREATE TABLE `twitter`.`places` (
  `place_id` BIGINT(20) NOT NULL,
  `tweet_id` BIGINT(20) NOT NULL,
  `place` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`place_id`),
  CONSTRAINT `fk_tweet_id_places` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`));

CREATE TABLE `twitter`.`countries` (
  `country_id` BIGINT(20) NOT NULL,
  `tweet_id` BIGINT(20) NOT NULL,
  `country` VARCHAR(74) NOT NULL,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `fk_tweet_id_countries` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`));

CREATE TABLE `twitter`.`favorites` (
  `favorites_id` BIGINT(20) NOT NULL,
  `tweet_id` BIGINT(20) NOT NULL,
  `favs` BIGINT(20) NOT NULL,
  PRIMARY KEY (`favorites_id`),
  CONSTRAINT `fk_tweet_id_favorites` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`));
  
  CREATE TABLE `twitter`.`retweets` (
  `retweets_id` BIGINT(20) NOT NULL,
  `tweet_id` BIGINT(20) NOT NULL,
  `rts` BIGINT(20) NOT NULL,
  PRIMARY KEY (`retweets_id`),
  CONSTRAINT `fk_tweet_id_retweets` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`));
  
  CREATE TABLE `twitter`.`pictures` (
  `pictures_id` BIGINT(20) NOT NULL,
  `tweet_id` BIGINT(20) NOT NULL,
  `picture` VARCHAR(45) NULL,
  PRIMARY KEY (`pictures_id`),
  CONSTRAINT `fk_tweet_id_pictures` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`));