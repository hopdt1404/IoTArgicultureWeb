package model;

import com.mysql.cj.log.Log;
import org.joda.time.Instant;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class WeatherForecast{
    private Integer weatherForecastId;
    private String locateId;
    private ArrayList<WeatherForecastAtATime> weatherForecastAtATimes=new ArrayList<WeatherForecastAtATime>();
    private Timestamp currentTime;
    private Timestamp created_at;
    private Timestamp updated_at;
    public WeatherForecast() {
        locateId ="353412";
    }
    public WeatherForecast(String locateId) {
        this.locateId = locateId;
    }

    public WeatherForecast(Integer weatherForecastId, String locateId,
                           Timestamp currentTime, Timestamp created_at, Timestamp updated_at) {
        this.weatherForecastId = weatherForecastId;
        this.locateId = locateId;
        this.currentTime = currentTime;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Integer getWeatherForecastId() {
        return weatherForecastId;
    }
    public void setWeatherForecastId(Integer id) {
        this.weatherForecastId = id;
    }

    public Timestamp getCurTime() {
        return currentTime;
    }

    public  String getLocateId() {
        return locateId;
    }

    public ArrayList<WeatherForecastAtATime> getWeatherForecastAtATimes() {
        return weatherForecastAtATimes;
    }

    public void setLocateId(String locateId) {
        this.locateId = locateId;
    }

    public void setCurTime(Timestamp currentTime) {
        this.currentTime = currentTime;
    }

    public void setWeatherForecastAtATimes(ArrayList<WeatherForecastAtATime> weatherForecastAtATimes) {
        this.weatherForecastAtATimes = weatherForecastAtATimes;
    }

    private void analyse(JSONArray jsonArray) throws java.text.ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
        for(Object object:jsonArray){
            JSONObject jsonObject = (JSONObject)object;
            WeatherForecastAtATime weatherForecastAtATime = new WeatherForecastAtATime();

            Date date = simpleDateFormat.parse((String) jsonObject.get("DateTime"));
            Timestamp timestamp = new Timestamp(date.getTime());
            weatherForecastAtATime.setDateTime(timestamp);

            weatherForecastAtATime.setEpochDataTime((Long)jsonObject.get("EpochDateTime"));

            weatherForecastAtATime.setForecastStatus((String)jsonObject.get("IconPhrase"));

            weatherForecastAtATime.setDaylight((Boolean)jsonObject.get("IsDaylight"));

            JSONObject temper = (JSONObject) jsonObject.get("Temperature");
            weatherForecastAtATime.setTemperature(((Double)temper.get("Value")).floatValue());

            weatherForecastAtATime.setRelativeHumidity(((Long)jsonObject.get("RelativeHumidity")).floatValue());

            weatherForecastAtATime.setRainProbability(((Long)jsonObject.get("RainProbability")).byteValue());

            weatherForecastAtATime.setPrecipitationProbability(((Long)jsonObject.get("PrecipitationProbability")).byteValue());
            JSONObject rain = (JSONObject) jsonObject.get("Rain");

            weatherForecastAtATime.setRainValue(((Double)rain.get("Value")).floatValue());

            weatherForecastAtATime.setCloudCover(((Long)jsonObject.get("CloudCover")).byteValue());

            JSONObject wind = (JSONObject) jsonObject.get("Wind");
            JSONObject windSpeed = (JSONObject) wind.get("Speed");
            Double windSpeedValue = (Double) windSpeed.get("Value");
            weatherForecastAtATime.setWindSpeed((windSpeedValue).floatValue());
            weatherForecastAtATimes.add(weatherForecastAtATime);
        }
    }
    private void analyse(String json){
        JSONParser decodeJson = new JSONParser();
        Object obj_json = null;
        try {
            obj_json = decodeJson.parse(json);
            JSONArray jsonArray = (JSONArray)obj_json;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
            int i = 0;
            for(Object object:jsonArray){
                JSONObject jsonObject = (JSONObject)object;
                WeatherForecastAtATime weatherForecastAtATime = new WeatherForecastAtATime();

                Date date = simpleDateFormat.parse((String) jsonObject.get("DateTime"));
                Timestamp timestamp = new Timestamp(date.getTime());
                weatherForecastAtATime.setDateTime(timestamp);
                this.currentTime = timestamp;
                System.out.println("record Get: " + i);
                i++;

                weatherForecastAtATime.setEpochDataTime((Long)jsonObject.get("EpochDateTime"));

                weatherForecastAtATime.setForecastStatus((String)jsonObject.get("IconPhrase"));

                weatherForecastAtATime.setDaylight((Boolean)jsonObject.get("IsDaylight"));

                JSONObject temper = (JSONObject) jsonObject.get("Temperature");
                weatherForecastAtATime.setTemperature(((Double)temper.get("Value")).floatValue());

                weatherForecastAtATime.setRelativeHumidity(((Long)jsonObject.get("RelativeHumidity")).floatValue());

                weatherForecastAtATime.setRainProbability(((Long)jsonObject.get("RainProbability")).byteValue());

                weatherForecastAtATime.setPrecipitationProbability(((Long)jsonObject.get("PrecipitationProbability")).byteValue());
                JSONObject rain = (JSONObject) jsonObject.get("Rain");

                weatherForecastAtATime.setRainValue(((Double)rain.get("Value")).floatValue());

                weatherForecastAtATime.setCloudCover(((Long)jsonObject.get("CloudCover")).byteValue());

                JSONObject wind = (JSONObject) jsonObject.get("Wind");
                JSONObject windSpeed = (JSONObject) wind.get("Speed");
                Double windSpeedValue = (Double) windSpeed.get("Value");
                weatherForecastAtATime.setWindSpeed((windSpeedValue).floatValue());
                weatherForecastAtATimes.add(weatherForecastAtATime);
            }

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }

    }
    private String getApiURL(String locateId){
//        String api_key="LNrGryrjcdTBVNpPvJLCPWdg0lcZCQ4D";
        String api_key = "3DmZBJh3Vkm4n178sfIcY04z0aHugD28";
//        String api_url = "http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/" + locateId +"?apikey=" + api_key + "&language=en-us&details=true&metric=true";
        String api_url = "http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/" + locateId +"?apikey=" + api_key + "&language=en-us&details=true&metric=true";
        return api_url;
    }
    public void update(){
//        Date date = new Date();
        // clear old data
        weatherForecastAtATimes.clear();
        String api_url = getApiURL(locateId);
        try {
            System.out.println(api_url);
            URL obj = new URL(api_url);
            HttpURLConnection url_connect = (HttpURLConnection) obj.openConnection();
            url_connect.setRequestMethod("GET");
            int responseCode = url_connect.getResponseCode();
            System.out.println("responseCode");
            System.out.println(responseCode);
            if (responseCode == 200) {
                System.out.println("url_connect.getResponseMessage()");
                System.out.println(url_connect.getInputStream());
                BufferedReader in = new BufferedReader(new InputStreamReader(url_connect.getInputStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
//
//                    System.out.println("inputLine");
//                    System.out.println(inputLine);
                    response.append(inputLine);
                }
                in.close();
                analyse(response.toString());
            } else {
                System.out.println("url_connect.getResponseMessage()");
                System.out.println(url_connect.getResponseMessage());
            }
            //Thread.sleep(60*60*1000);
        } catch (Exception e) {
            System.out.println(e);
        }
//        Timestamp afterCurrentTimeHours = new Timestamp(date.getTime() + + TimeUnit.HOURS.toMillis(1));
//
//        if(currentTime == null || ( afterCurrentTimeHours.compareTo( new Timestamp(date.getTime())) == -1
//                // Todo: GetHour() != 23 ???
//                && currentTime.getHours() != 23)) {
//            weatherForecastAtATimes.clear();
////            LocalTime localTime = LocalTime.now();
////            System.out.println("localTime.toString()");
////            System.out.println(localTime.toString());
//            currentTime = new Timestamp(date.getTime());
//            String api_url = getApiURL(locateId);
//
//            try {
//                System.out.println(api_url);
//                URL obj = new URL(api_url);
//                HttpURLConnection url_connect = (HttpURLConnection) obj.openConnection();
//                url_connect.setRequestMethod("GET");
//                int responseCode = url_connect.getResponseCode();
//                System.out.println(responseCode);
//                if (responseCode == 200) {
//                    BufferedReader in = new BufferedReader(new InputStreamReader(url_connect.getInputStream()));
//                    String inputLine;
//                    StringBuffer response = new StringBuffer();
//                    while ((inputLine = in.readLine()) != null) {
//                        response.append(inputLine);
//                    }
//                    in.close();
//                    analyse(response.toString());
//                }
//                //Thread.sleep(60*60*1000);
//            } catch (Exception e) {
//                System.out.println(e);
//            }
//        }else{
//            return;
//        }
    }//REAL
    public void update_(){//TEST
//        if(currentTime==null||(currentTime.plusHours(1).compareTo(LocalTime.now())==-1&&currentTime.getHour()!=23)) {
//            weatherForecastAtATimes.clear();
//            currentTime = LocalTime.of(LocalTime.now().getHour(), 0);
//            System.out.println("WeatherForeecast: update...");
//            Object obj = null;
//            try {
//                obj = new JSONParser().parse(new FileReader("353412.json"));
//                JSONArray jsonArray = (JSONArray) obj;
//                analyse(jsonArray);
//            } catch (IOException e) {
//                e.printStackTrace();
//            } catch (ParseException e) {
//                e.printStackTrace();
//            } catch (java.text.ParseException e) {
//                e.printStackTrace();
//            }
//        }
    }

    @Override
    public String toString() {
        return "\nweatherForecastId: "+weatherForecastId+
                "\nlocateId: "+locateId+
                "\ncurrentTime: "+currentTime+
                "\ncreated_at: "+this.created_at+
                "\nupdated_at: "+this.updated_at+
                "\nweatherForecastAtATimes: \n"+
                weatherForecastAtATimes.toString();
    }
}
