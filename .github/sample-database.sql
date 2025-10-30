-- Sample Database Schema for Testing
-- This SQL file demonstrates common database operations and structures
-- Compatible with most SQL databases (PostgreSQL, MySQL, SQLite)

-- ============================================
-- Database Setup
-- ============================================

-- Create database (comment out if not needed)
-- CREATE DATABASE testdb;
-- USE testdb;

-- ============================================
-- Tables
-- ============================================

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'user',
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE IF NOT EXISTS posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    status VARCHAR(20) DEFAULT 'draft',
    views INTEGER DEFAULT 0,
    published_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Comments table
CREATE TABLE IF NOT EXISTS comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    approved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tags table
CREATE TABLE IF NOT EXISTS tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Post-Tag relationship (many-to-many)
CREATE TABLE IF NOT EXISTS post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- ============================================
-- Indexes for Performance
-- ============================================

CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_posts_user_id ON posts(user_id);
CREATE INDEX IF NOT EXISTS idx_posts_status ON posts(status);
CREATE INDEX IF NOT EXISTS idx_comments_post_id ON comments(post_id);
CREATE INDEX IF NOT EXISTS idx_comments_user_id ON comments(user_id);
CREATE INDEX IF NOT EXISTS idx_tags_slug ON tags(slug);

-- ============================================
-- Sample Data
-- ============================================

-- Insert sample users
INSERT INTO users (username, email, first_name, last_name, password_hash, role, active) VALUES
('johndoe', 'john.doe@example.com', 'John', 'Doe', 'hashed_password_1', 'admin', TRUE),
('janesmith', 'jane.smith@example.com', 'Jane', 'Smith', 'hashed_password_2', 'user', TRUE),
('bobwilson', 'bob.wilson@example.com', 'Bob', 'Wilson', 'hashed_password_3', 'user', TRUE),
('alicejones', 'alice.jones@example.com', 'Alice', 'Jones', 'hashed_password_4', 'moderator', TRUE),
('testuser', 'test@example.com', 'Test', 'User', 'hashed_password_5', 'user', FALSE);

-- Insert sample posts
INSERT INTO posts (user_id, title, content, status, views, published_at) VALUES
(1, 'Getting Started with SQL', 'This is a comprehensive guide to SQL basics...', 'published', 150, '2024-01-15 10:00:00'),
(1, 'Advanced Database Design', 'Learn about normalization and optimization...', 'published', 89, '2024-02-20 14:30:00'),
(2, 'My First Blog Post', 'Hello everyone! This is my first post...', 'published', 45, '2024-03-10 09:15:00'),
(2, 'Work in Progress', 'This post is still being written...', 'draft', 0, NULL),
(3, 'Testing Best Practices', 'Here are some tips for effective testing...', 'published', 234, '2024-01-25 16:45:00');

-- Insert sample comments
INSERT INTO comments (post_id, user_id, content, approved) VALUES
(1, 2, 'Great article! Very helpful.', TRUE),
(1, 3, 'Thanks for sharing this!', TRUE),
(1, 4, 'Could you add more examples?', TRUE),
(3, 1, 'Nice tips! I will try these.', TRUE),
(5, 2, 'This is exactly what I needed.', TRUE),
(5, 4, 'Excellent guide!', TRUE);

-- Insert sample tags
INSERT INTO tags (name, slug) VALUES
('SQL', 'sql'),
('Database', 'database'),
('Tutorial', 'tutorial'),
('Best Practices', 'best-practices'),
('Testing', 'testing'),
('Design', 'design');

-- Link posts to tags
INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 6),
(3, 3),
(5, 4), (5, 5);

-- ============================================
-- Sample Queries
-- ============================================

-- Get all published posts with user information
SELECT 
    p.id,
    p.title,
    p.content,
    p.views,
    p.published_at,
    u.username,
    u.first_name,
    u.last_name
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.status = 'published'
ORDER BY p.published_at DESC;

-- Get post with all its comments
SELECT 
    p.title AS post_title,
    c.content AS comment_content,
    u.username AS commenter,
    c.created_at AS comment_date
FROM posts p
LEFT JOIN comments c ON p.id = c.post_id
LEFT JOIN users u ON c.user_id = u.id
WHERE p.id = 1 AND c.approved = TRUE
ORDER BY c.created_at ASC;

-- Get posts with tag counts
SELECT 
    p.id,
    p.title,
    COUNT(pt.tag_id) AS tag_count
FROM posts p
LEFT JOIN post_tags pt ON p.id = pt.post_id
GROUP BY p.id, p.title
ORDER BY tag_count DESC;

-- Get most active users (by post count)
SELECT 
    u.username,
    u.email,
    COUNT(p.id) AS post_count
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id, u.username, u.email
ORDER BY post_count DESC;

-- Get tags with post counts
SELECT 
    t.name,
    t.slug,
    COUNT(pt.post_id) AS post_count
FROM tags t
LEFT JOIN post_tags pt ON t.id = pt.tag_id
GROUP BY t.id, t.name, t.slug
ORDER BY post_count DESC;

-- Full-text search example (SQLite FTS or similar)
SELECT 
    p.id,
    p.title,
    p.content
FROM posts p
WHERE p.title LIKE '%SQL%' OR p.content LIKE '%SQL%';

-- Get recent activity (posts and comments)
SELECT 
    'post' AS type,
    p.title AS content,
    u.username,
    p.created_at
FROM posts p
JOIN users u ON p.user_id = u.id
UNION ALL
SELECT 
    'comment' AS type,
    SUBSTR(c.content, 1, 50) AS content,
    u.username,
    c.created_at
FROM comments c
JOIN users u ON c.user_id = u.id
ORDER BY created_at DESC
LIMIT 10;

-- ============================================
-- Update and Delete Examples
-- ============================================

-- Update post views
-- UPDATE posts SET views = views + 1 WHERE id = 1;

-- Update user information
-- UPDATE users 
-- SET first_name = 'Jonathan', updated_at = CURRENT_TIMESTAMP 
-- WHERE username = 'johndoe';

-- Approve a comment
-- UPDATE comments SET approved = TRUE WHERE id = 1;

-- Delete a draft post
-- DELETE FROM posts WHERE status = 'draft' AND user_id = 2;

-- Soft delete (deactivate user)
-- UPDATE users SET active = FALSE WHERE username = 'testuser';

-- ============================================
-- Views (Optional)
-- ============================================

-- Create a view for published posts with user info
CREATE VIEW IF NOT EXISTS published_posts_view AS
SELECT 
    p.id,
    p.title,
    p.content,
    p.views,
    p.published_at,
    u.username,
    u.first_name || ' ' || u.last_name AS author_name,
    u.email AS author_email
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.status = 'published';

-- ============================================
-- Cleanup (Uncomment to drop tables)
-- ============================================

-- DROP VIEW IF EXISTS published_posts_view;
-- DROP TABLE IF EXISTS post_tags;
-- DROP TABLE IF EXISTS comments;
-- DROP TABLE IF EXISTS tags;
-- DROP TABLE IF EXISTS posts;
-- DROP TABLE IF EXISTS users;
