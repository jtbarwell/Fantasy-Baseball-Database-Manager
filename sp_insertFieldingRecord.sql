-- =============================================
-- Author:      <Author, sysname, Your Name>
-- Create Date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
drop procedure if exists sp_insertFieldingRecord;
GO;

CREATE PROCEDURE sp_insertFieldingRecord
	@Year    	int,
	@Team    	nvarchar(30),
	@Player		nvarchar(150),
	@Age		int,
	@G			int,
	@GS			int,
	@CG			int,
	@Inn		float,
	@Ch			int,
	@PO			int,
	@A			int,
	@E			int,
	@DP			int,
	@Fld_pct    decimal(4, 3),
	@Rtot		int,
	@Rtot_yr	int,
	@RF_9		float,
	@lgRF9		float,
	@PB			int,
	@WP			int,
	@SB			int,
	@CS			int,
	@CS_pct		float,
	@Pick		int,
	@Pos		nvarchar(30)
AS  
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    insert into FieldingStats 
        (Year, Team, Player, Age, G, GS, CG, Inn, Ch, PO, A, E, DP, [Fld%], Rtot, [Rtot/yr], [RF/9], lgRF9, PB, WP, SB, CS, [CS%], Pick, Pos)
    values
        (@Year, @Team, @Player, @Age, @G, @GS, @CG, @Inn, @Ch, @PO, @A, @E, @DP, @Fld_pct, @Rtot, @Rtot_yr, @RF_9, @lgRF9, @PB, @WP, @SB, @CS, @CS_pct, @Pick, @Pos);
    
END