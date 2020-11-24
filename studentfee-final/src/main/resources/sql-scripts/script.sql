CREATE DATABASE  IF NOT EXISTS `student_fee`;

USE `student_fee`;

drop table if exists student;

drop table if exists audit;

drop table if exists user;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `fee_due` varchar(45),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `audit` (
  `tableName` varchar(50) Not null,
  `modifiedBy` VARCHAR(50) NOT NULL,
  `function` VARCHAR(50) not null,
  `modifiedTime` DATETIME DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER after_student_create
After INSERT ON student
FOR EACH ROW
BEGIN
INSERT INTO audit
SET
tableName = 'student',
modifiedBy = 'admin',
function = 'insert',
modifiedTime = NOW();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_student_delete
After delete ON student
FOR EACH ROW
BEGIN
INSERT INTO audit
SET
tableName = 'student',
modifiedBy = 'admin',
function = 'delete',
modifiedTime = NOW();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_student_update
After update ON student
FOR EACH ROW
BEGIN
INSERT INTO audit
SET
tableName = 'student',
modifiedBy = 'admin',
function = 'update',
modifiedTime = NOW();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_user_create
After INSERT ON user
FOR EACH ROW
BEGIN
INSERT INTO audit
SET
tableName = 'user',
modifiedBy = 'admin',
function = 'insert',
modifiedTime = NOW();
END$$
DELIMITER ;

INSERT INTO `student` VALUES
(1,'1604-16-733-025','Fazil','Ali','fazilali@gmail.com','Semester_1','No_Due'),
(2,'1604-16-733-026','Shaik','Aziz','msa@gmail.com','Semester_1','Due'),
(3,'1604-16-733-028','Arshil','Riaz','arshilriaz@gmail.com','Semester_1','Due');


insert into user values
(1, 'admin', '$2a$10$p6R9L/YJCtrw0.vx5twf7ujOw.xSXHVZ1w19Fk8J3iAdNKrh50zLG', 'ROLE_ADMIN'),
(2, '1604-16-733-025', '$2a$10$p6R9L/YJCtrw0.vx5twf7ujOw.xSXHVZ1w19Fk8J3iAdNKrh50zLG', 'ROLE_USER'),
(3, '1604-16-733-026', '$2a$10$p6R9L/YJCtrw0.vx5twf7ujOw.xSXHVZ1w19Fk8J3iAdNKrh50zLG', 'ROLE_USER'),
(4, '1604-16-733-028', '$2a$10$p6R9L/YJCtrw0.vx5twf7ujOw.xSXHVZ1w19Fk8J3iAdNKrh50zLG', 'ROLE_USER');
