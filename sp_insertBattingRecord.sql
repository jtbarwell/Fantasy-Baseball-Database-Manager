-- =============================================
-- Author:      <Author, sysname, Your Name>
-- Create Date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
create PROCEDURE sp_insertBattingRecord
	@battingStatJSON nvarchar(MAX)
AS  
BEGIN
    SET NOCOUNT ON;

    DECLARE @json NVARCHAR(MAX) = CAST(@battingStatJSON AS nvarchar(max));


    INSERT INTO baseball.dbo.BattingStats 
        (Year, Team, Player, Age, Pos, WAR, G, PA, AB, R, H, [2B], [3B], HR, RBI, SB, CS, BB, SO, BA, OBP, SLG, OPS, [OPS+], rOBA, [Rbat+], TB, GIDP, HBP, SH, SF, IBB)
    SELECT
        TRY_CAST(Year AS int),
        Team,
        Player,
        TRY_CAST(Age AS int),
        Pos,
        TRY_CAST(WAR AS float),
        TRY_CAST(G AS int),
        TRY_CAST(PA AS int),
        TRY_CAST(AB AS int),
        TRY_CAST(R AS int),
        TRY_CAST(H AS int),
        TRY_CAST([2B] AS int),
        TRY_CAST([3B] AS int),
        TRY_CAST(HR AS int),
        TRY_CAST(RBI AS int),
        TRY_CAST(SB AS int),
        TRY_CAST(CS AS int),
        TRY_CAST(BB AS int),
        TRY_CAST(SO AS int),
        TRY_CAST(BA AS decimal(4,3)),
        TRY_CAST(OBP AS decimal(4,3)),
        TRY_CAST(SLG AS decimal(4,3)),
        TRY_CAST(OPS AS decimal(4,3)),
        TRY_CAST(OPS_P AS int),
        TRY_CAST(rOBA AS decimal(4,3)),
        TRY_CAST(Rbat_P AS int),
        TRY_CAST(TB AS int),
        TRY_CAST(GIDP AS int),
        TRY_CAST(HBP AS int),
        TRY_CAST(SH AS int),
        TRY_CAST(SF AS int),
        TRY_CAST(IBB AS int)
    FROM OPENJSON(@battingStatJSON)
    WITH (
        Year      nvarchar(10) '$.Year',
        Team      nvarchar(MAX) '$.Team',
        Player    nvarchar(MAX) '$.Player',
        Age       nvarchar(10) '$.Age',
        Pos       nvarchar(MAX) '$.Pos',
        WAR       nvarchar(20) '$.WAR',
        G         nvarchar(10) '$.G',
        PA        nvarchar(10) '$.PA',
        AB        nvarchar(10) '$.AB',
        R         nvarchar(10) '$.R',
        H         nvarchar(10) '$.H',
        [2B]      nvarchar(10) '$.[2B]',
        [3B]      nvarchar(10) '$.[3B]',
        HR        nvarchar(10) '$.HR',
        RBI       nvarchar(10) '$.RBI',
        SB        nvarchar(10) '$.SB',
        CS        nvarchar(10) '$.CS',
        BB        nvarchar(10) '$.BB',
        SO        nvarchar(10) '$.SO',
        BA        nvarchar(20) '$.BA',
        OBP       nvarchar(20) '$.OBP',
        SLG       nvarchar(20) '$.SLG',
        OPS       nvarchar(20) '$.OPS',
        OPS_P     nvarchar(10) '$.OPS_P',
        rOBA      nvarchar(20) '$.rOBA',
        Rbat_P    nvarchar(10) '$.Rbat_P',
        TB        nvarchar(10) '$.TB',
        GIDP      nvarchar(10) '$.GIDP',
        HBP       nvarchar(10) '$.HBP',
        SH        nvarchar(10) '$.SH',
        SF        nvarchar(10) '$.SF',
        IBB       nvarchar(10) '$.IBB'
    );
END