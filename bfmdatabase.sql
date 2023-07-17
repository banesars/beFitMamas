USE bfm; 

CREATE TABLE users (
    username VARCHAR(200) PRIMARY KEY,
    password VARCHAR(200),
    email VARCHAR(200),
    joinDate date
);

DROP TABLE users;

CREATE TABLE profiles (
    usernameprofileID int PRIMARY KEY,
    username VARCHAR(200),
    bio VARCHAR(1000),
    profilePic VARCHAR(200),
    startWeight int,
    goalWeight int,
    calories int
);

DROP TABLE profile;

CREATE TABLE workouts (
    workoutName VARCHAR(200) PRIMARY KEY,
    intensity VARCHAR(200),
    description VARCHAR(200)
);

CREATE TABLE nutrition (
    foodName VARCHAR(200) PRIMARY KEY,
    description VARCHAR(200),
    calories int
);

INSERT INTO Users (username, password)
VALUES ('xbanesa', 'banesa');


INSERT INTO Users (username, password, email)
VALUES ('bane','bane', 'bane@gmail.com');

SELECT * FROM Users;