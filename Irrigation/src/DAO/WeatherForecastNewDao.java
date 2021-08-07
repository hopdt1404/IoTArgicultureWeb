package DAO;

import model.WeatherForeCastNew;

import java.sql.*;
import java.util.List;

public class WeatherForecastNewDao implements Dao<WeatherForeCastNew>{


    public List<WeatherForeCastNew> getAll() {
        return null;
    }

    public WeatherForeCastNew getById(int id) {
        return  null;
    }
    public WeatherForeCastNew getById(Long id) {
        return  null;
    }

    public int save(WeatherForeCastNew weatherForeCastNew) {
        Connection connection = null;
        Timestamp timestamp = null;
        try {
            if (weatherForeCastNew.getCreatedAt() == null) {
                timestamp = new Timestamp(System.currentTimeMillis());
                weatherForeCastNew.setCreatedAt(timestamp);
            }

            connection = dbConnector.getConnection();
            String query = "insert into weather_forecast (" +
                    "LocateID, " +
                    "ForecastTime, EpochTime," +
                    "ForecastStatus, " +
                    "IsDayLight, " +
                    "Temperature, " +
                    "WindSpeed, " +
                    "RelativeHumidity, " +
                    "RainProbability, " +
                    "PrecipitationProbability, " +
                    "RainValue, " +
                    "CloudCover, created_at, updated_at) " +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, weatherForeCastNew.getLocateId());
            preparedStatement.setTimestamp(2, weatherForeCastNew.getForecastTime());
            preparedStatement.setInt(3, weatherForeCastNew.getEpochTime());
            preparedStatement.setString(4, weatherForeCastNew.getForecastStatus());
            preparedStatement.setInt(5, weatherForeCastNew.getIsDayLight());
            preparedStatement.setDouble(6, weatherForeCastNew.getTemperature());
            preparedStatement.setDouble(7, weatherForeCastNew.getWindSpeed());
            preparedStatement.setDouble(8, weatherForeCastNew.getRelativeHumidity());
            preparedStatement.setInt(9, weatherForeCastNew.getRainProbability());
            preparedStatement.setInt(10, weatherForeCastNew.getPrecipitationProbability());
            preparedStatement.setDouble(11, weatherForeCastNew.getRainValue());
            preparedStatement.setInt(12, weatherForeCastNew.getCloudCover());
            preparedStatement.setTimestamp(13, weatherForeCastNew.getCreatedAt());
            preparedStatement.setTimestamp(14, weatherForeCastNew.getUpdatedAt());
            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return 0;
    }
    public void update(WeatherForeCastNew t_old, WeatherForeCastNew t_new) {
        Connection connection = null;
        try {
            System.out.println("ok");
            if (t_new.getUpdatedAt() == null) {
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                t_new.setUpdatedAt(timestamp);
            }
            connection = dbConnector.getConnection();
            String query = "UPDATE weather_forecast SET EpochTime=?, " +
                    "ForecastStatus=?, IsDayLight=?, Temperature=?, WindSpeed=?, " +
                    "RelativeHumidity=?, RainProbability=?, PrecipitationProbability=?, " +
                    "RainValue=?, CloudCover=?, updated_at=? " +
                    "WHERE id=? && ForecastTime=? && LocateID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, t_new.getEpochTime());
            preparedStatement.setString(2, t_new.getForecastStatus());
            preparedStatement.setInt(3, t_new.getIsDayLight());
            preparedStatement.setDouble(4, t_new.getTemperature());
            preparedStatement.setDouble(5, t_new.getWindSpeed());
            preparedStatement.setDouble(6, t_new.getRelativeHumidity());
            preparedStatement.setInt(7, t_new.getRainProbability());
            preparedStatement.setInt(8, t_new.getPrecipitationProbability());
            preparedStatement.setDouble(9, t_new.getRainValue());
            preparedStatement.setInt(10, t_new.getCloudCover());
            preparedStatement.setTimestamp(11, t_new.getUpdatedAt());
            preparedStatement.setLong(12, t_new.getId());
            preparedStatement.setTimestamp(13, t_new.getForecastTime());
            preparedStatement.setString(14, t_new.getLocateId());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertOrUpdate(WeatherForeCastNew weatherForeCastNew) {
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            if (weatherForeCastNew.getId() == null) {
                // create or update
                //1:  check exist
                // 2: exist => update
                // 3: not exit => save
                String query = "Select * from weather_forecast where LocateID=? && ForecastTime=? && EpochTime=? limit 1";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, weatherForeCastNew.getLocateId());
                preparedStatement.setTimestamp(2, weatherForeCastNew.getForecastTime());
                preparedStatement.setInt(3, weatherForeCastNew.getEpochTime());

                ResultSet resultSet = preparedStatement.executeQuery();
                int existData = 0;
                while (resultSet.next()) {
                    existData = 1;
                    weatherForeCastNew.setId(resultSet.getLong("id"));
                }

                if (existData == 0) {
                    this.save(weatherForeCastNew);
                } else {
                    WeatherForeCastNew temp  = new  WeatherForeCastNew();
                    this.update(temp, weatherForeCastNew);
                }

            } else {
                WeatherForeCastNew temp  = new  WeatherForeCastNew();
                this.update(temp, weatherForeCastNew);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


    }
    public void delete(long id){

    }
    public void delete(Long id){

    }
}

