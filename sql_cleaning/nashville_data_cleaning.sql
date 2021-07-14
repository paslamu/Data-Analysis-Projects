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
SET "PropertyAddress"= COALESCE(a."PropertyAddress", b."PropertyAddress")
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
  

