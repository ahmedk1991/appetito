ALTER TABLE Dish
    ALTER COLUMN ACTIVE SET DEFAULT TRUE;

INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'pasta alfredo met kip',
           'paleo',
           '00:20:00',
           'avondmaal',
           '/img/pasta_alfredo.jpg'
       );

INSERT INTO Ingredient (name, quantity, unit, dish_id,estimated_price)
VALUES
    ('fettuccine', 75, 'gr', 1,2.0),
    ('roomboter', 22.5, 'gr', 1,3.0),
    ('Parmezaanse kaas (geraspt)', 31.25, 'gr', 1,4.50),
    ('zwarte peper', 0, NULL, 1,3.99),
    ('kipstukjes (vega) (Garden Gourmet)', 62.5, 'gr', 1,8.0),
    ('knoflook (fijngehakt)', 0.25, 'gr', 1,7.0),
    ('peterselie (gehakt voor garnering)', 0, NULL, 1,5.0),
    ('Kookvocht van de pasta (bewaar een scheut)', 0, NULL, 1,6.50);



INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('4 g', '500 mg', '1 g', '15 g', '30 g', '400 gr', '20 g', 1);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Pasta met zalm en spinazie',
           'paleo',
           '00:30:00',
           'avondmaal',
           '/img/pasta_zalm.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('tagliatelle', 350, 'gr', 2,6.99),
    ('kookroom (light)', 350, 'ml', 2,5.99),
    ('verse spinazie', 400, 'gr', 2,4.99),
    ('zalmfilet', 400, 'gr', 2,6.50),
    ('ui', 1, NULL, 2,5.0),
    ('peper en zout', 0, NULL, 2,3.99),
    ('cherrytomaatjes', 250, 'gr', 2,6.99),
    ('pijnboompitten (geroosterd)', 50, 'gr', 2,8.0),
    ('teentjes knoflook', 2, NULL, 2,3.50),
    ('olijfolie', 1, 'eetlepel', 2,7.50);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('6 g', '500 mg', '1 g', '8 g', '20 g', '400 gr', '30 g', 2);


