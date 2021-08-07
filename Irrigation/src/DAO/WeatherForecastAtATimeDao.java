package DAO;

import model.WeatherForecastAtATime;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WeatherForecastAtATimeDao implements Dao<WeatherForecastAtATime> {
    @Override
    public List<WeatherForecastAtATime> getAll() {
        Statement statement;
        List<WeatherForecastAtATime> weatherForecastAtATimes = new ArrayList<WeatherForecastAtATime>();
        try {
            WeatherForecastAtATime weatherForecastAtATime = null;
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecastAtATimes";
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                weatherForecastAtATime = new WeatherForecastAtATime(
                        resultSet.getInt("WeatherForecastID"),
                        resultSet.getTimestamp("ForecastTime"),
                        resultSet.getLong("EpochTime"),
                        resultSet.getString("ForecastStatus"),
                        resultSet.getBoolean("IsDayLight"),
                        resultSet.getFloat("Temperature"),
                        resultSet.getFloat("WindSpeed"),
                        resultSet.getFloat("RelativeHumidity"),
                        resultSet.getByte("RainProbability"),
                        resultSet.getByte("PrecipitationProbability"),
                        resultSet.getFloat("RainValue"),
                        resultSet.getByte("CloudCover"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
                weatherForecastAtATimes.add(weatherForecastAtATime);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecastAtATimes;
    }

    @Override
    public WeatherForecastAtATime getById(int id) {
        return null;
    }


    public List<WeatherForecastAtATime> getByWeatherForecastId(int id) {
        Statement statement;
        List<WeatherForecastAtATime> weatherForecastAtATimes = new ArrayList<WeatherForecastAtATime>();
        try {
            WeatherForecastAtATime weatherForecastAtATime = null;
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from WeatherForecastAtATimes where WeatherForecastID = "+id;
            ResultSet resultSet= statement.executeQuery(sql);
            while(resultSet.next()){
                weatherForecastAtATime = new WeatherForecastAtATime(
                        resultSet.getInt("WeatherForecastID"),
                        resultSet.getTimestamp("ForecastTime"),
                        resultSet.getLong("EpochTime"),
                        resultSet.getString("ForecastStatus"),
                        resultSet.getBoolean("IsDayLight"),
                        resultSet.getFloat("Temperature"),
                        resultSet.getFloat("WindSpeed"),
                        resultSet.getFloat("RelativeHumidity"),
                        resultSet.getByte("RainProbability"),
                        resultSet.getByte("PrecipitationProbability"),
                        resultSet.getFloat("RainValue"),
                        resultSet.getByte("CloudCover"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getTimestamp("updated_at")
                );
                weatherForecastAtATimes.add(weatherForecastAtATime);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherForecastAtATimes;
    }



    @Override
    public int save(WeatherForecastAtATime weatherForecastAtATime) {
        try {
            String sql = "insert into WeatherForecastAtATimes (" +
                    "WeatherForecastID, " +
                    "ForecastTime, " +
                    "EpochTime, " +
                    "ForecastStatus, " +
                    "IsDayLight, " +
                    "Temperature, " +
                    "WindSpeed, " +
                    "RelativeHumidity, " +
                    "RainProbability, " +
                    "PrecipitationProbability, " +
                    "RainValue, " +
                    "CloudCover) " +
                    "values " +
                    "("+weatherForecastAtATime.getWeatherForecastId()+","+
                    "?,"+
                    weatherForecastAtATime.getEpochDataTime()+","+
                    "'"+weatherForecastAtATime.getForecastStatus()+"'"+","+
                    weatherForecastAtATime.getDaylight()+","+
                    weatherForecastAtATime.getTemperature()+","+
                    weatherForecastAtATime.getWindSpeed()+","+
                    weatherForecastAtATime.getRelativeHumidity()+","+
                    weatherForecastAtATime.getRainProbability()+","+
                    weatherForecastAtATime.getPrecipitationProbability()+","+
                    weatherForecastAtATime.getRainValue()+","+
                    weatherForecastAtATime.getCloudCover()
                    +")";
            PreparedStatement preparedStatement = dbConnector.getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            Timestamp forecastTime = new Timestamp(weatherForecastAtATime.getDateTime().getTime());
            preparedStatement.setTimestamp(1,forecastTime);
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void update(WeatherForecastAtATime t_old, WeatherForecastAtATime t_new) {
// check if exist
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            String query = "UPDATE WeatherForecastAtATimes SET EpochTime=?, " +
                    "ForecastStatus=?, IsDayLight=?, Temperature=?, WindSpeed=?, " +
                    "RelativeHumidity=?, RainProbability=?, PrecipitationProbability=?, " +
                    "RainValue=?, CloudCover=?, updated_at=? " +
                    "WHERE WeatherForecastID=? && ForecastTime=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, t_new.getEpochDataTime());
            preparedStatement.setString(2, t_new.getForecastStatus());
            preparedStatement.setBoolean(3, t_new.getDaylight());
            preparedStatement.setFloat(4, t_new.getTemperature());
            preparedStatement.setFloat(5, t_new.getWindSpeed());
            preparedStatement.setFloat(6, t_new.getRelativeHumidity());
            preparedStatement.setByte(7, t_new.getRainProbability());
            preparedStatement.setByte(8, t_new.getPrecipitationProbability());
            preparedStatement.setByte(9, t_new.getRainProbability());
            preparedStatement.setByte(10, t_new.getCloudCover());
            preparedStatement.setTimestamp(11, t_new.getUpdatedAt());
            preparedStatement.setInt(12, t_new.getWeatherForecastId());
            preparedStatement.setTimestamp(13, t_new.getDateTime());
            int rowsAffected = preparedStatement.executeUpdate();
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

    @Override
    public void delete(long id) {

    }
}
