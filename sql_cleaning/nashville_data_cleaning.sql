-- Changing the date from "string" data type to "date" data type and updating the column
SELECT
 CAST("SaleDate" AS DATE)
FROM
 nashville_housing

UPDATE 
  nashville_housing
SET "SaleDate" = CAST("SaleDate" AS DATE)

--Updating the null propertyaddress with the correct address
SELECT
 a."ParcelID", a."PropertyAddress", b."ParcelID", b."PropertyAddress", COALESCE(a."PropertyAddress", b."PropertyAddress")
 FROM
  nashville_housing a
 JOIN
  nashville_housing b
 ON
  a."ParcelID"= b."ParcelID"
 AND
  a."UniqueID"<> b."UniqueID"
 WHERE 
  a."PropertyAddress" is NULL
  
UPDATE nashville_housing
SET 
  "PropertyAddress"= COALESCE(a."PropertyAddress", b."PropertyAddress")
FROM
  nashville_housing as a
JOIN
  nashville_housing as b
ON
 a."ParcelID"= b."ParcelID"
AND
 a."UniqueID"<> b."UniqueID"
 WHERE 
  a."PropertyAddress" is NULL
  

-- Splitting the PropertyAddress with the city 
SELECT
SUBSTRING("PropertyAddress", 1, POSITION(',' IN "PropertyAddress")-1) AS address,
SUBSTRING("PropertyAddress", POSITION(',' IN "PropertyAddress")+1 , LENGTH("PropertyAddress"))as Address_1
FROM
nashville_housing

ALTER TABLE nashville_housing
ADD "PropertyFullAddress" varchar(255);

UPDATE nashville_housing
SET "PropertyFullAddress" = SUBSTRING("PropertyAddress", 1, POSITION(',' IN "PropertyAddress")-1) 

ALTER TABLE nashville_housing
ADD "PropertyCity" varchar(255);

UPDATE nashville_housing
SET "PropertyCity" = SUBSTRING("PropertyAddress", POSITION(',' IN "PropertyAddress")+1 , LENGTH("PropertyAddress"))



