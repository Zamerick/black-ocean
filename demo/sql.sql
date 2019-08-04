USE AdventureWorks2012;
GO
IF OBJECT_ID ('dbo.ProductResults', 'U') IS NOT NULL
DROP TABLE dbo.ProductResults;
GO
IF OBJECT_ID ('dbo.Gloves', 'U') IS NOT NULL
DROP TABLE dbo.Gloves;
GO
--Create Gloves table.
SELECT ProductModelID, Name
INTO dbo.Gloves
FROM Production.ProductModel
WHERE ProductModelID IN (3, 4);
GO

USE AdventureWorks2012;
GO
SELECT ProductModelID, Name
INTO dbo.ProductResults
FROM Production.ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT ProductModelID, Name
FROM dbo.Gloves;
GO

SELECT ProductModelID, Name
FROM dbo.ProductResults;

/* Replace procedure name and parameter with your own */
CREATE PROCEDURE spAlbumsFromArtist
    @ArtistName varchar(255)
AS
/* Replace everything below with your own code */
    SELECT AlbumName, ReleaseDate
    FROM Albums
        INNER JOIN Artists
        ON Albums.ArtistId = Artists.ArtistId
    WHERE Artists.ArtistName = @ArtistName;
