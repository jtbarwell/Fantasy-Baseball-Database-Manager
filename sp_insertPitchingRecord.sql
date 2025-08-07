-- =============================================
-- Author:      <Author, sysname, Your Name>
-- Create Date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
drop procedure if exists sp_insertPitchingRecord;
GO;

CREATE PROCEDURE sp_insertPitchingRecord
	@Year    int,
	@Team    nvarchar(30),
	@Player  nvarchar(150),
	@Age     int,
	@Pos     nvarchar(15),
	@WAR     float,
	@W       int,
	@L       int,
	@W_L_pct decimal(4, 3),
	@ERA     float,
	@G       int,
	@GS      int,
	@GF      int,
	@CG      int,
	@SHO     int,
	@SV      int,
	@IP      float,
	@H       int,
	@R       int,
	@ER      int,
	@HR      int,
	@BB      int,
	@IBB     int,
	@SO      int,
	@HBP     int,
	@BK      int,
	@WP      int,
	@BF      int,
	@ERA_P   int,
	@FIP     float,
	@WHIP    float,
	@H9      float,
	@HR9     float,
	@BB9     float,
	@SO9     float,
	@SO_BB   float
AS  
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    insert into PitchingStats 
        (Player, Age, Pos, WAR, W, L, [W-L%], ERA, G, GS, GF, CG, SHO, SV, IP, H, R, ER, HR, BB, IBB, SO, HBP, BK, WP, BF, [ERA+], FIP, WHIP, H9, HR9, BB9, SO9, [SO/BB])
    values
        (@Year, @Team, @Player, @Age, @Pos, @WAR, @W, @L, @W_L_pct, @ERA, @G, @GS, @GF, @CG, @SHO, @SV, @IP, @H, @R, @ER, @HR, @BB, @IBB, @SO, @HBP, @BK, @WP, @BF, @ERA_P, @FIP, @WHIP, @H9, @HR9, @BB9, @SO9, @SO_BB);
    
END