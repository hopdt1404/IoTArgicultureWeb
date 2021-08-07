package DAO;

import model.AgriculturePlant;
import model.PlantDevice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PlantDeviceDao implements Dao<PlantDevice>{

    public List<PlantDevice> getAll() {
        return null;
    }
    @Override
    public PlantDevice getById(int id) {
        return null;
    }

    public PlantDevice getById(Long id) {
        return null;
    }

    public PlantDevice getByFarmIDAndDeviceID(Long FarmID, Long DeviceID) {
        Connection connection = null;
        PlantDevice plantDevice = null;
        try {
            connection = dbConnector.getConnection();
            String query = "select * from plant_devices where FarmID=? && DeviceID=? limit 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, FarmID);
            preparedStatement.setLong(2, DeviceID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                plantDevice = new PlantDevice(
                        resultSet.getLong("id"),
                        resultSet.getLong("plant_id"),
                        resultSet.getLong("DeviceID"),
                        resultSet.getLong("FarmID"),
                        resultSet.getInt("status"),
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
        return plantDevice;
    }

    public int save (PlantDevice plantDevice) {
        return  0;
    }

    @Override
    public void update(PlantDevice t_old, PlantDevice t_new) {

    }

    @Override
    public void delete(long id) {

    }

}
