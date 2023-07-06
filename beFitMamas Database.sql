-- Create the database
CREATE DATABASE beFitMamas;

-- Use the database
USE beFitMamas;

-- Create the table for storing users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id),
    UNIQUE (username),
    UNIQUE (email)
);

-- Create the table for storing workouts/exercises
CREATE TABLE workouts (
    workout_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    intensity ENUM('Low', 'Moderate', 'High') NOT NULL,
    duration INT,
    PRIMARY KEY (workout_id)
);

-- Create the table for storing food/nutrition information
CREATE TABLE nutrition (
    nutrition_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    calories INT,
    PRIMARY KEY (nutrition_id)
);

-- Create the table for storing forum categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (category_id)
);

-- Create the table for storing forum topics
CREATE TABLE topics (
    topic_id INT AUTO_INCREMENT,
    category_id INT NOT NULL,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (topic_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the table for storing forum posts
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT,
    topic_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id),
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the table for storing user profiles
CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    full_name VARCHAR(100),
    date_of_birth DATE,
    bio TEXT,
    profile_picture VARCHAR(255),
    PRIMARY KEY (profile_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

