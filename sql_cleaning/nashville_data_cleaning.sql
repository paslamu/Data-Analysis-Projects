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

-- Splitting OwnerAddress with the delimiter function "SPLIT_PART" and creating a new column
SELECT
SPLIT_PART("OwnerAddress", ',', 1),
SPLIT_PART("OwnerAddress", ',', 2),
SPLIT_PART("OwnerAddress", ',', 3)
FROM
nashville_housing
WHERE
nashville_housing is not null

ALTER TABLE nashville_housing
ADD "OwnerFullAddress" varchar(255);

UPDATE nashville_housing
SET "OwnerFullAddress" = SPLIT_PART("OwnerAddress", ',', 1)

ALTER TABLE nashville_housing
ADD "OwnerCity" varchar(255);

UPDATE nashville_housing
SET "OwnerCity" = SPLIT_PART("OwnerAddress", ',', 2)

ALTER TABLE nashville_housing
ADD "OwnerState" varchar(255);

UPDATE nashville_housing
SET "OwnerState" = SPLIT_PART("OwnerAddress", ',', 3

-- Changing, combining and updating "Sold as vacant" column from 'Y' and 'N' to "Yes" and "No".
SELECT
DISTINCT("SoldAsVacant"), COUNT(*)
FROM 
nashville_housing
GROUP BY "SoldAsVacant"
ORDER BY 2

SELECT
   "SoldAsVacant",
CASE   
    WHEN "SoldAsVacant" = 'NO' THEN 'No'
    ELSE "SoldAsVacant"
	END
FROM
  nashville_housing
     
UPDATE nashville_housing
SET "SoldAsVacant" = CASE   
    WHEN "SoldAsVacant" = 'NO' THEN 'No'
    ELSE "SoldAsVacant"
	END

--Remove duplicates (window functions) AND TEMP TABLE

WITH RowNumCTE AS(
SELECT 
  *, 
ROW_NUMBER() OVER(
PARTITION BY
	"ParcelID", 
	"SalePrice", 
	"LegalReference"
ORDER BY 
	"UniqueID"
     ) row_num 
FROM
  nashville_housing
ORDER BY 
  "ParcelID"
)
SELECT
*
FROM
RowNumCTE
WHERE row_num > 1
