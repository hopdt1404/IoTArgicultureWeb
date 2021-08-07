package DAO;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader;
import model.Device;
import model.Farm;
import model.Locate;

import java.sql.*;
import java.util.*;

public class LocateDao implements Dao<Locate> {
    @Override
    public List<Locate> getAll() {
        Statement statement= null;
        List<Locate> locates = new ArrayList<Locate>();
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Locates";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                Locate locate = new Locate(resultSet.getString("LocateID"),
                        resultSet.getString("LocateName")
                );
                locates.add(locate);
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
        return locates;
    }

    public List<Locate> getLocateFarms()
    {
        List<Locate> locates = new ArrayList<Locate>();
        Connection connection = null;
        try {
            System.out.println("before query");
            connection =  dbConnector.getConnection();
            String status = "null";
//            String query = "select Locates.*, Farms.id from Locates inner join Farms on Farms.LocateID = Locates.LocateID where Farms.Status is ?";
            String query = "select Locates.*, Farms.FarmID from Locates inner join Farms on Farms.LocateID = Locates.LocateID";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Locate locate = new Locate(resultSet.getString("LocateID"),
                        resultSet.getString("LocateName")
                );
                locates.add(locate);
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
//        FarmDao farmDao = new FarmDao();
//        List<Farm> farms = farmDao.getFarmByStatus("Null");
//        if (!farms.isEmpty()) {
//            List<String> locateIds = new ArrayList<>() ;
//            for (Farm farm:farms){
//                locateIds.add(farm.getLocateId());
//            }
//            // get LocateIDS
//            Connection connection = null;
//            System.out.println(locateIds);
//            try {
//                System.out.println("before query");
//                connection =  dbConnector.getConnection();
//                String query = "select * from Locates where LocateID in (?)";
//                PreparedStatement preparedStatement = connection.prepareStatement(query);
//                Array arraySql = connection.createArrayOf("varchar", locateIds.toArray());
//                preparedStatement.setArray(1, arraySql);
//                ResultSet resultSet = preparedStatement.executeQuery();
//                while (resultSet.next()){
//                    Locate locate = new Locate(resultSet.getString("LocateID"),
//                            resultSet.getString("LocateName")
//                    );
//                    locates.add(locate);
//                    System.out.println(resultSet.toString());
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }finally {
//                if(connection!=null){
//                    try {
//                        connection.close();
//                    } catch (SQLException e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        }

        return locates;


    }

    @Override
    public Locate getById(int id) {
        Statement statement;
        Locate locate = null;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "select * from Locates where LocateID = "+id+";";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                locate = new Locate(resultSet.getString("LocateID"),
                        resultSet.getString("LocateName")
                );
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return locate;
    }

    @Override
    public int save(Locate locate) {
        Statement statement;
        try {
            statement = dbConnector.getConnection().createStatement();
            String sql = "insert into Locates(LocateID, LocateName) values " +
                    "('"+locate.getLocateId()+"','"+locate.getLocate()+")";
            statement.executeUpdate(sql);
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void update(Locate t_old, Locate t_new) {

    }

    @Override
    public void delete(long id) {

    }
}
