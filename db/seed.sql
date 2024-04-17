-- db/seed.sql
\c jwt_auth

INSERT INTO users (username, password_hash, email, created_at, updated_at)
VALUES 
('demo', '$2b$10$.z68x3792U9LyBwmghfsKexstMO7i0SeNCoDmeJa7bEFPQBnZU3bK', 'demo@example.com', NOW(), NOW());

INSERT INTO plants (userId, name, species, color, plantType, isFloweringPlant, soilType, careInstructions, imageUrl)
VALUES 
(1, 'Spider Plant', 'Chlorophytum comosum', 'Variegated', ' evergreen perennial', TRUE, 'General Purpose Potting Soil','Keep soil evenly moist but not waterlogged. Prefers indirect sunlight. Fun fact: The brighter the sunlight, the more stripes your plant will produce. Too bright of sun, though, and the leaves will scorch.', 'https://images.unsplash.com/photo-1608161779298-f42256d2c58d?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Snake Plant', 'Sansevieria trifasciata', 'Variegated','evergreen perennial', TRUE, 'Sandy Soil','Allow soil to dry out between waterings. Snake plants can do well in almost any light, from dimly lit rooms to full sun, but they grow more quickly in bright, indirect light. Tolerates low light conditions.', 'https://images.unsplash.com/photo-1599009944474-5bc0ff20db85?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Peace Lily', 'Spathiphyllum wallisii', 'Dark Green', 'evergreen perennial', TRUE, 'Orchid Bark and Sandy Soil Mixture','Keep soil consistently moist. Thrives in low to medium light conditions. Peace Lilies are not cold hardy plants and prefer to live in spaces within 55-80°F (13-26°C) and not in direct line of drafts or air vents.', 'https://images.unsplash.com/photo-1642049671771-8b22a7152bda?q=80&w=3406&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(1, 'Pink Echeveria', 'Echeveria laui', 'light pink', 'evergreen succulent', TRUE, 'Sandy Soil', 'As the plant matures you can expect it to reach up to around 15 cm (6 inches) tall. The leaves are beautiful, fleshy and pink - making it the plant''s most dominant feature. When it flowers you can expect it to produce peachy to rose colored petals that bloom from summer to fall. Prefers full sun. Can be grown outdoors - Grows 15 cm (6 inches) tall. Grows up to 12.5 cm (5 inches) wide. Can die easily if overwatered.', 'https://perenual.com/storage/marketplace/3-Whimsy%20and%20Wonder%20Seeds/p-vT1K64138e514c30d1/i-0-btff64138e514c3931.jpg')
;



/*
CREATE TABLE careLogs (
  id SERIAL PRIMARY KEY,
  plantId INTEGER NOT NULL,
  plantName VARCHAR(255) NOT NULL,
  careDate TEXT,
  description TEXT,
  imageUrl TEXT,
  heightInInches INTEGER,
  isPropagation BOOLEAN,
  needsRepotting BOOLEAN,
  sunlightHoursPerDay INTEGER CHECK (sunlightHoursPerDay >= 1 AND sunlightHoursPerDay <= 24),
  soilMoisturePercentDaily INTEGER CHECK (soilMoisturePercentDaily >= 0 AND soilMoisturePercentDaily <= 100),
  mLWaterAddedToday INTEGER,
  FOREIGN KEY (plantId) REFERENCES plants(id)
);*/
-- image url to see plant's progress everytime theres a log
INSERT INTO careLogs (plantId, careDate, plantName, description, imageUrl, heightInInches, isPropagation, needsRepotting, sunlightHoursPerDay, soilMoisturePercentDaily, mLWaterAddedToday)
VALUES
(1, '2024-04-01', 'Spider Plant', 'Day 1: snipped babies, and propagated the spider plant.', 'https://www.fwmadebycarli.com/wp-content/uploads/2020/03/Spider-Plant-Propagation-10-1536x1281.jpg', 1, TRUE, FALSE, 6, 0, 20),
(1, '2024-04-03', 'Spider Plant', 'Day 3: Propagated the spider plant - some root growth', 'https://www.fwmadebycarli.com/wp-content/uploads/2020/03/Spider-Plant-Propagation-2-1536x1055.jpg', 2, TRUE, FALSE, 6, 0, 0),
(1, '2024-04-05', 'Spider Plant', 'Day 5: Propagated the spider plant - good amount of root growth. Plant ready to be planted', 'https://www.fwmadebycarli.com/wp-content/uploads/2020/03/66301-1536x1048.jpg', 3, TRUE, TRUE, 6, 0, 0),
(1, '2024-04-13', 'Spider Plant', 'Day 13: Propagated the spider plant - ALOT of root growth. Plant definitely needs to be planted', 'https://www.fwmadebycarli.com/wp-content/uploads/2020/03/Spider-Plant-Propagation-4-scaled.jpg', 5, TRUE, TRUE, 6, 0, 20),
(1, '2024-04-13', 'Spider Plant', 'Day 13: Planted and watered propagations!', 'https://www.fwmadebycarli.com/wp-content/uploads/2020/08/DD154B2B-20FE-4459-9717-6C81549BA108-1536x1060.jpeg', 5, FALSE, TRUE, 6, 65, 50),
(2, '2024-04-12', 'Snake Plant', 'Had Snake plant under artificial light until this evening', 'https://i.redd.it/y5e7bc7igbta1.jpg', 9, FALSE, TRUE, 15, 50, 10),
(2, '2024-04-13', 'Snake Plant', 'Trimmed dead leaves from the snake plant; moved it to window for natural light to prevent further sun burn.', 'https://www.bloomingbackyard.com/wp-content/uploads/2021/10/prune-snake-plant-768x1152.jpg', 9, FALSE, TRUE, 7, 50, 0),
(2, '2024-04-14', 'Snake Plant', 'Snake plant still does not look too good. Probably the roots are not doing well since it had alot of growth and needs bigger pot', 'https://preview.redd.it/kepcla5qrjl71.jpg?width=1080&crop=smart&auto=webp&s=6a602738c254e30bfaee8d2ea66ea0877e9a5ee5', 9, FALSE, TRUE, 7, 50, 0),
(3, '2024-04-12', 'Peace Lily' ,'Applied fertilizer to the peace lily.', 'https://www.pennington.com/all-products/fertilizer/resources/-/media/Project/OneWeb/Pennington/Images/blog/fertilizer/how-to-grow-and-care-for-a-peace-lily/waking-winter-plants.jpg', 12, FALSE, TRUE, 5, 50, 30);