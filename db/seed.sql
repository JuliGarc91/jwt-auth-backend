-- db/seed.sql
\c jwt_auth

INSERT INTO users (username, password_hash, email, created_at, updated_at)
VALUES 
('demo', '$2b$10$.z68x3792U9LyBwmghfsKexstMO7i0SeNCoDmeJa7bEFPQBnZU3bK', 'demo@example.com', NOW(), NOW());

INSERT INTO plants (userId, name, species, color, plantType, isFloweringPlant, soilType, careInstructions, imageUrl)
VALUES 
(1, 'Spider Plant', 'Chlorophytum comosum', 'Variegated', ' evergreen perennial', TRUE, 'General Purpose Potting Soil','Keep soil evenly moist but not waterlogged. Prefers indirect sunlight. Fun fact: The brighter the sunlight, the more stripes your plant will produce. Too bright of sun, though, and the leaves will scorch.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713548460/Garden%20Nook/spider-plant.avif'),

(1, 'Snake Plant', 'Sansevieria trifasciata', 'Variegated','evergreen perennial', TRUE, 'Sandy Soil','Allow soil to dry out between waterings. Snake plants can do well in almost any light, from dimly lit rooms to full sun, but they grow more quickly in bright, indirect light. Tolerates low light conditions.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543727/Garden%20Nook/snake-plant.avif'),

(1, 'Sky Scraper Sunflower', 'Helianthus annuus', 'yellow','annual', TRUE, 'Alkaline Well-draining Soil','Grows up to 12 feet! Plant in garden eventually. I need to Set the pot in a bright spot that gets sun for a good portion of the day. When the soil is dry, water 1 to 2 inches down from the top. Fertilize with a weak liquid fertilizer two to three times over the spring and summer or work some slow-release fertilizer into the soil once in the spring (alkaline soil). This is a great variety to grow near a fence or garage. Bees will love the flowers that bloom throughout the summer. Plenty of seeds for roasting—or leave in the garden so birds can come and feast.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713632818/Garden%20Nook/skyscraper-sunflower.jpg'),

(1, 'Strawberry Blonde Sunflower', 'Helianthus annuus', 'Pink and light yellow', 'annual', TRUE, 'Alkaline Well-draining Soil',' Start Early for Transplants, Heat Tolerant, Easy to Grow. This is one of several sunflower types that is deer-resistant. It is a field crop; eventually plant in garden so it can thrive!!! (grows 5-6 feet)', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713632615/Garden%20Nook/strawberry-blonde-sunflower.jpg'),

(1, 'Tea Rose', 'Abracadabra Floribunda', 'Red,  yellow', 'shrub', TRUE, 'moist well-drained soil', 'It is possible that each flowering is in a different color, each season is a different color or during one season (even in one flowering) there are different colors. Propagating roses is possible! Full sun!!', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713549727/Garden%20Nook/tea-rose.jpg')
;

-- image url to see plant's progress everytime theres a log
INSERT INTO careLogs (plantId, careDate, plantName, description, imageUrl, heightInInches, isPropagation, needsRepotting, sunlightHoursPerDay, soilMoisturePercentDaily, mLWaterAddedToday)
VALUES
(1, '2024-04-01', 'Spider Plant', 'Day 1: snipped babies, and propagated the spider plant.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543804/Garden%20Nook/Spider-Plant-Propagation-1.jpg', 1, TRUE, FALSE, 6, 0, 20),
(1, '2024-04-03', 'Spider Plant', 'Day 3: Propagated the spider plant - some root growth', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543801/Garden%20Nook/Spider-Plant-Propagation-2.jpg', 2, TRUE, FALSE, 6, 0, 0),
(1, '2024-04-05', 'Spider Plant', 'Day 5: Propagated the spider plant - good amount of root growth. Plant ready to be planted', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543968/Garden%20Nook/Spider-Plant-Propagation-3.jpg', 3, TRUE, TRUE, 6, 0, 0),
(1, '2024-04-13', 'Spider Plant', 'Day 13: Propagated the spider plant - ALOT of root growth. Plant definitely needs to be planted', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543803/Garden%20Nook/Spider-Plant-Propagation-4.jpg', 5, TRUE, TRUE, 6, 0, 20),
(1, '2024-04-13', 'Spider Plant', 'Day 13: Planted and watered propagations!', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543969/Garden%20Nook/Spider-Plant-Propagation-Planted.jpg', 5, FALSE, TRUE, 6, 65, 50),
(2, '2024-04-12', 'Snake Plant', 'Had Snake plant under artificial light until this evening', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713550472/Garden%20Nook/snake-plant-bad-leaves-1.jpg', 9, FALSE, TRUE, 15, 50, 10),
(2, '2024-04-13', 'Snake Plant', 'Trimmed dead leaves from the snake plant; moved it to window for natural light to prevent further sun burn.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713550557/Garden%20Nook/snake-plant-bad-leaves-2.jpg', 9, FALSE, TRUE, 7, 50, 0),
(2, '2024-04-14', 'Snake Plant', 'Snake plant still does not look too good. Probably the roots are not doing well since it had alot of growth and needs bigger pot', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713550631/Garden%20Nook/snake-plant-bad-leaves-3.webp', 9, FALSE, TRUE, 7, 50, 0);