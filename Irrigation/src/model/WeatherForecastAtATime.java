package model;


import java.sql.Date;
import java.sql.Timestamp;

public class WeatherForecastAtATime{
    private Integer weatherForecastId;
    private Timestamp dateTime;
    private Long epochDataTime;
    private String forecastStatus;
    private Boolean isDaylight;
    private Float temperature;
    private Float windSpeed;
    private Float relativeHumidity;
    private Byte rainProbability;
    private Byte precipitationProbability;
    private Float rainValue;
    private Byte cloudCover;
    private Timestamp created_at;
    private Timestamp updated_at;

    public WeatherForecastAtATime() {
    }

    public WeatherForecastAtATime(Integer weatherForecastId,
                                  Timestamp dateTime,
                                  Long epochDataTime,
                                  String forecastStatus,
                                  Boolean isDaylight,
                                  Float temperature,
                                  Float windSpeed,
                                  Float relativeHumidity,
                                  Byte rainProbability,
                                  Byte precipitationProbability,
                                  Float rainValue,
                                  Byte cloudCover,
                                  Timestamp created_at,
                                  Timestamp updated_at) {
        this.weatherForecastId = weatherForecastId;
        this.dateTime = dateTime;
        this.epochDataTime = epochDataTime;
        this.forecastStatus = forecastStatus;
        this.isDaylight = isDaylight;
        this.temperature = temperature;
        this.windSpeed = windSpeed;
        this.relativeHumidity = relativeHumidity;
        this.rainProbability = rainProbability;
        this.precipitationProbability = precipitationProbability;
        this.rainValue = rainValue;
        this.cloudCover = cloudCover;
        this.created_at = created_at;
        this.updated_at = updated_at;

    }

//    public WeatherForecastAtATime(Date dateTime, Long epochDataTime, String forecastStatus, Boolean isDaylight, Float temperature, Float windSpeed, Float relativeHumidity, Byte rainProbability, Byte precipitationProbability, Float rainValue, Byte cloudCover) {
//        this.dateTime = dateTime;
//        this.epochDataTime = epochDataTime;
//        this.forecastStatus = forecastStatus;
//        this.isDaylight = isDaylight;
//        this.temperature = temperature;
//        this.windSpeed = windSpeed;
//        this.relativeHumidity = relativeHumidity;
//        this.rainProbability = rainProbability;
//        this.precipitationProbability = precipitationProbability;
//        this.rainValue = rainValue;
//        this.cloudCover = cloudCover;
//    }

    @Override
    public String toString() {
        return "weatherForecastId: " +weatherForecastId+"\n"+
                "dateTime: "+ dateTime+"\n"+
                "epochDataTime: "+epochDataTime+"\n"+
                "forecastStatus: "+forecastStatus+"\n"+
                "isDaylight: "+isDaylight+"\n"+
                "temperature: "+temperature+"\n"+
                "windSpeed: "+windSpeed+"\n"+
                "relativeHumidity "+relativeHumidity+"\n"+
                "rainProbability: "+rainProbability+"\n"+
                "precipitationProbability: "+precipitationProbability+"\n"+
                "rainValue: "+rainValue+"\n"+
                "cloudCover: "+cloudCover+"\n";
    }

    public Integer getWeatherForecastId() {
        return weatherForecastId;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public Long getEpochDataTime() {
        return epochDataTime;
    }

    public String getForecastStatus() {
        return forecastStatus;
    }

    public Boolean getDaylight() {
        return isDaylight;
    }

    public Float getTemperature() {
        return temperature;
    }

    public Float getWindSpeed() {
        return windSpeed;
    }

    public Float getRelativeHumidity() {
        return relativeHumidity;
    }

    public Byte getRainProbability() {
        return rainProbability;
    }

    public Byte getPrecipitationProbability() {
        return precipitationProbability;
    }

    public Float getRainValue() {
        return rainValue;
    }

    public Byte getCloudCover() {
        return cloudCover;
    }

    public void setWeatherForecastId(Integer weatherForecastId) {
        this.weatherForecastId = weatherForecastId;
    }
    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    public void setEpochDataTime(Long epochDataTime) {
        this.epochDataTime = epochDataTime;
    }
    public void setForecastStatus(String forecastStatus) {
        this.forecastStatus = forecastStatus;
    }
    public void setDaylight(Boolean daylight) {
        isDaylight = daylight;
    }
    public void setTemperature(Float temperature) {
        this.temperature = temperature;
    }
    public void setWindSpeed(Float windSpeed) {
        this.windSpeed = windSpeed;
    }
    public void setRelativeHumidity(Float relativeHumidity) {
        this.relativeHumidity = relativeHumidity;
    }
    public void setRainProbability(Byte rainProbability) {
        this.rainProbability = rainProbability;
    }
    public void setPrecipitationProbability(Byte precipitationProbability) {
        this.precipitationProbability = precipitationProbability;
    }
    public void setRainValue(Float rainValue) {
        this.rainValue = rainValue;
    }
    public void setCloudCover(Byte cloudCover) {
        this.cloudCover = cloudCover;
    }
    public Timestamp getCreatedAt ()
    {
        return this.created_at;
    }
    public void setCreatedAt(Timestamp created_at) {
        this.created_at = created_at;
    }
    public Timestamp getUpdatedAt () {
        return this.updated_at;
    }
    public void setUpdatedAt(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}