-----------------------------------------------------------
-- Autor: Diego Granados
-- Fecha: 04/20/2023
-- Descripcion: En este script se insertan idiomas, sus nombres y traduccioens, y algunos países, estados y provincias
-----------------------------------------------------------

-- Inserting data into the idiomas table
INSERT INTO idiomas (enabled)
VALUES (1), (1), (1), (1), (1), (1)

-- Inserting data into the nombres table
INSERT INTO nombres (nombreBase, idiomaId, enabled)
VALUES
('English', 1, 1),
('Español', 2, 1),
('Français', 3, 1),
('Português', 4, 1),
('Italiano', 5, 1),
('Deutsch', 6, 1)

-- Inserting data into the traduccionesPorIdioma table
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled)
VALUES
-- Translations for English
(1, 1, 'English', 1),
(2, 1, 'Inglés', 1),
(3, 1, 'Anglais', 1),
(4, 1, 'Inglês', 1),
(5, 1, 'Inglese', 1),
(6, 1, 'Englisch', 1),

-- Translations for Spanish
(1, 2, 'Spanish', 1),
(2, 2, 'Español', 1),
(3, 2, 'Espagnol', 1),
(4, 2, 'Espanhol', 1),
(5, 2, 'Spagnolo', 1),
(6, 2, 'Spanisch', 1),

-- Translations for French
(1, 3, 'French', 1),
(2, 3, 'Francés', 1),
(3, 3, 'Français', 1),
(4, 3, 'Francês', 1),
(5, 3, 'Francese', 1),
(6, 3, 'Französisch', 1),

-- Translations for Portuguese
(1, 4, 'Portuguese', 1),
(2, 4, 'Portugués', 1),
(3, 4, 'Portugais', 1),
(4, 4, 'Português', 1),
(5, 4, 'Portoghese', 1),
(6, 4, 'Portugiesisch', 1),

-- Translations for Italian
(1, 5, 'Italian', 1),
(2, 5, 'Italiano', 1),
(3, 5, 'Italien', 1),
(4, 5, 'Italiano', 1),
(5, 5, 'Italiano', 1),
(6, 5, 'Italienisch', 1),

-- Translations for German
(1, 6, 'German', 1),
(2, 6, 'Alemán', 1),
(3, 6, 'Allemand', 1),
(4, 6, 'Alemão', 1),
(5, 6, 'Tedesco', 1),
(6, 6, 'Deutsch', 1)

UPDATE idiomas
SET nombreId = idiomaId
WHERE idiomaId>0;

