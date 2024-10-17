-- Script that lists all bands with Glam rock as their main style
SELECT band_name
FROM metal_bands
WHERE main_style = 'Glam rock';

WITH band_lifespan AS(
	SELECT band_name,
		CAST(SUBSTRING_INDEX(formed, '-', -1) AS INT) AS formed_year,
		CAST(SUBSTRING_INDEX(split, '-', -1) AS INT) AS split_year
	FROM metal_bands
)
SELECT band_name,
	(CASE WHEN split_year IS NULL THEN 2022 - formed_year ELSE 2022 - split_year END) AS longevity
FROM band_lifespan
WHERE main_style = 'Glam rock'
ORDER BY longevity DESC;
