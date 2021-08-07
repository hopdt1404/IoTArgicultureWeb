package DAO;

import model.AgriculturePlant;
import model.Farm;
import model.FarmPlant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FarmPlantDao implements Dao<FarmPlant>{
    @Override
    public List<FarmPlant> getAll() {
        return  null;
    }

    @Override
    public FarmPlant getById(int id) {
        return null;
    }
    public FarmPlant getById(Long id) {
        return null;
    }

    public List<FarmPlant> getByFarmId(Long farmId) {
        List<FarmPlant> farmPlants = new ArrayList<FarmPlant>();
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            String query = "select * from farm_plants where FarmID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, farmId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                FarmPlant farmPlant = new FarmPlant(
                        resultSet.getLong("id"),
                        resultSet.getLong("FarmID"),
                        resultSet.getLong("plant_id"),
                        resultSet.getLong("user_id"),
                        resultSet.getTimestamp("start_time_season"),
                        resultSet.getTimestamp("end_time_season"),
                        resultSet.getInt("current_plant_state"),
                        resultSet.getInt("current_growth_day"),
                        resultSet.getInt("total_growth_day"),
                        resultSet.getInt("status"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getString("created_user"),
                        resultSet.getTimestamp("updated_at"),
                        resultSet.getString("updated_user")
                );
                farmPlants.add(farmPlant);
                farmPlant.toString();
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

        return farmPlants;
    }
    public FarmPlant getByFarmIdAndPlantID(Long farmId, Long plantId) {
        FarmPlant farmPlant = null;
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            String query = "select * from farm_plants where FarmID=? && plant_id=? limit 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, farmId);
            preparedStatement.setLong(2, plantId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                farmPlant = new FarmPlant(
                        resultSet.getLong("id"),
                        resultSet.getLong("FarmID"),
                        resultSet.getLong("plant_id"),
                        resultSet.getLong("user_id"),
                        resultSet.getTimestamp("start_time_season"),
                        resultSet.getTimestamp("end_time_season"),
                        resultSet.getInt("current_plant_state"),
                        resultSet.getInt("current_growth_day"),
                        resultSet.getInt("total_growth_day"),
                        resultSet.getInt("status"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getString("created_user"),
                        resultSet.getTimestamp("updated_at"),
                        resultSet.getString("updated_user")
                );
                System.out.println(farmPlant.toString());
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

        return farmPlant;
    }

    @Override
    public int save(FarmPlant farmPlant) {
        return 0;
    }

    @Override
    public void update(FarmPlant t_old, FarmPlant t_new) {

    }

    @Override
    public void delete(long id) {

    }
    public void delete(Long id) {

    }
}
