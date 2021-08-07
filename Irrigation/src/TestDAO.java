import DAO.*;
import Utilities.Helper;
import com.google.gson.stream.JsonReader;
import model.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.util.List;

public class TestDAO {
    private static class Coord{
        public Double lon;
        public Double lat;

        @Override
        public String toString() {
            return lon.floatValue()+", "+lat.floatValue();
        }
    }
    public static void main(String[] args) throws IOException, InterruptedException {
//        testLocateDao1();
//        testUserDao();
//        testFarmDao();
//        testPlotDao();
//        testDeviceTypeDao();
//        testDeviceDao();
//        testSensingDao();
//        testWeatherForecastDao();
        testForecastNew();
    }

    public static void testWeatherForecastDao(){
        WeatherForecastDao weatherForecastDao = new WeatherForecastDao();
        WeatherForecast weatherForecast = new WeatherForecast();
        // Todo: update function check latter
        System.out.println("Before weatherForecast.update();");
        weatherForecast.update();
        System.out.println(weatherForecast);
        System.out.println("After weatherForecast.update();");
        // Todo: save
        System.out.println("Before weatherForecast.weatherForecastDao.save(weatherForecast);();");
        weatherForecastDao.save(weatherForecast);
        System.out.println("After weatherForecast.weatherForecastDao.save(weatherForecast);();");
//        List<WeatherForecast> weatherForecasts = weatherForecastDao.getByLocateId("353412");
//        for(WeatherForecast wf:weatherForecasts){
//            System.out.println(wf);
//        }
    }

    public static void testWeatherForecastAtATimeDao(){
        WeatherForecastAtATime weatherForecastAtATime = new WeatherForecastAtATime();

    }

    public static void testLocateDao() throws IOException{
        LocateDao locateDao = new LocateDao();
        InputStream out = new FileInputStream("city.list.json");
        JsonReader reader = new JsonReader(new InputStreamReader(out,"UTF-8"));
        int dem = 0;
//        reader.setLenient(true);
        reader.beginArray();
        while (reader.hasNext()) {
            int id = 0;
            String nameArea = null;
            String country = null;
            Coord coord = new Coord();
            reader.beginObject();
            while (reader.hasNext()) {

                String name = reader.nextName();
                if (name.equals("id")) {
                    id = reader.nextInt();
//                    System.out.println(reader.nextInt());
                } else if (name.equals("name")) {
                    nameArea = reader.nextString();
//                    System.out.println(reader.nextString());
                } else if (name.equals("country")) {
                    country = reader.nextString();
//                    System.out.println(reader.nextString());
                } else if (name.equals("coord")) {
                    reader.beginObject();
                    while (reader.hasNext()) {
                        reader.nextName();
                        coord.lon = reader.nextDouble();
                        reader.nextName();
                        coord.lat = reader.nextDouble();
                    }
                    reader.endObject();
                } else {// unexpected value, skip it or generate error
                    reader.skipValue();
                }

            }
            reader.endObject();
            try {

                if (country.equals("VN")) {
                    System.out.println(id + ", " + nameArea + ", " + country + ", " + coord.toString());
                    locateDao.save(new Locate(String.valueOf(id), Helper.removeAccent(nameArea)));
                    dem++;
                }

            } catch (NullPointerException e) {

            }
        }

        reader.endArray();
        reader.close();
        System.out.println(dem);
    }
    public static void testLocateDao1(){
        LocateDao locateDao = new LocateDao();
        locateDao.save(new Locate("1","Ha Noi"));
    }
    public static void testUserDao(){
        UserDao userDao = new UserDao();
        String userName = "admin";
        String password = Helper.md5("12345678");
        User userUpdate = new User(userName, password);
        User userExist = userDao.getByUsernameAndPassword(userName, password);
        if (userExist != null && userExist.getUserID() > 0) {
            System.out.println("userExist");
            userDao.update(userExist, userUpdate);
        } else {
            userDao.save(new User(userName, password));
        }
        List<User> users = userDao.getAll();
        for(User u:users){
            System.out.println(u.toString());
        }
    }
    public static void testFarmDao(){
        FarmDao farmDao = new FarmDao();

        farmDao.save(new Farm(null,null,null,null,null));
//        List<Farm> farms = farmDao.getAll();
//        for(Farm f:farms){
//            System.out.println(f.toString());
//        }
//        Farm newFarm = new Farm(null,null,null,null,null);
//        Farm newFarm = new Farm(1,2.0D,1,Boolean.FALSE,1);
//        Farm oldFarm = farmDao.getById(5);
//        farmDao.update(oldFarm, newFarm);
//        farmDao.delete(3);

    }
    public static void testPlotDao(){
        PlotDao plotDao = new PlotDao();
        plotDao.save(new Plot(null,null,1));
        plotDao.save(new Plot(null,null,1));
        List<Plot> plots = plotDao.getAll();
        for(Plot p:plots){
            System.out.println(p.toString());
        }
    }
    public static void testDeviceTypeDao(){
        DeviceTypeDao deviceTypeDao = new DeviceTypeDao();
        deviceTypeDao.save(new DeviceType("Sensor"));
        deviceTypeDao.save(new DeviceType("Controller"));
        deviceTypeDao.save(new DeviceType("API Forecast"));
        List<DeviceType> deviceTypes = deviceTypeDao.getAll();
        for(DeviceType dt:deviceTypes){
            System.out.println(dt.toString());
        }
    }
    public static void testDeviceDao(){
        DeviceDao deviceDao = new DeviceDao();
        int count = 5;
        for (int i = 0; i < count; i++) {
            Long deviceIdSelect = Long.valueOf(i) + 1;
            Device deviceSelect = deviceDao.getById(deviceIdSelect);
            System.out.println("deviceSelect");
            System.out.println(deviceSelect);
            Device deviceInsertOrUpdate = new Device(deviceIdSelect,1,("Sensor update" + i),1,1, 1L, 1L);
            if (deviceSelect == null) {
                deviceDao.save(deviceInsertOrUpdate);
            } else {
                deviceDao.update(deviceSelect, deviceInsertOrUpdate);
            }

        }
        List<Device> devices = deviceDao.getAll();
        for(Device d:devices){
            System.out.println(d.toString());
        }
    }
    public static void testSensingDao() throws InterruptedException {
        SensingDao sensingDao = new SensingDao();
        for(int i=0;i<10;i++){
            Thread.sleep(1000);
            sensingDao.save(new Sensing(1L,1,0F,0F,0F,0,Helper.getNow()));
        }
        List<Sensing> sensings = sensingDao.getAll();
        for(Sensing s:sensings){
            System.out.println(s.toString());
        }
    }

    public static void testForecastNew() {
//        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//        WeatherForCastNew weatherForCastNew = new WeatherForCastNew(
//                1L, "LocateID", timestamp, 2,
//                "status", 1, 2D, 2D,
//                2D, 1, 1, 3D, 13,
//                timestamp, null
//        );
//        WeatherForecastNewDao weatherForecastNewDao = new WeatherForecastNewDao();
////        weatherForecastNewDao.save(weatherForCastNew);
//        WeatherForCastNew weatherForCastNew2 = new WeatherForCastNew(
//                1L, "LocateID", new Timestamp("2021-08-15 07:13:11"), 2,
//                "status", 1, 2D, 2D,
//                2D, 1, 1, 3D, 13,
//                timestamp, timestamp
//        );
//        weatherForecastNewDao.update(weatherForCastNew, weatherForCastNew2);
    }

}
