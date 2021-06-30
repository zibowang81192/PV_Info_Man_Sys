package com.wzb.pvms.repository;

import com.wzb.pvms.entity.site_factory;
import com.wzb.pvms.entity.weather;
import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class weatherInfoRepository {
    public weather findByFNO(int fno) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        weather weather = null;

        try {
            connection = JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select * from weather wea,sw_r sw where sw.FNO=? and sw.WNO=wea.WNO";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,fno);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int WNO=resultSet.getInt(1);
                double LSRA_MJ=resultSet.getDouble(2);
                double LSRA_KWH=resultSet.getDouble(3);
                int BRA=resultSet.getInt(4);
                double YMAT=resultSet.getDouble(5);
                double YHT=resultSet.getDouble(6);
                double YLT=resultSet.getDouble(7);
                double HMMT=resultSet.getDouble(8);
                int MDFS=resultSet.getInt(9);
                double AWS=resultSet.getDouble(10);
                double EWS=resultSet.getDouble(11);
                double ATD=resultSet.getDouble(12);
                int PC=resultSet.getInt(13);
                weather=new weather(WNO,LSRA_MJ,LSRA_KWH,BRA,YMAT,YHT,YLT
                ,HMMT,MDFS,AWS,EWS,ATD,PC);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, preparedStatement, resultSet);
        }
        return weather;

    }
}
