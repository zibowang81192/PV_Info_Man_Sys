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
}
