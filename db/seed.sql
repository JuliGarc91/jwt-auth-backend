-- db/seed.sql
\c jwt_auth

INSERT INTO users (username, password_hash, email, created_at, updated_at)
VALUES 
('demo', '$2b$10$.z68x3792U9LyBwmghfsKexstMO7i0SeNCoDmeJa7bEFPQBnZU3bK', 'demo@example.com', NOW(), NOW());

INSERT INTO plants (userId, name, species, color, plantType, isFloweringPlant, soilType, careInstructions, imageUrl)
VALUES 
(1, 'Spider Plant', 'Chlorophytum comosum', 'Variegated', ' evergreen perennial', TRUE, 'General Purpose Potting Soil','Keep soil evenly moist but not waterlogged. Prefers indirect sunlight. Fun fact: The brighter the sunlight, the more stripes your plant will produce. Too bright of sun, though, and the leaves will scorch.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713548460/Garden%20Nook/spider-plant.avif'),
(1, 'Snake Plant', 'Sansevieria trifasciata', 'Variegated','evergreen perennial', TRUE, 'Sandy Soil','Allow soil to dry out between waterings. Snake plants can do well in almost any light, from dimly lit rooms to full sun, but they grow more quickly in bright, indirect light. Tolerates low light conditions.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543727/Garden%20Nook/snake-plant.avif'),
(1, 'Peace Lily', 'Spathiphyllum wallisii', 'Dark Green', 'evergreen perennial', TRUE, 'Orchid Bark and Sandy Soil Mixture','Keep soil consistently moist. Thrives in low to medium light conditions. Peace Lilies are not cold hardy plants and prefer to live in spaces within 55-80°F (13-26°C) and not in direct line of drafts or air vents.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543780/Garden%20Nook/peace-lily.avif'),
(1, 'Pink Echeveria', 'Echeveria laui', 'light pink', 'evergreen succulent', TRUE, 'Sandy Soil', 'As the plant matures you can expect it to reach up to around 15 cm (6 inches) tall. The leaves are beautiful, fleshy and pink - making it the plant''s most dominant feature. When it flowers you can expect it to produce peachy to rose colored petals that bloom from summer to fall. Prefers full sun. Can be grown outdoors - Grows 15 cm (6 inches) tall. Grows up to 12.5 cm (5 inches) wide. Can die easily if overwatered.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713548713/Garden%20Nook/pink-echeveria.jpg'),
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
(2, '2024-04-14', 'Snake Plant', 'Snake plant still does not look too good. Probably the roots are not doing well since it had alot of growth and needs bigger pot', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713550631/Garden%20Nook/snake-plant-bad-leaves-3.webp', 9, FALSE, TRUE, 7, 50, 0),
(3, '2024-04-12', 'Peace Lily' ,'Applied fertilizer to the peace lily.', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1713543802/Garden%20Nook/peace-lily-fertilizer.jpg', 12, FALSE, TRUE, 5, 50, 30);