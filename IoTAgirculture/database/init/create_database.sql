
create database if not exists irrigation_database;

use irrigation_database;

CREATE TABLE IF NOT EXISTS Users (
                                     UserID INT NOT NULL AUTO_INCREMENT,
                                     UserName VARCHAR(50) NOT NULL,
    Email varchar(50) not null,
    UPassword VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserID)
    )  ENGINE INNODB DEFAULT COLLATE='utf8_unicode_ci';

create table if not exists DeviceTypes(
                                          DeviceTypeID int not null auto_increment,
                                          DeviceType varchar(50) not null,
    primary key(DeviceTypeID)
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists FarmTypes(
                                        FarmTypeID int not null auto_increment,
                                        FarmType varchar(50) not null,
    primary key(FarmTypeID)
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists PlotTypes(
                                        PlotTypeID int not null auto_increment,
                                        PlotType varchar(50) not null,
    primary key(PlotTypeID)
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists Locates(
    LocateID varchar(50) not null,
    LocateName varchar(50),
    primary key(LocateID)
    ) engine InnoDB default COLLATE='utf8_unicode_ci';
create table if not exists Farms(
                                    FarmID int not null auto_increment,
                                    LocateID varchar(50),
    Area float8,
    FarmTypeID int,
    Status bool,
    UserID int,
    primary key(FarmID),
    foreign key(UserID) references Users(UserID)on delete restrict on update cascade,
    foreign key(FarmTypeID) references FarmTypes(FarmTypeID)on delete restrict on update cascade,
    foreign key(LocateID) references Locates(LocateID) on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists Plots(
                                    PlotID int not null auto_increment,
                                    Area float8,
                                    PlotTypeID int,
                                    FarmID int,
                                    primary key(PlotID),
    foreign key(FarmID) references Farms(FarmID)on delete restrict on update cascade,
    foreign key(PlotTypeID) references PlotTypes(PlotTypeID)on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists Devices(
                                      DeviceID bigint not null,
                                      DeviceTypeID int,
                                      DeviceName varchar(50),
    Status bool,
    PlotID int,
    primary key(DeviceID),
    foreign key(DeviceTypeID) references DeviceTypes(DeviceTypeID)on delete restrict on update cascade,
    foreign key(PlotID) references Plots(PlotID)on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists Sensing(
                                      SensingID bigint auto_increment,
                                      DeviceID bigint,
                                      PlotID int,
                                      SoilMoisture float4,
                                      Humidity float4,
                                      Temperature float4,
    -- SoilTemperature float4,
                                      LightLevel int,
                                      TimeOfMeasurement datetime,
                                      primary key(SensingID),
    foreign key(PlotID) references Plots(PlotID) on delete restrict on update cascade,
    foreign key(DeviceID) references Devices(DeviceID) on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists WeatherForecasts(
                                               WeatherForecastID int not null auto_increment,
                                               LocateID varchar(50) not null,
    CurrentTime TIMESTAMP,
    primary key(WeatherForecastID),
    foreign key(LocateID) references Locates(LocateID) on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists WeatherForecastAtATimes(
                                                      WeatherForecastID int not null,
                                                      ForecastTime timestamp,
                                                      EpochTime bigint,
                                                      ForecastStatus varchar(50),
    IsDayLight bool,
    Temperature float,
    WindSpeed float,
    RelativeHumidity float,
    RainProbability tinyint,
    PrecipitationProbability tinyint,
    RainValue float,
    CloudCover tinyint,
    primary key(WeatherForecastID, ForecastTime),
    foreign key(WeatherForecastID) references WeatherForecasts(WeatherForecastID) on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';

create table if not exists Controlling(
                                          ControllingID bigint,
                                          DeviceID bigint,
                                          PlotID int,
                                          AmountOfWater float, -- l
                                          WateringDuration int, -- s
                                          TimeOfControl datetime,
                                          primary key(ControllingID),
    foreign key(DeviceID) references Devices(DeviceID)on delete restrict on update cascade,
    foreign key(PlotID) references Plots(PlotID)on delete restrict on update cascade
    ) engine InnoDB default COLLATE='utf8_unicode_ci';
