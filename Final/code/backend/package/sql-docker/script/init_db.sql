SET GLOBAL time_zone = "+8:00";
FLUSH PRIVILEGES;

DROP DATABASE IF EXISTS eyulingo_db;

CREATE DATABASE eyulingo_db;

ALTER DATABASE eyulingo_db CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

USE eyulingo_db;

DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Delivers;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Stores;
DROP TABLE IF EXISTS Admins;
DROP TABLE IF EXISTS Goods;
DROP TABLE IF EXISTS GoodComments;
DROP TABLE IF EXISTS StoreComments;
DROP TABLE IF EXISTS Carts;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS CheckCodes;

CREATE TABLE Delivers
(
    `deliver_name` VARCHAR(32),
    PRIMARY KEY (`deliver_name`)
);

CREATE TABLE Tags
(
    `good_id` INTEGER,
    `tag_name` VARCHAR(32),
    PRIMARY KEY (`good_id`, `tag_name`)
);

CREATE TABLE Users
(
    `user_id` INTEGER,
    `user_name` VARCHAR(64),
    `password` VARCHAR(64),
    `user_phone` VARCHAR(16),
    `cover_id` VARCHAR(128),
    PRIMARY KEY (`user_id`)
);

CREATE TABLE Stores
(
    `store_id` INTEGER,
    `store_name` VARCHAR(64),
    `cover_id` VARCHAR(128),
    `store_address` VARCHAR(128),
    `store_phone` VARCHAR(16),
    `start_time` VARCHAR(8),
    `end_time` VARCHAR(8),
    `deliver_method` VARCHAR(32),

    `dist_name` VARCHAR(64),
    `dist_password` VARCHAR(64),
    `dist_location` VARCHAR(128),
    `dist_phone` VARCHAR(16),
    `dist_image_id` VARCHAR(128),

    PRIMARY KEY (`store_id`, `dist_name`),
    FOREIGN KEY (`deliver_method`) REFERENCES Delivers(`deliver_name`) ON DELETE RESTRICT
);

CREATE TABLE Admins
(
    `admin_name` VARCHAR(64),
    `admin_password` VARCHAR(64),
    PRIMARY KEY (`admin_name`)
);

CREATE TABLE Goods
(
    `good_id` INTEGER,
    `good_name` VARCHAR(64),
    `store_id` INTEGER,
    `price` DECIMAL(8, 2),
    `discount` DECIMAL(8, 2),
    `storage` INTEGER,
    `description` VARCHAR(1024),
    `good_image_id` VARCHAR(128),

    PRIMARY KEY (`good_id`),
    FOREIGN KEY (`store_id`) REFERENCES Stores(`store_id`) ON DELETE RESTRICT
);

CREATE TABLE GoodComments
(
    `good_id` INTEGER,
    `user_id` INTEGER,
    `star` INTEGER,
    `good_comment` VARCHAR(1024),

    PRIMARY KEY (`good_id`, `user_id`),
    FOREIGN KEY (`good_id`) REFERENCES Goods(`good_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`) ON DELETE RESTRICT
);

CREATE TABLE StoreComments
(
    `store_id` INTEGER,
    `user_id` INTEGER,
    `star` INTEGER,
    `store_comment` VARCHAR(1024),

    PRIMARY KEY (`store_id`, `user_id`),
    FOREIGN KEY (`store_id`) REFERENCES Stores(`store_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`) ON DELETE RESTRICT
);

CREATE TABLE Carts
(
    `user_id` INTEGER,
    `good_id` INTEGER,
    `amount` INTEGER,

    PRIMARY KEY (`user_id`, `good_id`),
    FOREIGN KEY (`good_id`) REFERENCES Goods(`good_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`) ON DELETE RESTRICT
);

CREATE TABLE Orders
(
    `order_id` INTEGER,
    `user_id` INTEGER,
    `receiver` VARCHAR(16),
    `re_phone` VARCHAR(16),
    `re_address` VARCHAR(128),
    `deliver_method` VARCHAR(32),
    `status` VARCHAR(16),
    `order_time` TIMESTAMP,
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`deliver_method`) REFERENCES Delivers(`deliver_name`) ON DELETE RESTRICT
);

CREATE TABLE OrderItems
(
    `order_id` INTEGER,
    `good_id` INTEGER,
    `current_price` DECIMAL(8, 2),
    `amount` INTEGER,
    PRIMARY KEY (`order_id`, `good_id`),
    FOREIGN KEY (`order_id`) REFERENCES Orders(`order_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`good_id`) REFERENCES Goods(`good_id`) ON DELETE RESTRICT
);

CREATE TABLE CheckCodes
(
    `phone_num` VARCHAR(16),
    `check_code` VARCHAR(8),
    `time` TIMESTAMP,
    PRIMARY KEY (`phone_num`)
);



-- CREATE TABLE comments
-- (
-- 	`comm_uuid` VARCHAR(36),
-- 	`user_id` INTEGER,
-- 	`time` DATETIME,
-- 	`purchased` BOOLEAN,
-- 	`isbn` VARCHAR(15),
-- 	`comment_content` VARCHAR(1024),
-- 	PRIMARY KEY (`comm_uuid`),
-- 	FOREIGN KEY (`user_id`) REFERENCES s_user (`id`) ON DELETE RESTRICT,
-- 	FOREIGN KEY (`isbn`) REFERENCES book_library (`isbn`) ON DELETE RESTRICT
-- );