INSERT INTO DISH ( NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (

           'Spinaziesoep',
           'vegetarisch',
           '00:20:00',
           'avondmaal','/img/spinaziesoep.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('gehakte spinazie (ontdooid)', 450, 'gr', 3,4.50),
    ('boter of margarine', 2, 'eetlepels', 3,4.0),
    ('ui', 1, NULL, 3,4.50),
    ('middelgrote aardappel', 200, 'gr', 3,2.0),
    ('water', 1000, 'ml', 3, 1.50),
    ('groente bouillonblokjes', 2, NULL, 3,6.25),
    ('kookroom', 200, 'ml', 3,5.99);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('4 g', '600 mg', '1 g', '3 g', '5 g', '100 gr', '10 g', 3);

INSERT INTO DISH ( NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Spinazie feta bladerdeegrolletjes',
           'vegetarisch',
           '00:25:00',
           'snacks','/img/spinaziebladerdeeg.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('vers bladerdeeg', 0, NULL, 4,8.50),
    ('feta', 200, 'gr', 4,5.50),
    ('verse spinazie', 400, 'gr', 4,2.0),
    ('peper', 0, 'snuf', 4,2.50),
    ('ei', 1, NULL, 4,2.50),
    ('pijnboompitten', 2, 'eetlepels', 4,2.0);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('2 g', '200 mg', '1 g', '5 g', '6 g', '150 gr', '15 g', 4);

INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Glutenvrije pizza',
           'glutenvrij',
           '00:10:00',
           'middagmaal',
           '/img/glutenvrije_pizza.jpg'
       );


INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('glutenvrije zelfrijzende bakmix (Albert Heijn)', 100, 'gram', 5,5.0),
    ('olijfolie', 0, 'scheutje', 5,4.99),
    ('water', 1, 'eetlepel', 5,1.50),
    ('zout', 0, 'snuf', 5,1.99),
    ('bakpoeder', 0.5, 'theelepel', 5,6.50),
    ('tomatensaus', 3, 'eetlepels', 5,8.50),
    ('zongedroogde tomaten', 3, NULL, 5,8.0),
    ('rode paprika', 0.25, NULL, 5,4.99),
    ('Italiaanse kruiden', 1, 'eetlepel', 5,4.99),
    ('geraspte kaas (vegan)', 20, 'gram', 5,5.99),
    ('peper en zout', 0, 'snuf', 5,3.99);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('3 g', '200 mg', '3 g', '5 g', '10 g', '250 gr', '30 g', 5);

INSERT INTO DISH(NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Snelle cranberry compote',
           'vegan',
           '00:20:00',
           'dessert',
           '/img/cranberry_compote.jpg'
       );


INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES ('verse cranberries', 250, 'gr', 6, 12.50),
       ('balsamico azijn', 2, 'eetlepels',6, 10.0),
       ('sinaasappelsap', 100, 'ml',6, 2.50),
       ('kaneel', 1, 'snuf',6, 4.0),
       ('witte basterdsuiker', 75, 'gr',6, 5.99);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('2 g', '50 mg', '8 g', '0.1 g', '0.5 g', '40 gr', '10 g', 6);


INSERT INTO DISH(NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Snicker bliss balls',
           'dessert',
           '00:10:00',
           'snacks',
           '/img/snicker_balls.jpg'
       );
INSERT INTO INGREDIENT(NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('pindakaas', 2, 'eetlepels', 7,6.99),
    ('dadels', 13, NULL, 7,5.0),
    ('pinda’s', 100, 'gr', 7,6.0),
    ('cacao poeder', 3, 'theelepels', 7,7.0),
    ('maple syrup', 2, 'eetlepels', 7,5.99),
    ('zout', 1, 'snuf', 7,1.99);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('3 g', '50 mg', '10 g', '4 g', '6 g', '150 gr', '15 g', 7);


INSERT INTO DISH(NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Babi ketjap spiezen',
           'keto',
           '00:50:00',
           'avondmaal',
           '/img/babi_ketjap_spiezen.jpg'
       );


INSERT INTO INGREDIENT(NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('varkenslappen', 400, 'gr', 8,10.0),
    ('sjalotje', 1, NULL, 8,7.99),
    ('teentje knoflook', 1, NULL, 8,1.75),
    ('sambal', 0.5, 'theelepel', 8,6.0),
    ('ketchup', 3, 'eetlepels', 8,4.99),
    ('ketjap', 100, 'ml', 8,4.99),
    ('gemalen korianderzaad', 0, NULL, 8,9.0),
    ('gemalen gember', 0, NULL, 8, 9.99),
    ('gebakken uitjes', 0, NULL, 8, 5.99),
    ('bosui', 0, NULL, 8 , 6.0);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('3 g', '800 mg', '15 g', '10 g', '20 g', '300 gr', '20 g', 8);

INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Yoghurt met fruit ontbijt',
           'vegetarisch',
           '00:05:00',
           'ontbijt',
           '/img/yoghurt_granola_ontbijt.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID,ESTIMATED_PRICE)
VALUES
    ('Griekse yoghurt (of plantaardige yoghurt)', 500, 'gr', 9,3.99),
    ('granola', 40, 'gr', 9,5.0),
    ('mango', 1, NULL, 9,9.99),
    ('banaan', 1, NULL, 9,4.99),
    ('blauwe bessen', 200, 'gr', 9,8.0),
    ('hennepzaad', 2, 'eetlepels', 9,6.90);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES('2 g', '80 mg', '20 g', '4 g', '5 g', '200 gr', '30 g', 9);





INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Pompoensoep',
           'veganistisch',
           '00:30:00',
           'avondmaal',
           '/img/pompoensoep.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Pompoen', 500, 'gr', 1, 2.50),
    ('Ui', 100, 'gr', 1, 0.30),
    ('Knoflook', 2, 'tenen', 1, 0.50),
    ('Groentebouillon', 500, 'ml', 1, 1.00),
    ('Kokosmelk', 200, 'ml', 1, 1.50),
    ('Nootmuskaat', 1, 'snufje', 1, 0.10);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('3 g', '500 mg', '5 g', '2 g', '6 g', '30 g', '4 g', 10);



INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Kip Caesar Salade',
           'glutenvrij',
           '00:20:00',
           'middagmaal',
           '/img/kipcaesarsalade.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Kipfilet', 200, 'gr', 2, 3.00),
    ('Romeinse sla', 150, 'gr', 2, 1.00),
    ('Caesar dressing', 50, 'ml', 2, 0.75),
    ('Parmezaanse kaas', 30, 'gr', 2, 1.00),
    ('Glutenvrije croutons', 30, 'gr', 2, 1.50);


INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('2 g', '600 mg', '3 g', '5 g', '15 g', '18 g', '25 g', 11);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Linzensalade met Geitenkaas',
           'vegetarisch',
           '00:25:00',
           'middagmaal',
           '/img/linzen_salade_met_geitenkaas.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Groene linzen', 200, 'gr', 3, 1.00),
    ('Tomaten', 150, 'gr', 3, 1.00),
    ('Komkommer', 100, 'gr', 3, 0.50),
    ('Rode ui', 50, 'gr', 3, 0.30),
    ('Verse peterselie', 10, 'gr', 3, 0.20),
    ('Geitenkaas', 50, 'gr', 3, 1.50),
    ('Olijfolie', 20, 'ml', 3, 0.40),
    ('Citroensap', 10, 'ml', 3, 0.10);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('7 g', '320 mg', '4 g', '6 g', '10 g', '40 g', '18 g', 12);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Gegrilde Zalm met Asperges',
           'pescotarisch',
           '00:20:00',
           'avondmaal',
           '/img/gegrildezalmasperges.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Zalmfilets', 200, 'gr', 4, 4.00),
    ('Asperges', 200, 'gr', 4, 2.00),
    ('Olijfolie', 10, 'ml', 4, 0.15),
    ('Citroen', 0.5, 'stuks', 4, 0.30);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('3 g', '75 mg', '2 g', '3 g', '10 g', '5 g', '23 g', 13);



INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Veganistische Burger',
           'vegan',
           '00:15:00',
           'avondmaal',
           '/img/veganburger.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Zwarte bonen', 150, 'gr', 5, 1.00),
    ('Quinoa', 100, 'gr', 5, 0.90),
    ('Specerijen', 5, 'gr', 5, 0.30),
    ('Volkoren broodje', 1, 'stuks', 5, 1.00),
    ('Sla', 30, 'gr', 5, 0.30),
    ('Tomaat', 50, 'gr', 5, 0.50),
    ('Veganistische mayonaise', 20, 'ml', 5, 0.40);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('6 g', '460 mg', '5 g', '1 g', '8 g', '35 g', '10 g', 14);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Zoete Aardappel Curry',
           'vegan',
           '00:35:00',
           'avondmaal',
           '/img/zoete_aardappel_curry.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Zoete aardappel', 300, 'gr', 6, 1.50),
    ('Currypasta', 30, 'gr', 6, 0.75),
    ('Kokosmelk', 200, 'ml', 6, 1.50),
    ('Kikkererwten', 150, 'gr', 6, 1.00),
    ('Spinazie', 100, 'gr', 6, 1.00),
    ('Basmatirijst', 150, 'gr', 6, 0.90),
    ('Koriander', 10, 'gr', 6, 0.25);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('5 g', '380 mg', '6 g', '5 g', '10 g', '50 g', '12 g', 15);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Ontbijt Burrito',
           'vegetarisch',
           '00:15:00',
           'ontbijt',
           '/img/ontbijt_burrito.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Eieren', 2, 'stuks', 7, 0.50),
    ('Zwarte bonen', 50, 'gr', 7, 0.40),
    ('Kaas', 30, 'gr', 7, 0.60),
    ('Paprika', 50, 'gr', 7, 0.50),
    ('Volkoren tortilla', 1, 'stuks', 7, 1.00);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('6 g', '550 mg', '2 g', '6 g', '15 g', '45 g', '22 g', 16);




INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Quinoa Salade met Avocado',
           'vegan',
           '00:20:00',
           'middagmaal',
           '/img/quinoa_salade_avocado.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Quinoa', 150, 'gr', 8, 1.50),
    ('Avocado', 1, 'stuks', 8, 1.20),
    ('Komkommer', 100, 'gr', 8, 0.50),
    ('Tomaat', 100, 'gr', 8, 0.80),
    ('Rode ui', 50, 'gr', 8, 0.30),
    ('Verse koriander', 10, 'gr', 8, 0.25),
    ('Limoen', 1, 'stuks', 8, 0.30),
    ('Olijfolie', 20, 'ml', 8, 0.40);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('7 g', '100 mg', '3 g', '2 g', '12 g', '45 g', '8 g', 17);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Mediterrane Pasta',
           'vegetarisch',
           '00:25:00',
           'avondmaal',
           '/img/mediterrane_pasta.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Volkorenpasta', 200, 'gr', 9, 1.00),
    ('Olijven', 50, 'gr', 9, 0.75),
    ('Zongedroogde tomaten', 50, 'gr', 9, 1.25),
    ('Artisjokharten', 100, 'gr', 9, 1.50),
    ('Feta', 50, 'gr', 9, 1.00),
    ('Olijfolie', 20, 'ml', 9, 0.40),
    ('Knoflook', 2, 'tenen', 9, 0.50),
    ('Basilicum', 5, 'gr', 9, 0.20);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('2 g', '80 mg', '20 g', '4 g', '5 g', '200 g', '30 g', 18);



INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Garnalencocktail',
           'pescotarisch',
           '00:10:00',
           'snacks',
           '/img/garnalencocktail.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Gekookte garnalen', 150, 'gr', 10, 3.00),
    ('Cocktailsaus', 50, 'ml', 10, 0.75),
    ('Sla', 50, 'gr', 10, 0.30),
    ('Citroen', 0.5, 'stuks', 10, 0.30);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('1 g', '850 mg', '4 g', '0 g', '2 g', '6 g', '20 g', 19);


INSERT INTO DISH (NAME, DIET_PREFERENCES, PREPARATION_TIME, OCCASION, IMG_FILE_NAME)
VALUES (
           'Fruitsalade met Munt',
           'vegan',
           '00:10:00',
           'dessert',
           '/img/fruitsalade_munt.jpg'
       );

INSERT INTO INGREDIENT (NAME, QUANTITY, UNIT, DISH_ID, ESTIMATED_PRICE)
VALUES
    ('Meloen', 200, 'gr', 11, 1.00),
    ('Bessen', 100, 'gr', 11, 2.00),
    ('Druiven', 100, 'gr', 11, 1.00),
    ('Munt', 10, 'gr', 11, 0.40),
    ('Honing of agavesiroop', 20, 'ml', 11, 0.50);

INSERT INTO NUTRITION (FIBER, SALT, SUGAR, SATURATED_FAT, FAT, CARBS, PROTEINS, DISH_ID)
VALUES ('4 g', '10 mg', '24 g', '0 g', '1 g', '55 g', '2 g', 20);


-- INSERT INTO DISH_NUTRITIONS(DISH_ID,NUTRITIONS_ID)
-- VALUES
--     (1,1),
--     (2,2),
--     (3,3),
--     (4,4),
--     (5,5),
--     (6,6),
--     (7,7),
--     (8,8),
--     (9,9);




