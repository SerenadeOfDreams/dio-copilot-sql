SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRAN;

------------------------------------------------------------
-- Seed: Collections (classic + modern anchor sets)
------------------------------------------------------------

DECLARE 
  @BaseSetID              INT,
  @JungleID               INT,
  @FossilID               INT,
  @TeamRocketID           INT,
  @NeoGenesisID           INT,
  @SunMoonBaseID          INT,
  @SwordShieldBaseID      INT,
  @ScarletVioletBaseID    INT;

-- Base Set (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Base Set', '1999-01-09', 102);
SET @BaseSetID = SCOPE_IDENTITY();

-- Jungle (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Jungle', '1999-06-16', 64);
SET @JungleID = SCOPE_IDENTITY();

-- Fossil (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Fossil', '1999-10-10', 62);
SET @FossilID = SCOPE_IDENTITY();

-- Team Rocket (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Team Rocket', '2000-04-24', 83);
SET @TeamRocketID = SCOPE_IDENTITY();

-- Neo Genesis (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Neo Genesis', '2000-12-16', 111);
SET @NeoGenesisID = SCOPE_IDENTITY();

-- Sun & Moon Base (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Sun & Moon — Base Set', '2017-02-03', 163);
SET @SunMoonBaseID = SCOPE_IDENTITY();

-- Sword & Shield Base (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Sword & Shield — Base Set', '2020-02-07', 202);
SET @SwordShieldBaseID = SCOPE_IDENTITY();

-- Scarlet & Violet Base (ENG)
INSERT INTO dbo.tbl_Collections (CollectionSetName, ReleaseDate, TotalCardsInCollection)
VALUES (N'Scarlet & Violet — Base Set', '2023-03-31', 258);
SET @ScarletVioletBaseID = SCOPE_IDENTITY();

------------------------------------------------------------
-- Seed: Cards (sample selection across sets)
-- Notes:
--   - CardNumberInCollection follows printed numbering (strings).
--   - Damage is numeric when reasonable; some moves have variable damage (set NULL and keep in Attack text).
--   - RetreatCost is in “Energy” count.
--   - Weakness/Resistance are free-text for simplicity.
------------------------------------------------------------

-----------------------
-- Base Set
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@BaseSetID,  40, N'Bulbasaur', N'Grass', N'Basic',
 N'Seed Pokémon. Length: 2''4", Weight: 15 lbs.',
 N'Leech Seed — (G) If this attack does damage to the Defending Pokémon (after applying Weakness and Resistance), remove 1 damage counter from Bulbasaur if it has any.', 
 20, N'Fire x2', N'', 1, N'44/102'),

(@BaseSetID,  60, N'Ivysaur', N'Grass', N'Stage 1',
 N'Evolves from Bulbasaur.',
 N'Vine Whip — (GG) 30; Poison Powder — (GGG) The Defending Pokémon is now Poisoned.', 
 30, N'Fire x2', N'', 2, N'30/102'),

(@BaseSetID,  80, N'Charizard', N'Fire', N'Stage 2',
 N'Evolves from Charmeleon. Pokémon Power: Energy Burn.',
 N'Fire Spin — (RRRR) Discard 2 Energy from Charizard or this attack does nothing. 100 damage.', 
 100, N'Water x2', N'Fighting -30', 3, N'4/102'),

(@BaseSetID,  60, N'Blastoise', N'Water', N'Stage 2',
 N'Evolves from Wartortle. Pokémon Power: Rain Dance.',
 N'Hydro Pump — (WWW+) 40+ (extra 10 for each extra Water Energy attached).', 
 NULL, N'Lightning x2', N'', 3, N'2/102'),

(@BaseSetID,  40, N'Pikachu', N'Lightning', N'Basic',
 N'Mouse Pokémon.',
 N'Thunder Jolt — (LL) Flip a coin. If tails, Pikachu does 10 damage to itself.', 
 30, N'Fighting x2', N'Metal -30', 1, N'58/102');

-----------------------
-- Jungle
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@JungleID,  90, N'Snorlax', N'Colorless', N'Basic',
 N'Pokémon Power: Thick Skinned.',
 N'Body Slam — (CCCC) Flip a coin. If heads, the Defending Pokémon is now Paralyzed.', 
 30, N'Fighting x2', N'Psychic -30', 4, N'11/64'),

(@JungleID,  70, N'Wigglytuff', N'Colorless', N'Stage 1',
 N'Evolves from Jigglypuff.',
 N'Do the Wave — (CC) 10 damage plus 10 more damage for each of your Benched Pokémon.', 
 NULL, N'Fighting x2', N'Psychic -30', 2, N'19/64'),

(@JungleID,  70, N'Jolteon', N'Lightning', N'Stage 1',
 N'Evolves from Eevee.',
 N'Pin Missile — (LLC) Flip 4 coins. This attack does 20 damage times the number of heads.', 
 NULL, N'Fighting x2', N'', 1, N'20/64');

-----------------------
-- Fossil
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@FossilID,  60, N'Aerodactyl', N'Fighting', N'Stage 1',
 N'Pokémon Power: Prehistoric Power.',
 N'Wing Attack — (CC) 30', 
 30, N'Lightning x2', N'Fighting -30', 2, N'1/62'),

(@FossilID,  80, N'Lapras', N'Water', N'Basic',
 N'Sea Pokémon.',
 N'Water Gun — (WW+): 10+; Confuse Ray — (WWC): Defending Pokémon is now Confused.', 
 NULL, N'Lightning x2', N'', 2, N'10/62');

-----------------------
-- Team Rocket
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@TeamRocketID,  70, N'Dark Charizard', N'Fire', N'Stage 2',
 N'Evolves from Dark Charmeleon.',
 N'Continuous Fireball — (RR) Flip a number of coins equal to the number of R Energy attached. 50x heads (discard for each).', 
 NULL, N'Water x2', N'', 3, N'4/82'),

(@TeamRocketID,  60, N'Dark Blastoise', N'Water', N'Stage 2',
 N'Evolves from Dark Wartortle.',
 N'Hydro Cannon — (WW+) 30+; Rocket Tackle — (WCC) 40 (self-damage on tails).', 
 NULL, N'Lightning x2', N'', 2, N'3/82'),

(@TeamRocketID,  60, N'Dark Dragonite', N'Colorless', N'Stage 2',
 N'Evolves from Dark Dragonair. Pokémon Power: Summon Minions.',
 N'Giant Tail — (CCC) 70 (flip tails does nothing).', 
 70, N'Colorless x2', N'Fighting -30', 2, N'5/82');

-----------------------
-- Neo Genesis
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@NeoGenesisID,  100, N'Feraligatr', N'Water', N'Stage 2',
 N'Pokémon Power: Downpour.',
 N'Riptide — (WWW) 10x number of Water Energy in discard pile (shuffle them into deck).', 
 NULL, N'Grass x2', N'', 3, N'5/111'),

(@NeoGenesisID,  90, N'Typhlosion', N'Fire', N'Stage 2',
 N'Pokémon Power: Fire Recharge.',
 N'Flame Burst — (RRC) 60', 
 60, N'Water x2', N'', 2, N'17/111'),

(@NeoGenesisID,  90, N'Meganium', N'Grass', N'Stage 2',
 N'Pokémon Power: Wild Growth.',
 N'Solarbeam — (GGGC) 60', 
 60, N'Fire x2', N'', 2, N'10/111');

-----------------------
-- Sun & Moon (Base)
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@SunMoonBaseID,  190, N'Solgaleo-GX', N'Metal', N'Stage 2',
 N'Ability: Ultra Road. GX attack: Sol Burst GX.',
 N'Sunsteel Strike — (MMC) 230 (discard all Energy from this Pokémon).', 
 230, N'Fire x2', N'Psychic -20', 3, N'89/149'),

(@SunMoonBaseID,  190, N'Lunala-GX', N'Psychic', N'Stage 2',
 N'Ability: Psychic Transfer. GX attack: Lunar Fall GX.',
 N'Moongeist Beam — (PPC) 120 (prevent healing).', 
 120, N'Darkness x2', N'Fighting -20', 2, N'66/149'),

(@SunMoonBaseID,  70, N'Rowlet', N'Grass', N'Basic',
 N'Grass Quill Pokémon.',
 N'Leafage — (G) 10; Tackle — (CC) 20', 
 20, N'Fire x2', N'', 1, N'9/149');

-----------------------
-- Sword & Shield (Base)
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@SwordShieldBaseID,  220, N'Zacian V', N'Metal', N'Basic',
 N'Ability: Intrepid Sword.',
 N'Brave Blade — (MMC) 230 (can’t attack next turn).', 
 230, N'Fire x2', N'Grass -30', 2, N'138/202'),

