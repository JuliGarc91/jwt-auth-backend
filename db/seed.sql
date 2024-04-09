-- db/seed.sql
\c jwt_auth

INSERT INTO users (username, password_hash, email, created_at, updated_at)
VALUES 
('demo', '$2b$10$.z68x3792U9LyBwmghfsKexstMO7i0SeNCoDmeJa7bEFPQBnZU3bK', 'demo@example.com', NOW(), NOW());

INSERT INTO plants (userId, name, species, careInstructions, imageUrl)
VALUES (1, 'Spider Plant', 'Chlorophytum comosum', 'Keep soil evenly moist but not waterlogged. Prefers indirect sunlight.', './images/spider-plant.webp'),
       (1, 'Snake Plant', 'Sansevieria trifasciata', 'Allow soil to dry out between waterings. Tolerates low light conditions.', './images/snake-plant.webp'),
       (1, 'Peace Lily', 'Spathiphyllum wallisii', 'Keep soil consistently moist. Thrives in low to medium light conditions.', './images/peace-lily.webp');