INSERT INTO USERS (USERNAME, PASSWORD, ENABLED)
VALUES ('admin', '$2a$10$9MIX8kYPkuB7uE/H5nHF8.KG6.YdjBA/voOnjSZnZDxLXL/2BIerS', true);
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY)
VALUES ('admin', 'ADMIN');
INSERT INTO USERS (USERNAME, PASSWORD, ENABLED)
VALUES ('stefferke', '$2a$10$a3/jTRNSkn0Rt/vENxt8.u2pxbJtWV8f1li3QmrIGt/C5RQ2R1wpG', true);
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY)
VALUES ('stefferke', 'USER');
INSERT INTO "PUBLIC"."CHEF" (USERNAME, NAME, SURNAME, EMAIL) VALUES
('stefferke', 'stefferke', 'coulson', 'stefferke@stefferke.com');
INSERT INTO "PUBLIC"."CHEF" (USERNAME, NAME, SURNAME, EMAIL) VALUES
('admin', 'admin', '', 'admin@appetito.com');



INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Coca Cola', '/img/Cola.jpg', 'Carbonated, Caffeinated, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Sprite', '/img/Sprite.jpg', 'Carbonated, Caffeinated, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Ice-Tea', '/img/Lipton_Ice_Tea.jpg', 'Carbonated, Caffeinated, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Cappuccino', '/img/Cappucciono.jpg', 'Caffeinated, Coffee, Hot');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Latte', '/img/Latte.webp', 'Caffeinated, Coffee, Hot');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Macchiato', '/img/Macchiato.jpg', 'Caffeinated, Coffee, Hot');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Duvel', '/img/Duvel_666.jpg', 'Alcohol, Beer, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Jupiler', '/img/Jupiler.jpg', 'Alcohol, Beer, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('La Chouffe', '/img/La_Chouffe.jpg', 'Alcohol, Beer, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Leffe', '/img/Leffe.jpg', 'Alcohol, Beer, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Chardonnay', '/img/Chardonnay.webp', 'Alcohol, White Wine, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Bordeaux', '/img/Bordeaux.jpg', 'Alcohol, Red Wine, Cold');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('Twinings English Breakfast', '/img/Twinings_English_Breakfast.webp', 'Tea, Hot');
INSERT INTO BEVERAGE (NAME, IMG_FILE, TYPE_OF_BEVERAGE)
VALUES ('PG tips', '/img/PG_Tips.webp', 'Tea, Hot');

INSERT INTO DISH_BEVERAGES (DISHES_ID, BEVERAGES_ID)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,8),
    (1,11),
    (2,1),
    (2,2),
    (2,3),
    (2,11),
    (3,1),
    (3,2),
    (3,3),
    (3,13),
    (3,14),
    (4,4),
    (4,5),
    (4,6),
    (4,13),
    (4,14),
    (5,1),
    (5,2),
    (5,3),
    (5,8),
    (6,13),
    (6,14),
    (7,4),
    (7,5),
    (7,11),
    (8,3),
    (8,7),
    (8,13),
    (9,13),
    (9,14),
    (10, 1),
    (10, 12),
    (11, 4),
    (11,5),
    (11,11),
    (12, 2),
    (12, 8),
    (12, 14),
    (13, 3),
    (13, 7),
    (13, 13),
    (13, 6),
    (14, 7),
    (14,3),
    (15, 9),
    (15, 11),
    (16, 6),
    (16, 10),
    (16, 1),
    (17, 1),
    (17, 14),
    (18, 13),
    (18,2),
    (18,5),
    (19, 3),
    (19, 12),
    (20, 9),
    (20,11),
    (20,2),
    (20,8);









INSERT INTO GROCERY (CHEF_ID) VALUES
    (2),
(1);

INSERT INTO GROCERY_INGREDIENTS (GROCERY_ID, INGREDIENTS_ID) VALUES
                                                                   (1,1);


