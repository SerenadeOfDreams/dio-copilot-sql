CREATE TABLE dbo.tbl_Collections
(
    CollectionID           int IDENTITY(1,1) PRIMARY KEY,
    CollectionSetName      nvarchar(200) NOT NULL,
    ReleaseDate            date NULL,
    TotalCardsInCollection smallint NULL
);

CREATE TABLE dbo.tbl_Cards
(
    CardID                 int IDENTITY(1,1) PRIMARY KEY,
    CollectionID           int NOT NULL FOREIGN KEY REFERENCES dbo.tbl_Collections(CollectionID),
    HP                     smallint NULL,
    CardName               nvarchar(200) NOT NULL,
    Type                   nvarchar(100) NULL,
    Stage                  nvarchar(20) NULL,
    Info                   nvarchar(max) NULL,
    Attack                 nvarchar(400) NULL,
    Damage                 smallint NULL,
    Weakness               nvarchar(100) NULL,
    Resistance             nvarchar(100) NULL,
    RetreatCost            tinyint NULL,
    CardNumberInCollection nvarchar(20) NOT NULL
);