--INSERT statements for nombres table
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('United States', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Canada', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Mexico', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('United Kingdom', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('France', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Spain', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Italy', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Germany', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Japan', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('South Korea', 1, 1);

--INSERT statements for traduccionesPorIdioma table
--English translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 7, 'United States', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 8, 'Canada', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 9, 'Mexico', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 10, 'United Kingdom', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 11, 'France', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 12, 'Spain', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 13, 'Italy', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 14, 'Germany', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 15, 'Japan', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (1, 16, 'South Korea', 1);

--Spanish translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 7, 'Estados Unidos', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 8, 'Canadá', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 9, 'México', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 10, 'Reino Unido', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 11, 'Francia', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 12, 'España', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 13, 'Italia', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 14, 'Alemania', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 15, 'Japón', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (2, 16, 'Corea del Sur', 1);

--French translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 7, 'États-Unis', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 8, 'Canada', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 9, 'Mexique', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 10, 'Royaume-Uni', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 11, 'France', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 12, 'Espagne', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 13, 'Italie', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 14, 'Allemagne', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 15, 'Japon', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (3, 16, 'Corée du Sud', 1);

--Portuguese translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 7, 'Estados Unidos', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 8, 'Canadá', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 9, 'México', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 10, 'Reino Unido', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 11, 'França', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 12, 'Espanha', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 13, 'Itália', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 14, 'Alemanha', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 15, 'Japão', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (4, 16, 'Coreia do Sul', 1);

--Italian translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 7, 'Stati Uniti', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 8, 'Canada', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 9, 'Messico', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 10, 'Regno Unito', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 11, 'Francia', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 12, 'Spagna', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 13, 'Italia', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 14, 'Germania', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 15, 'Giappone', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (5, 16, 'Corea del Sud', 1);

--German translations
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 7, 'Vereinigte Staaten', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 8, 'Kanada', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 9, 'Mexiko', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 10, 'Vereinigtes Königreich', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 11, 'Frankreich', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 12, 'Spanien', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 13, 'Italien', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 14, 'Deutschland', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 15, 'Japan', 1);
INSERT INTO traduccionesPorIdioma (idiomaId, nombreId, traduccion, enabled) VALUES (6, 16, 'Südkorea', 1);

INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('California', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Texas', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Ontario', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Quebec', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Jalisco', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Nuevo Leon', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Kent', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Lanarkshire', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Île-de-France', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Provence-Alpes-Côte d''Azur', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Catalonia', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Andalusia', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Lombardy', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Veneto', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Bavaria', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('North Rhine-Westphalia', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Tokyo', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Osaka', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Seoul', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Busan', 1, 1);

INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Los Angeles', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Houston', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Toronto', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Montreal', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Guadalajara', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Monterrey', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Maidstone', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Motherwell', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Paris', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Marseille', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Barcelona', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Seville', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Milan', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Venice', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Munich', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Cologne', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Tokyo', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Osaka', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Seoul', 1, 1);
INSERT INTO nombres (nombreBase, idiomaId, enabled) VALUES ('Busan', 1, 1);

--Insert statements for countries
INSERT INTO paises (nombreId, enabled) VALUES (7, 1); --United States
INSERT INTO paises (nombreId, enabled) VALUES (8, 1); --Canada
INSERT INTO paises (nombreId, enabled) VALUES (9, 1); --Mexico
INSERT INTO paises (nombreId, enabled) VALUES (10, 1); --United Kingdom
INSERT INTO paises (nombreId, enabled) VALUES (11, 1); --France
INSERT INTO paises (nombreId, enabled) VALUES (12, 1); --Spain
INSERT INTO paises (nombreId, enabled) VALUES (13, 1); --Italy
INSERT INTO paises (nombreId, enabled) VALUES (14, 1); --Germany
INSERT INTO paises (nombreId, enabled) VALUES (15, 1); --Japan
INSERT INTO paises (nombreId, enabled) VALUES (16, 1); --South Korea

--Insert statements for states/provinces
INSERT INTO estados (nombreId, enabled, paisId) VALUES (17, 1, 1); --California, USA
INSERT INTO estados (nombreId, enabled, paisId) VALUES (18, 1, 1); --Texas, USA
INSERT INTO estados (nombreId, enabled, paisId) VALUES (19, 1, 2); --Ontario, Canada
INSERT INTO estados (nombreId, enabled, paisId) VALUES (20, 1, 2); --Quebec, Canada
INSERT INTO estados (nombreId, enabled, paisId) VALUES (21, 1, 3); --Jalisco, Mexico
INSERT INTO estados (nombreId, enabled, paisId) VALUES (22, 1, 3); --Nuevo Leon, Mexico
INSERT INTO estados (nombreId, enabled, paisId) VALUES (23, 1, 4); --Kent, UK
INSERT INTO estados (nombreId, enabled, paisId) VALUES (24, 1, 4); --Lanarkshire, UK
INSERT INTO estados (nombreId, enabled, paisId) VALUES (25, 1, 5); --Île-de-France, France
INSERT INTO estados (nombreId, enabled, paisId) VALUES (26, 1, 5); --Provence-Alpes-Côte d'Azur, France
INSERT INTO estados (nombreId, enabled, paisId) VALUES (27, 1, 6); --Catalonia, Spain
INSERT INTO estados (nombreId, enabled, paisId) VALUES (28, 1, 6); --Andalusia, Spain
INSERT INTO estados (nombreId, enabled, paisId) VALUES (29, 1, 7); --Lombardy, Italy
INSERT INTO estados (nombreId, enabled, paisId) VALUES (30, 1, 7); --Veneto, Italy
INSERT INTO estados (nombreId, enabled, paisId) VALUES (31, 1, 8); --Bavaria, Germany
INSERT INTO estados (nombreId, enabled, paisId) VALUES (32, 1, 8); --North Rhine-Westphalia, Germany
INSERT INTO estados (nombreId, enabled, paisId) VALUES (33, 1, 9); --Tokyo, Japan
INSERT INTO estados (nombreId, enabled, paisId) VALUES (34, 1, 9); --Osaka, Japan
INSERT INTO estados (nombreId, enabled, paisId) VALUES (35, 1, 10); --Seoul, South Korea
INSERT INTO estados (nombreId, enabled, paisId) VALUES (36, 1, 10); --Busan, South Korea

INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (37, 1, 1); -- Los Angeles, California
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (38, 1, 2); -- Houston, Texas
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (39, 1, 3); -- Toronto, Ontario
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (40, 1, 4); -- Montreal, Quebec
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (41, 1, 5); -- Guadalajara, Jalisco
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (42, 1, 6); -- Monterrey, Nuevo Leon
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (43, 1, 7); -- Maidstone, Kent
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (44, 1, 8); -- Motherwell, Lanarkshire
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (45, 1, 9); -- Paris, Île-de-France
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (46, 1, 10); -- Marseille, Provence-Alpes-Côte d'Azur
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (47, 1, 11); -- Barcelona, Catalonia
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (48, 1, 12); -- Seville, Andalusia
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (49, 1, 13); -- Milan, Lombardy
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (50, 1, 14); -- Venice, Veneto
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (51, 1, 15); -- Munich, Bavaria
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (52, 1, 16); -- Cologne, North Rhine-Westphalia
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (53, 1, 17); -- Tokyo, Tokyo
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (54, 1, 18); -- Osaka, Osaka
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (55, 1, 19); -- Seoul, Seoul
INSERT INTO ciudades (nombreId, enabled, estadoId) VALUES (56, 1, 20); -- Busan, Busan

