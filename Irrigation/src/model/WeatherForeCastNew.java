package model;

import DAO.WeatherForecastNewDao;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class WeatherForeCastNew {
    private Long id;
    private String LocateID;
    private Timestamp ForecastTime;
    private Integer EpochTime;
    private Integer IsDayLight;
    private String ForecastStatus;
    private Double Temperature;
    private Double WindSpeed;
    private Double RelativeHumidity;
    private Integer RainProbability;
    private Integer PrecipitationProbability;
    private Double RainValue;
    private Integer CloudCover;
    private Timestamp created_at;
    private Timestamp updated_at;

    public WeatherForeCastNew(Long id,
                              String LocateID,
                              Timestamp ForecastTime,
                              Integer EpochTime,
                              String ForecastStatus,
                              Integer IsDayLight,
                              Double Temperature,
                              Double WindSpeed,
                              Double RelativeHumidity,
                              Integer RainProbability,
                              Integer PrecipitationProbability,
                              Double RainValue,
                              Integer CloudCover,
                              Timestamp created_at,
                              Timestamp updated_at) {
        this.id = id;
        this.LocateID = LocateID;
        this.ForecastTime = ForecastTime;
        this.EpochTime = EpochTime;
        this.IsDayLight = IsDayLight;
        this.ForecastStatus = ForecastStatus;
        this.Temperature = Temperature;
        this.WindSpeed = WindSpeed;
        this.RelativeHumidity = RelativeHumidity;
        this.RainProbability = RainProbability;
        this.PrecipitationProbability = PrecipitationProbability;
        this.RainValue = RainValue;
        this.CloudCover = CloudCover;
        this.created_at = created_at;
        this.updated_at = updated_at;

    }

    public WeatherForeCastNew(String LocateId) {
        setLocateId(LocateId);
    }
    public WeatherForeCastNew() {

    }

    public Long getId() {
        return  this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getLocateId(){
        return LocateID;
    }

    public void setLocateId(String LocateID){
        this.LocateID=LocateID;
    }

    public Timestamp getForecastTime(){
        return ForecastTime;
    }

    public void setForecastTime(Timestamp ForecastTime){
        this.ForecastTime=ForecastTime;
    }

    public Integer getEpochTime(){
        return EpochTime;
    }

    public void setEpochTime(Integer EpochTime){
        this.EpochTime=EpochTime;
    }
    public Integer getIsDayLight() {
        return this.IsDayLight;
    }
    public void setIsDayLight(Integer isDayLight) {
        this.IsDayLight = isDayLight;
    }
    public String getForecastStatus(){
        return ForecastStatus;
    }

    public void setForecastStatus(String ForecastStatus){
        this.ForecastStatus=ForecastStatus;
    }

    public Double getTemperature(){
        return Temperature;
    }

    public void setTemperature(Double Temperature){
        this.Temperature=Temperature;
    }

    public Double getWindSpeed(){
        return WindSpeed;
    }

    public void setWindSpeed(Double WindSpeed){
        this.WindSpeed=WindSpeed;
    }

    public Double getRelativeHumidity(){
        return RelativeHumidity;
    }

    public void setRelativeHumidity(Double RelativeHumidity){
        this.RelativeHumidity=RelativeHumidity;
    }

    public void setPrecipitationProbability(Integer precipitationProbability) {
        this.PrecipitationProbability = precipitationProbability;
    }
    public Integer getPrecipitationProbability()
    {
        return this.PrecipitationProbability;
    }
    public void setRainProbability(Integer rainProbability) {
        this.RainProbability = rainProbability;
    }
    public Integer getRainProbability () {
        return this.RainProbability;
    }

    public Double getRainValue(){
        return RainValue;
    }

    public void setRainValue(Double RainValue){
        this.RainValue=RainValue;
    }
    public void setCloudCover(Integer cloudCover) {
        this.CloudCover = cloudCover;
    }
    public Integer getCloudCover() {
        return this.CloudCover;
    }

    public Timestamp getCreatedAt(){
        return created_at;
    }

    public void setCreatedAt(Timestamp created_at){
        this.created_at=created_at;
    }

    public Timestamp getUpdatedAt(){
        return updated_at;
    }

    public void setUpdatedAt(Timestamp updated_at){
        this.updated_at=updated_at;
    }
    private String getAPIUrl(String locateID, Integer type, String apiAuthor) {
        /*
         * Type: 0: 1 hour
         * Type: 1: 12 hours
         *
         * apiAuthor: ["hopdt", "thangcq"]
         */
        if (locateID == null) {
            System.out.println("LocateID is Null in API getWeatherForecastHour");
            return null;
        }
        String apiKeyThangCq = "LNrGryrjcdTBVNpPvJLCPWdg0lcZCQ4D";
        String apiKeyHopdt = "3DmZBJh3Vkm4n178sfIcY04z0aHugD28";

        String hourType = null;
        if (type == 0) {
            hourType = "1hour/";
        } else if (type == 1) {
            hourType = "12hour/";
        } else {
            System.out.println("Not found hourType API getWeatherForecastHour");
            return null;
        }
        String apiKeyResult = null;
        if (apiAuthor == "hopdt") {
            apiKeyResult = apiKeyHopdt;
        } else if(apiAuthor == "thangcq") {
            apiKeyResult = apiKeyThangCq;
        } else {
            System.out.println("Not found authKey of API getWeatherForecastHour");
            return null;
        }
        String remoteName = "http://dataservice.accuweather.com/forecasts/v1/hourly/";
        String apiUrl = remoteName + hourType + locateID +
                "?apikey=" + apiKeyResult +
                "&language=en-us&details=true&metric=true";
        return apiUrl;

    }
    public void update(Integer type, String apiAuthor) {
        String locateId = this.getLocateId();
        String apiURL = this.getAPIUrl(locateId, type, apiAuthor);
        if (apiURL == null) {
            System.out.println("Url API getWeatherForecastHour is Null");
            return;
        }
        try {
            System.out.println(apiURL);
            URL obj = new URL(apiURL);
            HttpURLConnection url_connect = (HttpURLConnection) obj.openConnection();
            url_connect.setRequestMethod("GET");
            int responseCode = url_connect.getResponseCode();
            System.out.println("responseCode");
            System.out.println(responseCode);
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(url_connect.getInputStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                ArrayList<WeatherForeCastNew> weatherForeCastAnalyse =
                        this.analyse(response.toString(), locateId);
                if (weatherForeCastAnalyse.size() > 0) {
                    WeatherForecastNewDao weatherForecastNewDao = new WeatherForecastNewDao();
                    for (WeatherForeCastNew element: weatherForeCastAnalyse) {
                        weatherForecastNewDao.insertOrUpdate(element);
                    }
                } else {
                    System.out.println("weatherForeCastAnalyse size < 0");
                    return;
                }

            } else {
                System.out.println("url_connect.getResponseMessage()");
                System.out.println(url_connect.getResponseMessage());
                return;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    //
    private ArrayList<WeatherForeCastNew> analyse(String json, String locateID) {
        JSONParser decodeJson = new JSONParser();
        Object obj_json = null;
        ArrayList<WeatherForeCastNew> listWeatherForeCast = new ArrayList<WeatherForeCastNew>();
        if (locateID == null) {
            System.out.println("LocateID is Null in API getWeatherForecastHour");
            return listWeatherForeCast;
        }
        try {
            obj_json = decodeJson.parse(json);
            JSONArray jsonArray = (JSONArray)obj_json;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
            for(Object object:jsonArray){
                JSONObject jsonObject = (JSONObject)object;
                WeatherForeCastNew weatherForeCastNew = new WeatherForeCastNew();
                weatherForeCastNew.setLocateId(locateID);

                Date date = simpleDateFormat.parse((String) jsonObject.get("DateTime"));
                Timestamp forecastTime = new Timestamp(date.getTime());
                weatherForeCastNew.setForecastTime(forecastTime);

                Integer epochTime = ((Long)jsonObject.get("EpochDateTime")).intValue();
                weatherForeCastNew.setEpochTime(epochTime);

                String status = (String)jsonObject.get("IconPhrase");
                weatherForeCastNew.setForecastStatus(status);

                Integer isDayLight = (Boolean)jsonObject.get("IsDaylight") ? 1 : 0;
                weatherForeCastNew.setIsDayLight(isDayLight);
//                System.out.println("Temperature");
                JSONObject temper = (JSONObject) jsonObject.get("Temperature");
                Double temperature = (Double)temper.get("Value");
                weatherForeCastNew.setTemperature(temperature);
//                System.out.println("RelativeHumidity");
                Double relativeHumidity = ((Long)jsonObject.get("RelativeHumidity")).doubleValue();
                weatherForeCastNew.setRelativeHumidity(relativeHumidity);
//                System.out.println("RainProbability");
                Integer rainProbability = ((Long)jsonObject.get("RainProbability")).intValue();
                weatherForeCastNew.setRainProbability(rainProbability);
//                System.out.println("PrecipitationProbability");
                Integer precipitationProbability = ((Long)jsonObject.get("PrecipitationProbability")).intValue();
                weatherForeCastNew.setPrecipitationProbability(precipitationProbability);
//                System.out.println("Rain");
                JSONObject rain = (JSONObject) jsonObject.get("Rain");
                Double rainValue = (Double)rain.get("Value");
                weatherForeCastNew.setRainValue(rainValue);
//                System.out.println("CloudCover");
                Integer cloudCover = ((Long)jsonObject.get("CloudCover")).intValue();
                weatherForeCastNew.setCloudCover(cloudCover);
//                System.out.println("windSpeedValue");
                JSONObject wind = (JSONObject) jsonObject.get("Wind");
                JSONObject windSpeed = (JSONObject) wind.get("Speed");
                Double windSpeedValue = (Double) windSpeed.get("Value");
                weatherForeCastNew.setWindSpeed(windSpeedValue);
                System.out.println("weatherForeCastNew.toString()");
                System.out.println(weatherForeCastNew.toString());

                listWeatherForeCast.add(weatherForeCastNew);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
        return listWeatherForeCast;
    }
    public String toString() {
        return "id: " +this.getId()+"\n"+
                "LocateID: "+ this.getLocateId()+"\n"+
                "ForecastTime: "+ this.getForecastTime()+"\n"+
                "epochDataTime: "+this.getEpochTime()+"\n"+
                "forecastStatus: "+this.getForecastStatus()+"\n"+
                "isDaylight: "+this.getIsDayLight()+"\n"+
                "temperature: "+this.getTemperature()+"\n"+
                "windSpeed: "+this.getWindSpeed()+"\n"+
                "relativeHumidity "+this.getRelativeHumidity()+"\n"+
                "rainProbability: "+this.getRainProbability()+"\n"+
                "precipitationProbability: "+this.getPrecipitationProbability()+"\n"+
                "rainValue: "+this.getRainValue()+"\n"+
                "cloudCover: "+this.getCloudCover()+"\n"+
                "created_at: "+this.getCreatedAt()+"\n"+
                "updated_at: "+this.getUpdatedAt()+"\n"
                ;
    }

}
