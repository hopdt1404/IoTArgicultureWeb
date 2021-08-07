package DAO;

import com.mysql.cj.log.Log;
import model.WeatherForecast;
import model.WeatherForecastAtATime;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class WeatherForecastDao implements Dao<WeatherForecast> {
    @Override
    public List<WeatherForecast> getAll() {
        Statement statement;
        List<WeatherForecast> weatherForecasts = new ArrayList<WeatherForecast>();
        try {
            WeatherForecast weatherForecast = null;
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecasts";
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                weatherForecast = new WeatherForecast(resultSet.getInt("WeatherForecastID"),
                        resultSet.getString("LocateID"),
                        resultSet.getTimestamp("CurrentTime"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
                weatherForecasts.add(weatherForecast);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecasts;
    }

    @Override
    public WeatherForecast getById(int id) {
        Statement statement;
        WeatherForecast weatherForecast = null;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecasts where WeatherForecastID = "+id;
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                weatherForecast = new WeatherForecast(resultSet.getInt("WeatherForecastID"),
                        resultSet.getString("LocateID"),
                        resultSet.getTimestamp("CurrentTime"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecast;
    }

    public List<WeatherForecast> getByLocateId(String locateId){
        Statement statement;
        List<WeatherForecast> weatherForecasts = new ArrayList<WeatherForecast>();
        try {
            WeatherForecast weatherForecast = null;
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecasts where LocateID = '"+locateId+"';";
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                int weatherForercastId = resultSet.getInt("WeatherForecastID");
                weatherForecast = new WeatherForecast(weatherForercastId,
                        resultSet.getString("LocateID"),
                        resultSet.getTimestamp("CurrentTime"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
                WeatherForecastAtATimeDao weatherForecastAtATimeDao = new WeatherForecastAtATimeDao();
                ArrayList<WeatherForecastAtATime> weatherForecastAtATimes =
                        (ArrayList<WeatherForecastAtATime>) weatherForecastAtATimeDao.getByWeatherForecastId(weatherForercastId);
                weatherForecast.setWeatherForecastAtATimes(weatherForecastAtATimes);
                weatherForecasts.add(weatherForecast);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecasts;
    }

    public WeatherForecast getLatestByLocateId(String locateId){
        Statement statement;
        List<WeatherForecast> weatherForecasts = new ArrayList<WeatherForecast>();
        try {
            WeatherForecast weatherForecast = null;
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecasts where LocateID = '"+locateId+"' order by WeatherForecastID desc limit 1;";
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                int weatherForercastId = resultSet.getInt("WeatherForecastID");
                weatherForecast = new WeatherForecast(weatherForercastId,
                        resultSet.getString("LocateID"),
                        resultSet.getTimestamp("CurrentTime"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
                WeatherForecastAtATimeDao weatherForecastAtATimeDao = new WeatherForecastAtATimeDao();
                ArrayList<WeatherForecastAtATime> weatherForecastAtATimes =
                        (ArrayList<WeatherForecastAtATime>) weatherForecastAtATimeDao.getByWeatherForecastId(weatherForercastId);
                weatherForecast.setWeatherForecastAtATimes(weatherForecastAtATimes);
                weatherForecasts.add(weatherForecast);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecasts.get(0);
    }

    @Override
    public int save(WeatherForecast weatherForecast) {
//        if (weatherForecast.getCurTime())
        System.out.println("weatherForecast SAve");
        System.out.println(weatherForecast.toString());
        int weatherForecastId=0;
        try {
            Timestamp currentTime = weatherForecast.getCurTime();
            System.out.println("WeatherForecastDao function save");
            System.out.println(currentTime);

//            currentTime = Timestamp.valueOf(LocalDateTime.now());
            String sql = "insert into WeatherForecasts (LocateID, CurrentTime, created_at, updated_at) values " +
                    "('"+weatherForecast.getLocateId()+"', ?, ?, ?)";
            PreparedStatement preparedStatement = dbConnector.getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            preparedStatement.setTimestamp(1, currentTime);
            preparedStatement.setTimestamp(2, created_at);
            preparedStatement.setTimestamp(3,null);

            preparedStatement.execute();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            while(resultSet.next()){
                weatherForecastId=resultSet.getInt(1);
                System.out.println("weatherForecastId");
                System.out.println(weatherForecastId);
            }
            preparedStatement.close();
            for(WeatherForecastAtATime wfat: weatherForecast.getWeatherForecastAtATimes()){
                wfat.setWeatherForecastId(weatherForecastId);
                WeatherForecastAtATimeDao weatherForecastAtATimeDao = new WeatherForecastAtATimeDao();
                weatherForecastAtATimeDao.save(wfat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void update(WeatherForecast t_old, WeatherForecast t_new) {
        System.out.println("WeatherForecast t_new - update");
        System.out.println(t_new.toString());
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            Integer weatherForecastId = t_new.getWeatherForecastId();
            String query = "UPDATE WeatherForecasts SET updated_at=? WHERE WeatherForecastID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            Timestamp update_at = new Timestamp(System.currentTimeMillis());
            preparedStatement.setTimestamp(1, update_at);
            preparedStatement.setInt(2, weatherForecastId);
            preparedStatement.executeUpdate();

            for(WeatherForecastAtATime wfat: t_new.getWeatherForecastAtATimes()){
                wfat.setWeatherForecastId(weatherForecastId);
                WeatherForecastAtATimeDao weatherForecastAtATimeDao = new WeatherForecastAtATimeDao();
                WeatherForecastAtATime tmp = new WeatherForecastAtATime();
                weatherForecastAtATimeDao.update(tmp, wfat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertOrUpdate(WeatherForecast weatherForecast) {
        if (weatherForecast.getCurTime() != null) {
            Connection connection = null;
            try {
                System.out.println("weatherForecast weatherForecast.toString()");
                System.out.println(weatherForecast.toString());
                connection = dbConnector.getConnection();
                String query = "select * from WeatherForecasts where LocateID=? && CurrentTime=? limit 1";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, weatherForecast.getLocateId());
                preparedStatement.setTimestamp(2, weatherForecast.getCurTime());
                ResultSet resultSet = preparedStatement.executeQuery();
                System.out.println("Before resultSet");

                int existData = 0;
                Integer weatherForecastID = 0;
                while(resultSet.next()){
                    existData = 1;
                    weatherForecastID = resultSet.getInt("WeatherForecastID");
                    break;
                }
                System.out.println("After resultSet");
                System.out.println("existData");
                System.out.println(existData);


                if (existData == 0) {
                    this.save(weatherForecast);
                } else {
                    weatherForecast.setWeatherForecastId(weatherForecastID);
                    WeatherForecast temp = new WeatherForecast();
                    this.update(temp, weatherForecast);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                if(connection!=null){
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            System.out.println("WeatherForecast is nul for insert");
        }

    }

    @Override
    public void delete(long id) {

    }
}
