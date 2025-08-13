-- =============================================
-- Author:      <Joshua Barwell, DESKTOP-IEKNRR8\SQLEXPRESS | baseball>
-- Create Date: <2025-08-07>
-- Description: <Stored procedure to insert data into the PitchingStats table via JSON string>
-- =============================================
use [baseball];
GO

create or alter PROCEDURE sp_insertPitchingRecord
	@pitchingStatJSON nvarchar(MAX)
AS  
BEGIN
    SET NOCOUNT ON;


    INSERT INTO PitchingStats 
        ([Year], Team, Player, Age, Pos, WAR, W, L, [W-L%], ERA, G, GS, GF, CG, SHO, SV, IP, H, R, ER, HR, BB, IBB, SO, HBP, BK, WP, BF, [ERA+], FIP, WHIP, H9, HR9, BB9, SO9, [SO/BB])
    SELECT
        TRY_CAST([Year]  AS int),
        Team,
        Player,
        TRY_CAST(Age 	 AS int),
        Pos,
		TRY_CAST(WAR     AS float),
		TRY_CAST(W       AS int),
		TRY_CAST(L       AS int),
		TRY_CAST([W-L%]  AS decimal(4, 3)),
		TRY_CAST(ERA     AS float),
		TRY_CAST(G       AS int),
		TRY_CAST(GS      AS int),
		TRY_CAST(GF      AS int),
		TRY_CAST(CG      AS int),
		TRY_CAST(SHO     AS int),
		TRY_CAST(SV      AS int),
		TRY_CAST(IP      AS float),
		TRY_CAST(H       AS int),
		TRY_CAST(R       AS int),
		TRY_CAST(ER      AS int),
		TRY_CAST(HR      AS int),
		TRY_CAST(BB      AS int),
		TRY_CAST(IBB     AS int),
		TRY_CAST(SO      AS int),
		TRY_CAST(HBP     AS int),
		TRY_CAST(BK      AS int),
		TRY_CAST(WP      AS int),
		TRY_CAST(BF      AS int),
		TRY_CAST([ERA+]  AS int),
		TRY_CAST(FIP     AS float),
		TRY_CAST(WHIP    AS float),
		TRY_CAST(H9      AS float),
		TRY_CAST(HR9     AS float),
		TRY_CAST(BB9     AS float),
		TRY_CAST(SO9     AS float),
		TRY_CAST([SO/BB] AS float)
    FROM OPENJSON(@pitchingStatJSON)
    WITH (
        [Year]    nvarchar(10)  '$.Year',
        Team      nvarchar(MAX) '$.Team',
        Player    nvarchar(MAX) '$.Player',
        Age       nvarchar(10)  '$.Age',
        Pos       nvarchar(MAX) '$.Pos',
		WAR       nvarchar(10)  '$.WAR',
		W         nvarchar(10)  '$.W',
		L         nvarchar(10)  '$.L',
		[W-L%]    nvarchar(10)  '$."[W-L%]"',
		ERA       nvarchar(10)  '$.ERA',
		G         nvarchar(10)  '$.G',
		GS        nvarchar(10)  '$.GS',
		GF        nvarchar(10)  '$.GF',
		CG        nvarchar(10)  '$.CG',
		SHO       nvarchar(10)  '$.SHO',
		SV        nvarchar(10)  '$.SV',
		IP        nvarchar(10)  '$.IP',
		H         nvarchar(10)  '$.H',
		R         nvarchar(10)  '$.R',
		ER        nvarchar(10)  '$.ER',
		HR        nvarchar(10)  '$.HR',
		BB        nvarchar(10)  '$.BB',
		IBB       nvarchar(10)  '$.IBB',
		SO        nvarchar(10)  '$.SO',
		HBP       nvarchar(10)  '$.HBP',
		BK        nvarchar(10)  '$.BK',
		WP        nvarchar(10)  '$.WP',
		BF        nvarchar(10)  '$.BF',
		[ERA+]    nvarchar(10)  '$."[ERA+]"',
		FIP       nvarchar(10)  '$.FIP',
		WHIP      nvarchar(10)  '$.WHIP',
		H9        nvarchar(10)  '$.H9',
		HR9       nvarchar(10)  '$.HR9',
		BB9       nvarchar(10)  '$.BB9',
		SO9       nvarchar(10)  '$.SO9',
		[SO/BB]   nvarchar(10)  '$."[SO/BB]"'
    );
END;
GO