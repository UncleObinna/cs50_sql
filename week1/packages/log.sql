
-- *** The Lost Letter ***
-- to find the sender's address id
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';

-- to find the receiver's address id
SELECT * FROM "addresses" WHERE "address" LIKE '2 Fin%';

-- to find the congratulatory package id that was sent by the sender and the address id where it was sent to
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue') AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%'
);

-- to find where it was sent to and what happened to it
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue') AND
        "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%')
    );


-- *** The Devious Delivery ***
-- for content of the package
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;

-- what happened to the package
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
);

-- Find the type of address where packaged was dropped
SELECT * FROM "addresses" WHERE "id" = (
SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
) AND "action" = 'Drop'
);


-- *** The Forgotten Gift ***
-- the details of the sender's address
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';

-- the content of the forgotten gift
SELECT "contents" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street');

-- who has the forgotten gift
SELECT "driver_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" =
    (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')) ORDER BY "timestamp" DESC LIMIT 1;

-- name of driver with forgotten gift
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" =
    (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')) ORDER BY "timestamp" DESC LIMIT 1
);
