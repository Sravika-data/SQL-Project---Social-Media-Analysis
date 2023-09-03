USE sql_project;

#Created Table Users- Table 1
CREATE TABLE Users(
User_id int(11) primary key not null auto_increment,
Username varchar(25) not null,
Full_Name varchar(40) not null,
Email varchar(50) not null,
Registration date
);

#Inserted values into it(Users table)
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

#Created table Posts- Table 2
CREATE TABLE Posts(
Post_id int(11) primary key not null,
User_id int(11) ,
Posts_text text (400),
Post_image_URL varchar(150),
Post_date date,
Likes_count int,
Comments_count int,
shares_count int
);

#Inserted values into it(Posts Table)
INSERT INTO Posts( Post_id, User_id, Posts_text, Post_image_URL, Post_date, Likes_count, Comments_count, shares_count)
VALUES
(201, 2, "Super Happy to share my first post", "http://example.com/image.jpg", "2023-08-01", 500, 679, 34),
(202, 8, "My first Canvas Painting 🌍📸", "http://example_live.com/image_1.jpg", "2022-10-26", 677,899,900),
(203, 1, "Wow ! What A Day🔥🌺", "http://example.com/image_2.jpg", "2023-12-01", 350, 880, 555),
(204, 3, "I topped the college🎉🌈", "http://example_live.com/image_4.jpg", "2020-10-01", 456,789,890),
(205, 4, "Hurray😄", "http://example.com/image_5.jpg", "2021-09-27", 239, 69, 334),
(206, 5, "One Life Enjoy it... 🌍📸", "http://example_live.com/image_6.jpg", "2022-09-30", 788, 888 , 900),
(207, 7, "Trip to remember 🏖️🌍", "http://example.com/image_7.jpg", "2020-09-05", 20, 89, 999),
(208, 8, "My munckhin first walk", "http://example_live.com/image_9.jpg", "2022-11-26", 788, 900, 45),
(209, 10, "Happy Birthday Best Friend🎁", "http://example.com/image_10.jpg", "2023-02-23", 400, 567, 300),
(210, 6, "Trip To Shimla 🚀", "http://example_live.com/image_11.jpg", "2020-03-25", 789,678,890),
(211, 9, "International Yoga Day", "http://example.com/image_12.jpg", "2022-04-09", 100, 179, 678),
(212, 10, "Lets Snap It 🌍📸", "http://example_live.com/image_13.jpg", "2023-012-28", 789,455,789),
(213, 3, "I am Big Fans of yous", "http://example.com/image_14.jpg", "2021-08-08", 500, 349, 200),
(214, 3, "I love Baking 🌍📸", "http://example_live.com/image_15.jpg", "2023-07-01", 456,788,500),
(215, 2, "Lets Groove...", "http://example.com/image_16.jpg", "2023-08-01", 300, 567, 245),
(216, 8, "Lets Shop the World 🌍📸", "http://example_live.com/image_17.jpg", "2023-06-26", 789,78,200);

