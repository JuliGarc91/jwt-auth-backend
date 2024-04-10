-- db/seed.sql
\c jwt_auth

INSERT INTO users (username, password_hash, email, created_at, updated_at)
VALUES 
('demo', '$2b$10$.z68x3792U9LyBwmghfsKexstMO7i0SeNCoDmeJa7bEFPQBnZU3bK', 'demo@example.com', NOW(), NOW());

INSERT INTO plants (userId, name, species, careInstructions, imageUrl)
VALUES 
(1, 'Spider Plant', 'Chlorophytum comosum', 'Keep soil evenly moist but not waterlogged. Prefers indirect sunlight.', 'https://images.unsplash.com/photo-1611527664689-d430dd2a6774?q=80&w=1746&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Snake Plant', 'Sansevieria trifasciata', 'Allow soil to dry out between waterings. Tolerates low light conditions.', 'https://images.unsplash.com/photo-1599009944474-5bc0ff20db85?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Peace Lily', 'Spathiphyllum wallisii', 'Keep soil consistently moist. Thrives in low to medium light conditions.', 'https://images.unsplash.com/photo-1593691509543-c55fb32d8de5?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Pink Echeveria', 'Echeveria laui', "As the plant matures you can expect it to reach up to around 15 cm (6″) tall. The leaves are beautiful, fleshy and pink - making it the plant's most dominant feature. When it flowers you can expect it to produce peachy to rose colored petals that bloom from summer to fall. Prefers full sun. Can be grown outdoors - Grows 15 cm (6 inches) tall. Grows up to 12.5 cm (5 inches) wide. Can die easily if overwatered.", 'https://perenual.com/storage/marketplace/3-Whimsy%20and%20Wonder%20Seeds/p-vT1K64138e514c30d1/i-0-btff64138e514c3931.jpg')
;