INSERT INTO Step (description, image, dish_id)
VALUES ('Begin met het koken van de fettuccine volgens de aanwijzingen op de verpakking. Vergeet niet een kopje van het kookvocht te bewaren voordat je de pasta afgiet.', '/img/pasta_alfredo_stap1.jpg', 1),
       ('Terwijl de pasta kookt, kruid je de kipstukjes naar smaak en bak je ze in een aparte pan tot ze volledig gaar en goudbruin zijn. Zet de kip even opzij.', '/img/pasta_alfredo_stap2.jpg', 1),
       ('Smelt de roomboter in een diepe pan op middelhoog vuur. Voeg het fijngehakte teentje knoflook toe en laat het een minuutje zachtjes bakken, zodat de smaken goed vrijkomen.', '/img/pasta_alfredo_stap3.jpg', 1),
       ('Voeg de gekookte fettuccine toe aan de pan met gesmolten boter en knoflook. Giet er een goed scheutje van het bewaarde kookvocht bij om de saus smeuïg te maken.', '/img/pasta_alfredo_stap4.jpg', 1),
       ('Strooi de geraspte Parmezaanse kaas over de pasta en roer alles goed door elkaar totdat de kaas volledig is gesmolten en een romige saus vormt.', '/img/pasta_alfredo_stap5.jpg', 1),
         ('Voeg nu de gebakken kipstukjes toe aan de pan en meng alles goed door elkaar. Breng op smaak met zwarte peper.', '/img/pasta_alfredo_stap6.jpg', 1),
         ('Serveer de pasta alfredo op borden en garneer met de gehakte peterselie voor een frisse touch.', '/img/pasta_alfredo.jpg', 1);

INSERT INTO Step (description, dish_id)
VALUES ('Kook de pasta volgens verpakking beetgaar. Snipper ondertussen de ui en de teentjes knoflook fijn. Bak deze glazig in een grote hapjes of wokpan in een eetlepel olie.', 2),
       ('Voeg de zalm toe en bak rondom aan, steek met een spatel in stukken. Voeg dan in etappes de spinazie toe totdat deze wat geslonken is. Schenk de kookroom erbij en breng op maak met flink wat peper en zout.', 2),
       ('Halveer de tomaatjes en meng deze met de zalm en spinazie. Verwarm een paar minuten door en voeg dan de tagliatelle toe. Mix alles door elkaar en schep op borden. Bestrooi met geroosterde pijnboompitten.', 2);

INSERT INTO Step (description, dish_id)
VALUES ('Snijd de ui fijn en bak in een pan met boter glazig.', 3),
       ('Snijd de aardappel in blokjes. Voeg de aardappel en ontdooide spinazie toe aan de ui.', 3),
       ('Giet het water erbij, breng aan de kook en verkruimel de bouillonblokjes boven de pan. Laat alles 10 min zachtjes doorkoken.', 3),
       ('Pureer de soep met een staafmixer tot een gladde groene massa.', 3),
       ('Roer de room erdoor.', 3),
       ('Serveer de soep in borden of kommen en garneer eventueel met wat extra room, pijnboompitten en waterkers.', 3);

INSERT INTO Step (description, dish_id)
VALUES ('Verwarm de oven voor op 200° graden.', 4),
       ('Bak de spinazie in een grote pan tot deze geslonken is. Je kunt ook eventueel spinazie uit de diepvries ontdooien.', 4),
       ('Laat de spinazie goed uitlekken en druk met de bolle kant van een lepel zo veel mogelijk vocht eruit.', 4),
       ('Breng de spinazie op smaak met een flinke snuf peper.', 4),
       ('Rol het bladerdeeg uit.', 4),
       ('Verdeel de spinazie over het bladerdeeg en kruimel hier de feta in kleine stukjes over.', 4),
       ('Bestrooi met wat pijnboompitten.', 4),
       ('Rol het bladerdeeg voorzichtig op.', 4),
       ('Snijd met een scherp mes de rol in plakjes. Is dit lastig? Dan kun je de rol een half uurtje in de koelkast leggen zodat hij wat opstijft.', 4),
       ('Leg de plakjes op een bakplaat met bakpapier en bestrijk met een los geklopt ei.', 4),
       ('Bak de rolletjes 15 tot 20 minuten in de oven totdat ze goudbruin zijn.', 4);

