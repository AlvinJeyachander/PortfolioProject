Select * From Nas_Ho_Data_CL;
--Populate property address data
Select * 
From Nas_Ho_Data_CL
WHERE PropertyAddress IS NULL;

Select  a.UniqueID,a.ParcelID,a.PropertyAddress,b.UniqueID, b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
From Nas_Ho_Data_CL a
JOIN Nas_Ho_Data_CL b
on a.ParcelID=b.ParcelID
AND a.UniqueID!=b.UniqueID
WHERE a.PropertyAddress IS NULL;
---
UPDATE a
SET a.PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From Nas_Ho_Data_CL a
JOIN Nas_Ho_Data_CL b
on a.ParcelID=b.ParcelID
AND a.UniqueID!=b.UniqueID
WHERE a.PropertyAddress IS NULL;
----
Select PropertyAddress
From Nas_Ho_Data_CL