(@SwordShieldBaseID,  230, N'Zamazenta V', N'Metal', N'Basic',
 N'Ability: Dauntless Shield.',
 N'Assault Tackle — (MMC) 130 (discard a Special Energy).', 
 130, N'Fire x2', N'Grass -30', 2, N'139/202'),

(@SwordShieldBaseID,  190, N'Morpeko V', N'Lightning', N'Basic',
 N'Dual-type flavor card (Lightning).',
 N'Electro Wheel — (LLC) 150 (switch this Pokémon with 1 of your Benched Pokémon).', 
 150, N'Fighting x2', N'Metal -30', 1, N'79/202');

-----------------------
-- Scarlet & Violet (Base)
-----------------------
INSERT INTO dbo.tbl_Cards (
    CollectionID, HP, CardName, Type, Stage, Info, Attack, Damage,
    Weakness, Resistance, RetreatCost, CardNumberInCollection
) VALUES
(@ScarletVioletBaseID,  330, N'Gardevoir ex', N'Psychic', N'Stage 2',
 N'Ability: Psychic Embrace.',
 N'Miracle Force — (PP) 190 (heal this Pokémon).', 
 190, N'Metal x2', N'', 2, N'86/198'),

(@ScarletVioletBaseID,  230, N'Miraidon ex', N'Lightning', N'Basic',
 N'Ability: Tandem Unit.',
 N'Photon Blaster — (LLC) 220 (can’t attack next turn).', 
 220, N'Fighting x2', N'', 2, N'81/198'),

(@ScarletVioletBaseID,  230, N'Koraidon ex', N'Fighting', N'Basic',
 N'Ability: Dino Cry.',
 N'Wild Impact — (FFC) 220 (can’t attack next turn).', 
 220, N'Psychic x2', N'', 2, N'125/198');

COMMIT TRAN;