INSERT INTO Step (description, dish_id)
VALUES ('Verwarm de oven voor op 225° graden.', 5),
       ('Meng het meel, olijfolie, zout, bakpoeder en water. Kneed dit tot dat er een mooie bal ontstaat. Als het te droog is kun je een klein beetje extra water toevoegen.', 5),
       ('Verdeel wat glutenvrij meel over het aanrecht of gebruik bakpapier en rol het deeg uit tot een platte cirkel.', 5),
       ('Verdeel de tomatensaus met een lepel over de pizza.', 5),
       ('Snijd de paprika en zongedroogde tomaten en leg deze vervolgens op de tomatensaus.', 5),
       ('Strooi de Italiaanse kruiden, geraspte kaas en een snuf peper en zout hier overheen.', 5),
       ('Bak de pizza voor 15 minuten op 225° graden.', 5);

INSERT INTO Step (description, dish_id)
VALUES ('Verwarm het sinaasappelsap met de basterdsuiker in een pannetje.', 6),
       ('Voeg de balsamico azijn en een snuf kaneel toe.', 6),
       ('Voeg dan de cranberries toe en breng zachtjes aan de kook.', 6),
       ('Roer af en toe door en wacht tot de cranberries zacht worden en uit elkaar vallen, waardoor er een saus ontstaat. Dit duurt ongeveer 15 minuten.', 6);

INSERT INTO Step (description, dish_id)
VALUES ('Als de dadels hard zijn, laat je ze even weken in een schaal met water. Als ze goed zacht zijn, is dit niet nodig.', 7),
       ('Doe de pinda’s in een keukenmachine en maal ze tot kleinere stukjes. Haal ze er daarna weer uit.', 7),
       ('Doe vervolgens de dadels in de keukenmachine en maal ze fijn.', 7),
       ('Voeg de gemalen pinda’s, pindakaas, maple syrup, cacao poeder en snuf zout toe aan de dadels in de keukenmachine.', 7),
       ('Meng alles goed totdat het een samenhangend mengsel vormt.', 7),
       ('Maak met je handen balletjes van het mengsel.', 7),
       ('Bewaar de balletjes het beste in de koelkast.', 7);

INSERT INTO Step (description, dish_id)
VALUES ('Begin met het koken van de fettuccine volgens de aanwijzingen op de verpakking. Vergeet niet een kopje van het kookvocht te bewaren voordat je de pasta afgiet.', 8),
       ('Terwijl de pasta kookt, kruid je de kipstukjes naar smaak en bak je ze in een aparte pan tot ze volledig gaar en goudbruin zijn. Zet de kip even opzij.', 8),
       ('Smelt de roomboter in een diepe pan op middelhoog vuur. Voeg het fijngehakte teentje knoflook toe en laat het een minuutje zachtjes bakken, zodat de smaken goed vrijkomen.', 8),
       ('Voeg de gekookte fettuccine toe aan de pan met gesmolten boter en knoflook. Giet er een goed scheutje van het bewaarde kookvocht bij om de saus smeuïg te maken.', 8),
       ('Strooi de geraspte Parmezaanse kaas over de pasta en roer alles goed door elkaar totdat de kaas volledig is gesmolten en een romige saus vormt.', 8),
       ('Voeg nu de gebakken kipstukjes toe aan de pan en meng alles goed door elkaar. Breng op smaak met zwarte peper.', 8),
       ('Serveer de pasta alfredo op borden en garneer met de gehakte peterselie voor een frisse touch.', 8);

INSERT INTO Step (description, dish_id)
VALUES ('Begin met het koken van de fettuccine volgens de aanwijzingen op de verpakking. Vergeet niet een kopje van het kookvocht te bewaren voordat je de pasta afgiet.', 9),
       ('Terwijl de pasta kookt, kruid je de kipstukjes naar smaak en bak je ze in een aparte pan tot ze volledig gaar en goudbruin zijn. Zet de kip even opzij.', 9),
       ('Smelt de roomboter in een diepe pan op middelhoog vuur. Voeg het fijngehakte teentje knoflook toe en laat het een minuutje zachtjes bakken, zodat de smaken goed vrijkomen.', 9),
       ('Voeg de gekookte fettuccine toe aan de pan met gesmolten boter en knoflook. Giet er een goed scheutje van het bewaarde kookvocht bij om de saus smeuïg te maken.', 9),
       ('Strooi de geraspte Parmezaanse kaas over de pasta en roer alles goed door elkaar totdat de kaas volledig is gesmolten en een romige saus vormt.', 9),
       ('Voeg nu de gebakken kipstukjes toe aan de pan en meng alles goed door elkaar. Breng op smaak met zwarte peper.', 9),
       ('Serveer de pasta alfredo op borden en garneer met de gehakte peterselie voor een frisse touch.', 9);

