CREATE SCHEMA `much` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `much`;

CREATE TABLE IF NOT EXISTS `much`.`t_user` (
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(127) DEFAULT NULL,
    `password` VARCHAR(127) DEFAULT NULL,
    `nickname` VARCHAR(127) DEFAULT NULL,
    `avatar_url` VARCHAR(255) DEFAULT NULL,
    `weibo_id` VARCHAR(16) DEFAULT NULL,
    `weibo_access_token` VARCHAR(45) DEFAULT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    INDEX `ind_created_at` (`created_at` DESC),
    INDEX `ind_updated_at` (`updated_at` DESC),
    UNIQUE INDEX `unq_user_email` (`email` ASC),
    UNIQUE INDEX `unq_weibo_id` (`weibo_id` ASC)
);
