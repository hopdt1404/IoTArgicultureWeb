package DAO;

import model.Device;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeviceDao implements Dao<Device> {
    @Override
    public List<Device> getAll() {
        Statement statement= null;
        List<Device> devices = new ArrayList<Device>();
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Devices";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                Device device = new Device(resultSet.getLong("DeviceID"),
                        resultSet.getInt("DeviceTypeID"),
                        resultSet.getString("DeviceName"),
                        resultSet.getInt("Status"),
                        resultSet.getInt("PlotID"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("FarmID")
                );
                devices.add(device);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return devices;
    }

    public List<Device> getByFarmId(Integer farmId){
        Statement statement= null;
        List<Device> devices = new ArrayList<Device>();
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Devices where PlotID in (select PlotID from Plots where FarmID = "+farmId+");";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                Device device = new Device(resultSet.getLong("DeviceID"),
                        resultSet.getInt("DeviceTypeID"),
                        resultSet.getString("DeviceName"),
                        resultSet.getInt("Status"),
                        resultSet.getInt("PlotID"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("FarmID")
                );
                devices.add(device);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return devices;
    }
    @Override
    public Device getById(int id) {
        Statement statement;
        Device device = null;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Devices where DeviceID = "+id+";";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                device = new Device(resultSet.getLong("DeviceID"),
                        resultSet.getInt("DeviceTypeID"),
                        resultSet.getString("DeviceName"),
                        resultSet.getInt("Status"),
                        resultSet.getInt("PlotID"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("FarmID")
                );
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return device;
    }

    public Device getById(Long id) {
        Statement statement;
        Device device = null;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Devices where DeviceID = "+id+";";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                device = new Device(resultSet.getLong("DeviceID"),
                        resultSet.getInt("DeviceTypeID"),
                        resultSet.getString("DeviceName"),
                        resultSet.getInt("Status"),
                        resultSet.getInt("PlotID"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("FarmID")
                );
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return device;
    }
    public Integer getPlotIdById(Long id) {
        Statement statement;
        Integer plotId=null;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select PlotID from Devices where DeviceID = "+id+";";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                plotId=resultSet.getInt("PlotID");
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        System.out.println("plotId - getPlotIdById: ");
//        System.out.println(plotId);
        return plotId;
    }
    @Override
    public int save(Device device) {
        try {
            Connection connection = dbConnector.getConnection();
            String query = "Insert into Devices (DeviceID, DeviceTypeID, DeviceName, Status, PlotID, user_id, FarmID)" +
                    " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, device.getDeviceID());
            preparedStatement.setInt(2, device.getDeviceTypeID());
            preparedStatement.setString(3, device.getDeviceName());
            preparedStatement.setInt(4, device.getStatus());
            preparedStatement.setLong(5, device.getPlotID());
            preparedStatement.setLong(6, device.getUserID());
            preparedStatement.setLong(7, device.getFarmID());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void update(Device t_old, Device t_new) {
        try {
            System.out.println("before update");
            Connection connection = dbConnector.getConnection();
            String query = "UPDATE Devices SET DeviceTypeID=?, DeviceName=?, Status=?, PlotID=?, user_id=?, FarmID=? WHERE DeviceID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, t_new.getDeviceTypeID());
            preparedStatement.setString(2, t_new.getDeviceName());
            preparedStatement.setInt(3, t_new.getStatus());
            preparedStatement.setLong(4, t_new.getPlotID());
            preparedStatement.setLong(5, t_new.getUserID());
            preparedStatement.setLong(6, t_new.getFarmID());
            preparedStatement.setLong(7, t_new.getDeviceID());

            System.out.println("After set value");
            System.out.println("device Old: " + t_old.toString());
            System.out.println("device new: " + t_new.toString());
            int rowsAffected = preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println(rowsAffected + " Rows affected.");
            System.out.println("Update device id: " + t_old.getDeviceID() + " was updated in DB with following details: " + t_new.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(long id) {

    }
    public List<Device> getDeviceByStatus(Integer status) {
        List<Device> devices = new ArrayList<Device>();
        Connection connection = null;
        try {
            System.out.println("before query");
            connection =  dbConnector.getConnection();
            String query = "select * from Devices where Status=?";
            System.out.println("status");
            System.out.println(status);
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Device device = new Device(resultSet.getLong("DeviceID"),
                        resultSet.getInt("DeviceTypeID"),
                        resultSet.getString("DeviceName"),
                        resultSet.getInt("Status"),
                        resultSet.getInt("PlotID"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("FarmID")
                );
                devices.add(device);
                System.out.println(resultSet.toString());
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
        return devices;
    }
}