INSERT INTO Step (description, dish_id)
VALUES ('Snijn een pompoen in blokjes en kook deze in een pan met water tot ze zacht zijn.', 10),
       ('Giet de pompoenblokjes af en pureer ze met een staafmixer tot een gladde puree.', 10),
       ('Voeg de pompoenpuree toe aan een pan en voeg de groentebouillon toe.', 10),
       ('Voeg de kokosmelk, nootmuskaat, peper en zout toe en laat de soep 10 minuten zachtjes koken.', 10),
       ('Serveer de soep in kommen en garneer met een scheutje kokosmelk en een snufje nootmuskaat.', 10);

INSERT INTO Step (description, dish_id)
VALUES ('Grill kipfilet en snijd in plakjes.', 11),
       ('Meng Romeinse sla met Caesar dressing en voeg de kip toe.', 11),
       ('Bestrooi met Parmezaanse kaas en voeg glutenvrije croutons toe.', 11);

INSERT INTO Step (description, dish_id)
VALUES ('Kook groene linzen gaar.', 12),
       ('Meng met gehakte tomaten, komkommer, rode ui, en verse peterselie.', 12),
       ('Voeg geitenkaas en een dressing van olijfolie en citroensap toe.', 12);

INSERT INTO Step (description, dish_id)
VALUES ('Kruid zalmfilets en gril tot ze gaar zijn.', 13),
       ('Gril asperges in olijfolie tot ze knapperig zijn.', 13),
       ('Serveer de zalm met een schijfje citroen en de asperges.', 13);

INSERT INTO Step (description, dish_id)
VALUES ('Maak een burger van zwarte bonen, quinoa en specerijen.', 14),
       ('Bak de burger in een pan tot beide kanten goudbruin zijn.', 14),
       ('Serveer op een volkoren broodje met sla, tomaat, en veganistische mayonaise.', 14);

INSERT INTO Step (description, dish_id)
VALUES ('Kook zoete aardappelblokjes in een pan met currypasta en kokosmelk.', 15),
       ('Voeg kikkererwten en spinazie toe en laat sudderen.', 15),
       ('Serveer met basmatirijst en garneer met koriander.', 15);

INSERT INTO Step (description, dish_id)
VALUES ('Bak roerei en meng met zwarte bonen, kaas, en gehakte paprika.', 16),
       ('Vul een volkoren tortilla met het ei-mengsel.', 16),
       ('Rol de tortilla op en bak kort in een hete pan.', 16);

INSERT INTO Step (description, dish_id)
VALUES ('Kook quinoa en laat afkoelen.', 17),
       ('Meng met blokjes avocado, komkommer, tomaat, en rode ui.', 17),
       ('Voeg een limoen-olijfolie dressing toe en garneer met verse koriander.', 17);

INSERT INTO Step (description, dish_id)
VALUES ('Kook volkorenpasta al dente.', 18),
       ('Meng met olijven, zongedroogde tomaten, artisjokharten, en feta.', 18),
       ('Voeg een dressing van olijfolie, knoflook, en basilicum toe.', 18);

INSERT INTO Step (description, dish_id)
VALUES ('Meng gekookte garnalen met een zelfgemaakte cocktailsaus.', 19),
       ('Serveer in een cocktailglas met gehakte slabladeren en een schijfje citroen.', 19);

INSERT INTO Step (description, dish_id)
VALUES ('Snijd diverse soorten fruit zoals meloen, bessen, en druiven.', 20),
       ('Meng het fruit met fijngesneden munt en een beetje honing of agavesiroop.', 20),
       ('Koel voor het serveren om de smaken te laten mengen.', 20);

