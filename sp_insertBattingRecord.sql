-- =============================================
-- Author:      <Author, sysname, Your Name>
-- Create Date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
drop procedure if exists sp_insertBattingRecord;
GO;

CREATE PROCEDURE sp_insertBattingRecord
	@Year	int,
	@Team	nvarchar(30),
	@Player	nvarchar(150),
	@Age	int,
	@Pos	nvarchar(15),
	@WAR	float,
	@G		int,
	@PA		int,
	@AB		int,
	@R		int,
	@H		int,
	@2B		int,
	@3B		int,
	@HR		int,
	@RBI	int,
	@SB		int,
	@CS		int,
	@BB		int,
	@SO		int,
	@BA		decimal(4, 3),
	@OBP	decimal(4, 3),
	@SLG	decimal(4, 3),
	@OPS	decimal(4, 3),
	@OPS_P	int,
	@rOBA	decimal(4, 3),
	@Rbat_P	int,
	@TB		int,
	@GIDP	int,
	@HBP	int,
	@SH		int,
	@SF		int,
	@IBB	int
AS  
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    insert into BattingStats 
        (Year, Team, Player, Age, Pos, WAR, G, PA, AB, R, H, [2B], [3B], HR, RBI, SB, CS, BB, SO, BA, OBP, SLG, OPS, [OPS+], rOBA, [Rbat+], TB, GIDP, HBP, SH, SF, IBB)
    values
        (@Year, @Team, @Player, @Age, @Pos, @WAR, @G, @PA, @AB, @R, @H, @2B, @3B, @HR, @RBI, @SB, @CS, @BB, @SO, @BA, @OBP, @SLG, @OPS, @OPS_P, @rOBA, @Rbat_P, @TB, @GIDP, @HBP, @SH, @SF, @IBB);
    
END