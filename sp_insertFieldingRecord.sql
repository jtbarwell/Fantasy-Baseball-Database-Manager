-- =============================================
-- Author:      <Joshua Barwell, DESKTOP-IEKNRR8\SQLEXPRESS | baseball>
-- Create Date: <2025-08-07>
-- Description: <Stored procedure to insert data into the FieldingStats table via JSON string>
-- =============================================
use [baseball];
GO

create or alter PROCEDURE sp_insertFieldingRecord
	@fieldingStatJSON nvarchar(MAX)
AS  
BEGIN
    SET NOCOUNT ON;


    INSERT INTO FieldingStats 
        ([Year], Team, Player, Age, Pos, G, GS, CG, Inn, Ch, PO, A, E, DP, [Fld%], Rtot, [Rtot/yr], [RF/9], lgRF9, PB, WP, SB, CS, [CS%], Pick)
    SELECT
        TRY_CAST([Year]  	AS int),
        Team,
        Player,
        TRY_CAST(Age 	 	AS int),
        Pos,
		TRY_CAST(G			AS int),
		TRY_CAST(GS			AS int),
		TRY_CAST(CG			AS int),
		TRY_CAST(Inn		AS float),
		TRY_CAST(Ch			AS int),
		TRY_CAST(PO			AS int),
		TRY_CAST(A			AS int),
		TRY_CAST(E			AS int),
		TRY_CAST(DP			AS int),
		TRY_CAST([Fld%]		AS decimal(4, 3)),
		TRY_CAST(Rtot		AS int),
		TRY_CAST([Rtot/yr]	AS int),
		TRY_CAST([RF/9]		AS float),
		TRY_CAST(lgRF9		AS float),
		TRY_CAST(PB			AS int),
		TRY_CAST(WP			AS int),
		TRY_CAST(SB			AS int),
		TRY_CAST(CS			AS int),
		TRY_CAST([CS%]		AS float),
		TRY_CAST(Pick		AS int)
    FROM OPENJSON(@fieldingStatJSON)
    WITH (
        [Year]    nvarchar(10)  '$.Year',
        Team      nvarchar(MAX) '$.Team',
        Player    nvarchar(MAX) '$.Player',
        Age       nvarchar(10)  '$.Age',
        Pos       nvarchar(MAX) '$.Pos',
		G		  nvarchar(10)  '$.G',
		GS		  nvarchar(10)  '$.GS',
		CG		  nvarchar(10)  '$.CG',
		Inn		  nvarchar(10)  '$.Inn',
		Ch		  nvarchar(10)  '$.Ch',
		PO		  nvarchar(10)  '$.PO',
		A		  nvarchar(10)  '$.A',
		E		  nvarchar(10)  '$.E',
		DP		  nvarchar(10)  '$.DP',
		[Fld%]	  nvarchar(10)  '$."[Fld%]"',
		Rtot	  nvarchar(10)  '$.Rtot',
		[Rtot/yr] nvarchar(10)  '$."[Rtot/yr]"',
		[RF/9]	  nvarchar(10)  '$."[RF/9]"',
		lgRF9	  nvarchar(10)  '$.lgRF9',
		PB		  nvarchar(10)  '$.PB',
		WP		  nvarchar(10)  '$.WP',
		SB		  nvarchar(10)  '$.SB',
		CS		  nvarchar(10)  '$.CS',
		[CS%]	  nvarchar(10)  '$."[CS%]"',
		Pick	  nvarchar(10)  '$.Pick'
    );
END;
GO