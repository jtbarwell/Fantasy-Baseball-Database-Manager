use baseball;

drop table if exists BattingStats;





create table BattingStats (
    StatsID int identity(1, 1),
    Year    int,
    Team    nvarchar(30),
    Player  nvarchar(150),
    Age     int,
    Pos     nvarchar(15),
    WAR     decimal(2, 1),
    G       int,
    PA      int,
    AB      int,
    R       int,
    H       int,
    [2B]    int,
    [3B]    int,
    HR      int,
    RBI     int,
    SB      int,
    CS      int,
    BB      int,
    SO      int,
    BA      decimal(4, 3),
    OBP     decimal(4, 3),
    SLG     decimal(4, 3),
    OPS     decimal(4, 3),
    [OPS+]  int,
    rOBA    decimal(4, 3),
    [Rbat+] int,
    TB      int,
    GIDP    int,
    HBP     int,
    SH      int,
    SF      int,
    IBB     int,

    constraint PK_BattingStats primary key (StatsID)
);