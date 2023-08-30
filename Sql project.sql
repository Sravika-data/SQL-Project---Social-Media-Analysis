-- USE sql_project;
CREATE TABLE Users(
User_id int(11) primary key not null auto_increment,
Username varchar(25) not null,
Full_Name varchar(40) not null,
Email varchar(50) not null,
Registration date
);

INSERT INTO Users(User_id, Username, Full_Name, Email, Registration)
VALUES
(1, "Alex_77", "Alex Smith", "alex@gmail.com", "2023-08-01"),
(2, "Mark_70", "Louis Mark", "louis@gmail.com", "2023-01-01"),
(3, "waderlust_cook", "Tim Cook", "tim@hotmail.com", "2020-08-01"),
(4, "Sober_art", "Eleena Stem", "stem@yahoo.com", "2021-07-27"),
(5, "studios_guy", "Amex Toot", "amex@gmail.com", "2021-09-30"),
(6, "Waston_stone", "Waston Stone", "stone_watson@gmail.com", "2019-08-25"),
(7, "Art_guy#99", "Alaric Maxwell", "alaric099@gmail.com", "2019-05-05"),
(8, "Tim_sozy", "Sozy Tim", "sozy990@gmail.com", "2022-07-26"),
(9, "Travelbook", "Nancy Mathew", "nancy78@gmail.com", "2020-03-09"),
(10, "@fitness_Max", "Max Goldenberg", "max_fitness@hotmail.com", "2022-02-28"),
(11, "everyday_Alex", "Alexa Thomsan", "alexa@gmail.com", "2021-11-23"),
(12, "The_randomguy", "Vacim Thomas", "vacim67@gmail.com", "2021-12-29");


DEsc users;
show tables;

SELECT * FROM USERS;