#Created table Messages- Table 3
CREATE TABLE Messages (
  message_id INT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  Message_text TEXT,
  Message_date DATETIME,
  FOREIGN KEY (sender_id) REFERENCES Users(user_id),
  FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

#Inserted values into it(Messages Table)
INSERT INTO Messages (message_id, sender_id, receiver_id, Message_text, Message_date)
VALUES
  (601, 2, 1, 'Hey Alex, how are you?', '2023-08-03 10:30:00'),
  (602, 1, 2, 'I am good! How about you?', '2023-08-03 10:35:00'),
  (603, 4, 5, 'Congrats on your latest post!', '2020-10-03 15:00:00'),
  (604, 1, 6, 'Your travel photos are amazing!', '2022-09-30 20:15:00'),
  (605, 3, 1, 'Let''s plan a trip soon.', '2020-09-06 12:45:00'),
  (606, 1, 8, 'How''s your new recipe going?', '2022-07-27 17:20:00'),
  (607, 9, 10, 'Hey long time no see!', '2023-10-03 15:00:00'),
  (608, 1, 6, 'Are you busy?', '2022-08-30 23:14:00'),
  (609, 7, 11, 'Let''go to France.', '2021-09-06 11:45:00'),
  (610, 12, 8, 'Hey! Lets catch up', '2022-07-27 17:20:00');

#Question 1: Retrieve the list of usernames and their corresponding post counts. Include users who haven't made any posts as well.
SELECT Username, COUNT(Post_id) AS Posts_Count 
   FROM Users U LEFT JOIN Posts P
     ON U.User_id = P.User_id
     GROUP BY U.User_id;
	
#Question 2: Find the top 3 users with the most likes on their posts, along with their full names.
SELECT Full_Name, SUM(Likes_count) AS Total_Likes
  FROM Users U INNER JOIN Posts P
    ON U.User_id = P.User_id
      GROUP BY U.User_id
      ORDER BY Total_Likes DESC
    LIMIT 3;
    
#Question 3: List the sender and receiver usernames for all messages sent by user_id 1.
SELECT DISTINCT Username FROM 
    Users U INNER JOIN Messages M
     ON U.User_id = M.sender_id
     WHERE receiver_id = 1
       
 UNION 
 SELECT DISTINCT  Username FROM 
    Users U INNER JOIN Messages M
     ON U.User_id = M.receiver_id
     WHERE sender_id = 1;

#Question 4: Find the total number of messages sent by each user. Include users who haven't sent any messages.
SELECT User_id, Username, Full_Name, COUNT(sender_id) AS Total_Messages_Sent
   FROM Users U INNER JOIN Messages M
   ON U.User_id = M.sender_id
     GROUP BY User_id;

#Question 5: Calculate the average number of likes, comments, and shares for each post.
SELECT U.User_id, AVG(Likes_count) AS Average_of_Likes, 
  AVG(comments_count) AS Average_of_comments,
  AVG(shares_count) AS Average_of_shares
    FROM Users U INNER JOIN POSTS P
        ON U.User_id = P.User_id
		  GROUP BY U.User_id;

#Question 6: List the post_id, post text, and the username of the user who made the post with the highest number of shares.
#APPROACH-1
SELECT post_id, Posts_text, Username, Shares_count
FROM Posts P INNER JOIN Users U
ON P.User_id = U.User_id
GROUP BY P.post_id
ORDER BY Shares_count DESC
LIMIT 1;

#APPROACH-2
SELECT
    P.Post_id,
    P.Posts_text AS Post_Text,
    U.Username
FROM
    Posts P
INNER JOIN
    Users U ON P.User_id = U.User_id
WHERE
    P.shares_count = (
        SELECT MAX(shares_count)
        FROM Posts
    );
    
#Question 7: Find the usernames of users who have both made posts and received messages.
#APPROACH-1
SELECT  DISTINCT Username FROM Users U INNER JOIN Messages M
  ON U.User_id = M.receiver_id
INNER JOIN Posts P 
   ON U.User_id = P.User_id;
   
#APPROACH-2
SELECT DISTINCT U.Username
FROM Users U
INNER JOIN Posts P ON U.User_id = P.User_id
WHERE U.User_id IN (
    SELECT DISTINCT sender_id
    FROM Messages
);

#Question 8: Calculate the total number of posts made by users who registered in 2021 and have received at least one message.
SELECT COUNT(P.Post_id) AS Total_Posts
FROM Users U
INNER JOIN (
    SELECT DISTINCT receiver_id
    FROM Messages M
) DistinctReceivers  ON U.User_id = DistinctReceivers.receiver_id
INNER JOIN Posts P ON U.User_id = P.User_id
WHERE YEAR(U.Registration) = 2021;
     
#Question 9: Retrieve the most recent message sent to each user, along with the sender's username.
WITH RankedMessages AS (
    SELECT
        M.receiver_id,
        U.Username AS Receiver,
        M.sender_id,
        U2.Username AS Sender,
        M.Message_text AS Latest_Message,
        M.Message_date AS Message_Date,
        DENSE_RANK() OVER (PARTITION BY M.receiver_id ORDER BY M.Message_date DESC) AS MessageRank
    FROM Messages M
    INNER JOIN Users U ON M.receiver_id = U.User_id
    INNER JOIN Users U2 ON M.sender_id = U2.User_id
)

SELECT Receiver, Sender, Latest_Message, Message_Date
FROM RankedMessages
WHERE MessageRank = 1;

#Question 10: List the post_id, post text, and post date for the 5 most recent posts.

SELECT  Post_id, Posts_text, Post_date FROM Posts
 ORDER BY Post_date DESC
   LIMIT 5;

#Question 11: Find pairs of users (sender and receiver) who have exchanged messages, and count how many messages were exchanged between each pair.
WITH Message_Exchanged AS
(
SELECT U1.Username AS Sender,
  U2.Username As Receiver, Count(message_id) As Message_Count
       FROM Messages M
      INNER JOIN Users U1 ON M.sender_id = U1.User_id
      INNER JOIN Users U2 ON M.receiver_id= U2.User_id
      GROUP BY Sender, Receiver
  )
  SELECT  Sender, Receiver,Message_Count FROM Message_Exchanged;
  
#Question 12:Identify users who have made posts on the same date they registered.
SELECT U.User_id, U.Username, U.Full_Name, U.Registration, P.Post_date
FROM Users U
INNER JOIN Posts P ON U.User_id = P.User_id
WHERE DATE(U.Registration) = DATE(P.Post_date);
