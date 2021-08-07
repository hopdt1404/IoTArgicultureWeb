package components;

import DAO.LocateDao;
import DAO.WeatherForecastDao;
import model.Locate;
import model.WeatherForeCastNew;
import model.WeatherForecast;

import java.util.ArrayList;

public class WeatherForecastCollector implements Runnable {
    @Override
    public void run() {
        while(true) {
            System.out.println("WeatherForecastCollector 19");
            System.out.println("weather forecast is updating...");
            WeatherForecastDao weatherForecastDao = new WeatherForecastDao();
            LocateDao locateDao = new LocateDao();
            // get locate in farm
            ArrayList<Locate> locates = (ArrayList<Locate>) locateDao.getLocateFarms();

            for(Locate l:locates){
                System.out.println("l.getLocateId()");
                System.out.println(l.getLocateId());
                WeatherForeCastNew weatherForeCastNew = new WeatherForeCastNew(l.getLocateId());
                // 1hour
//                weatherForeCastNew.update(0, "hopdt");
                // 12hour
                weatherForeCastNew.update(1, "hopdt");
//                weatherForCastNew
//                WeatherForecast weatherForecast = new WeatherForecast(l.getLocateId());
//                weatherForecast.update();
//                System.out.println("weatherForecast.toString()");
//                System.out.println(weatherForecast.toString());
//                System.out.println("weatherForecast.getWeatherForecastId()");
//                System.out.println(weatherForecast.getWeatherForecastId());
//                System.out.println("weatherForecast.getLocateId()");
//                System.out.println(weatherForecast.getLocateId());
//                System.out.println("weatherForecast.getCurTime()");
//                System.out.println(weatherForecast.getCurTime());
//                weatherForecastDao.insertOrUpdate(weatherForecast);
//                weatherForecastDao.save(weatherForecast);
//                break;
            }
            break;
//
//
//            try {
//                LocalDateTime datetime = LocalDateTime.now();
//                LocalDateTime nextDateTime = datetime.plusHours(1).withMinute(0).withSecond(0).withNano(0);
//                Thread.sleep((nextDateTime.toEpochSecond(ZoneOffset.UTC)-datetime.toEpochSecond(ZoneOffset.UTC))*1000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
        }
    }
}
