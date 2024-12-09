CREATE DATABASE IF NOT EXISTS facebook_users;

CREATE TABLE IF NOT EXISTS users(
	userid VARCHAR(30) NOT NULL PRIMARY KEY,
    age INT NOT NULL,
    dob_day INT NOT NULL,
    dob_year INT NOT NULL,
    dob_month INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    tenure INT NOT NULL,
    friend_count INT NOT NULL,
    friendships_initiated INT NOT NULL,
    likes INT NOT NULL,
    likes_received  INT NOT NULL,
    mobile_likes INT NOT NULL,
    mobile_likes_received INT NOT NULL,
    www_likes INT NOT NULL,
    www_likes_received INT NOT NULL
);

SELECT *, 
DATE(CONCAT(dob_year,'-',dob_month,'-',dob_day)) AS dob_date,
DATE_SUB('2013-01-01', INTERVAL tenure DAY) AS creation_date,
CASE
	WHEN age < 18 THEN 'Teenager'
    WHEN age >= 18 AND age <= 26 THEN 'Young Adult'
    WHEN age >= 27 AND age <= 40 THEN 'Adult'
    WHEN age >= 41 AND age <= 54 THEN 'Middle-Age'
    ELSE 'Senior'
END AS age_group,
CASE 
	WHEN likes > 0 OR friendships_initiated > 0 THEN 'Yes'
	ELSE 'No'
END AS active_user,
friendships_initiated + likes AS interactions
FROM users;