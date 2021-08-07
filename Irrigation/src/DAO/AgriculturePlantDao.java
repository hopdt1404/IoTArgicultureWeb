package DAO;

import model.AgriculturePlant;
import model.Device;
import model.PlantDevice;
import org.apache.commons.net.ntp.TimeStamp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AgriculturePlantDao implements Dao<AgriculturePlant>{

    @Override
    public List<AgriculturePlant> getAll() {
        List<AgriculturePlant> agriculturePlants = new ArrayList<AgriculturePlant>();
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            String query = "select * from agriculture_plants";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                AgriculturePlant agriculturePlant = new AgriculturePlant(
                        resultSet.getLong("id"),
                        resultSet.getLong("plant_id"),
                        resultSet.getInt("plant_state_id"),
                        resultSet.getLong("FarmID"),
                        resultSet.getLong("user_id"),
                        resultSet.getInt("growth_period"),
                       resultSet.getFloat("temperature"),
                        resultSet.getFloat("moisture"),
                        resultSet.getString("light"),
                        resultSet.getString("note"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getString("created_user"),
                        resultSet.getTimestamp("updated_at"),
                        resultSet.getString("updated_user")
                );
                agriculturePlants.add(agriculturePlant);
                System.out.println(agriculturePlant.toString());
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
        return agriculturePlants;
    }

    @Override
    public AgriculturePlant getById(int id) {
        return null;
    }

    public AgriculturePlant getByPlantIdFarmIdPlanStateId(Long plantId, Long farmId, Integer plantStateId) {
        AgriculturePlant agriculturePlant = null;
        Connection connection = null;
        try {
            connection = dbConnector.getConnection();
            String query = "select * from agriculture_plants where plant_id=? && FarmID=? && plant_state_id=? limit 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, plantId);
            preparedStatement.setLong(2, farmId);
            preparedStatement.setInt(3, plantStateId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                agriculturePlant = new AgriculturePlant(
                        resultSet.getLong("id"),
                        resultSet.getLong("plant_id"),
                        resultSet.getInt("plant_state_id"),
                        resultSet.getLong("FarmID"),
                        resultSet.getLong("user_id"),
                        resultSet.getInt("growth_period"),
                        resultSet.getFloat("temperature"),
                        resultSet.getFloat("moisture"),
                        resultSet.getString("light"),
                        resultSet.getString("note"),
                        resultSet.getTimestamp("created_at"),
                        resultSet.getString("created_user"),
                        resultSet.getTimestamp("updated_at"),
                        resultSet.getString("created_user")
                );
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
        return agriculturePlant;
    }

    public AgriculturePlant getById(Long id) {
        return null;
    }

    public int save (AgriculturePlant agriculturePlant) {
      return  0;
    }

    @Override
    public void update(AgriculturePlant t_old, AgriculturePlant t_new) {

    }

    @Override
    public void delete(long id) {

    }


}
