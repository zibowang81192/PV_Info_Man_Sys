package com.wzb.pvms.repository;

import com.wzb.pvms.entity.program;
import com.wzb.pvms.entity.site_factory;
import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class siteRepository {
    public List<site_factory> findAll() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        List<site_factory> list = new ArrayList<>();
        try {
            connection = JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select * from site_factory";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            site_factory site = null;

            while (resultSet.next()) {
                int FNO = resultSet.getInt(1);
                String LOC = resultSet.getString(2);
                String FCHARACTER = resultSet.getString(3);
                String PROVINCE = resultSet.getString(4);
                String CITY = resultSet.getString(5);
                String COUNTRY = resultSet.getString(6);
                double CAPACITY = resultSet.getDouble(7);
                double AREA = resultSet.getDouble(8);
                int ALTITUDE_MAX = resultSet.getInt(9);
                int ALTITUDE_MIN = resultSet.getInt(10);
                double LONGITUDE = resultSet.getDouble(11);
                String LONGITUDE_REOW = resultSet.getString(12);
                double LATITUDE = resultSet.getDouble(13);
                String LATITUDE_NORS = resultSet.getString(14);


              /*  int PNO=resultSet.getInt(1);
                String PNAME=resultSet.getString(2);
                String PTYPE=resultSet.getString(3);
                String PTERM=resultSet.getString(4);
                String POWNER=resultSet.getString(5);
                String PFIRM=resultSet.getString(6);
                int PYEAR=resultSet.getInt(7);
                int PMONTH=resultSet.getInt(8);
                pro=new program(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH);
                list.add(pro);*/

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, preparedStatement, resultSet);
        }
        return list;

    }

    public site_factory findByPNO(int pno) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        site_factory site = null;

        try {
            connection = JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select * from site_factory site,ps_r ps where ps.PNO=? and ps.FNO=site.FNO";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, pno);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int FNO = resultSet.getInt(1);
                String LOC = resultSet.getString(2);
                String FCHARACTER = resultSet.getString(3);
                String PROVINCE = resultSet.getString(4);
                String CITY = resultSet.getString(5);
                String COUNTRY = resultSet.getString(6);
                double CAPACITY = resultSet.getDouble(7);
                double AREA = resultSet.getDouble(8);
                int ALTITUDE_MAX = resultSet.getInt(9);
                int ALTITUDE_MIN = resultSet.getInt(10);
                double LONGITUDE = resultSet.getDouble(11);
                String LONGITUDE_EORW = resultSet.getString(12);
                double LATITUDE = resultSet.getDouble(13);
                String LATITUDE_NORS = resultSet.getString(14);
                site = new site_factory(FNO, LOC, FCHARACTER, PROVINCE, CITY, COUNTRY, CAPACITY, AREA, ALTITUDE_MAX, ALTITUDE_MIN,
                        LONGITUDE, LONGITUDE_EORW, LATITUDE, LATITUDE_NORS);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, preparedStatement, resultSet);
        }
        return site;

    }

    //添加项目信息
    public int add(String LOC,String FCHARACTER,String PROVINCE,String CITY,String COUNTRY,double CAPACITY,double AREA,
                    int ALTITUDE_MAX,int ALTITUDE_MIN,double LONGITUDE,String LONGITUDE_EORW,double LATITUDE,String LATITUDE_NORS){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql = "insert into site_factory(LOC,FCHARACTER,PROVINCE,CITY,COUNTRY,CAPACITY,AREA,ALTITUDE_MAX,ALTITUDE_MIN,LONGITUDE,LONGITUDE_EORW,LATITUDE,LATITUDE_NORS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int FNO=0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //preparedStatement.setInt(1,FNO);//在数据库中自增
            preparedStatement.setString(1,LOC);
            preparedStatement.setString(2,FCHARACTER);
            preparedStatement.setString(3,PROVINCE);
            preparedStatement.setString(4,CITY);
            preparedStatement.setString(5,COUNTRY);
            preparedStatement.setDouble(6,CAPACITY);
            preparedStatement.setDouble(7,AREA);
            preparedStatement.setInt(8,ALTITUDE_MAX);
            preparedStatement.setInt(9,ALTITUDE_MIN);
            preparedStatement.setDouble(10,LONGITUDE);
            preparedStatement.setString(11,LONGITUDE_EORW);
            preparedStatement.setDouble(12,LATITUDE);
            preparedStatement.setString(13,LATITUDE_NORS);

//            preparedStatement.setInt(1,PNO);
//            preparedStatement.setString(2,PNAME);
//            preparedStatement.setString(3,PTYPE);
//            preparedStatement.setString(4,PTERM);
//            preparedStatement.setString(5,POWNER);
//            preparedStatement.setString(6,PFIRM);
//            preparedStatement.setInt(7,PYEAR);
//            preparedStatement.setInt(8, PMONTH);
            preparedStatement.executeUpdate();
            FNO=this.find_last_insert_id();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
        return FNO;
    }

    //查询最新插入的id
    public int find_last_insert_id(){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        int FNO=0;


        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            //String sql = "select LAST_INSERT_ID() from site_factory";
            String sql = "select max(FNO) from site_factory";
            preparedStatement = connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();

            while(resultSet.next()){
                FNO=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return FNO;
    }

    public void updateByFNO(int FNO,String LOC,String FCHARACTER,String PROVINCE,String CITY,
                            String COUNTRY,double CAPACITY,double AREA,int ALTITUDE_MAX,int ALTITUDE_MIN,double LONGITUDE,String LONGITUDE_EORW,double LATITUDE,String LATITUDE_NORS){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql="update site_factory set LOC=?,FCHARACTER=?,PROVINCE=?,CITY=?,COUNTRY=?,CAPACITY=?,AREA=?,ALTITUDE_MAX=?,ALTITUDE_MIN=?,LONGITUDE=?,LONGITUDE_EORW=?,LATITUDE=?,LATITUDE_NORS=? where FNO=?";
        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,LOC);
            preparedStatement.setString(2,FCHARACTER);
            preparedStatement.setString(3,PROVINCE);
            preparedStatement.setString(4,CITY);
            preparedStatement.setString(5,COUNTRY);
            preparedStatement.setDouble(6,CAPACITY);
            preparedStatement.setDouble(7, AREA);
            preparedStatement.setInt(8,ALTITUDE_MAX);
            preparedStatement.setInt(9,ALTITUDE_MIN);
            preparedStatement.setDouble(10,LONGITUDE);
            preparedStatement.setString(11,LONGITUDE_EORW);
            preparedStatement.setDouble(12,LATITUDE);
            preparedStatement.setString(13,LATITUDE_NORS);
            preparedStatement.setInt(14,FNO);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }

    }

}
