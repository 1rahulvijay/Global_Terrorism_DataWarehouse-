INSERT INTO [dbo].[dim_attack] (
	[attacktype1]
	,[AttackType]
	)
SELECT DISTINCT [attacktype1]
	,[AttackType]
FROM [dbo].[staging]

EXCEPT

SELECT [attacktype1]
	,[AttackType]
FROM [dbo].[dim_attack];

--- country
INSERT INTO [dbo].[dim_country] (
	[country_code]
	,[Country]
	,[region]
	,[state]
	,[city]
	)
SELECT DISTINCT coalesce([country_code], 0)
	,coalesce([Country], 'Unknown')
	,coalesce([region], 'Unknown')
	,coalesce([state], 'Unknown')
	,coalesce([city], 'Unknown')
FROM staging

EXCEPT

SELECT [country_code]
	,[Country]
	,[region]
	,[state]
	,[city]
FROM [dbo].[dim_country]

----- time col---
INSERT INTO [dbo].[dim_time] (
	[year]
	,[month]
	,[day]
	)
SELECT DISTINCT coalesce([year], 1970)
	,coalesce([month], 1)
	,coalesce([day], 1)
FROM [dbo].[staging]

EXCEPT

SELECT [year]
	,[month]
	,[day]
FROM [dbo].[dim_time]

---- Target 
INSERT INTO [dbo].[dim_Target] (
	[target_category_id]
	,[Target_category]
	,[Target]
	)
SELECT DISTINCT coalesce([target_category_id], 1)
	,coalesce([Target_category], 'Unknown')
	,coalesce([Target], 'Unknown')
FROM [dbo].[staging]

EXCEPT

SELECT [target_category_id]
	,[Target_category]
	,[Target]
FROM [dbo].[dim_Target]

------- Weapon Bitches
INSERT INTO [dbo].[dim_weapon] (
	[weaptype_category_id]
	,[Weapon]
	)
SELECT DISTINCT [weaptype_category_id]
	,[Weapon]
FROM [dbo].[staging]

EXCEPT

SELECT [weaptype_category_id]
	,[Weapon]
FROM [dbo].[dim_weapon]
