package com.wzb.pvms.repository;

import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class dpRepository {

    //添加项目信息
    public void add(int PNO,int DNO){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql = "insert into dp_r(PNO,DNO) values(?,?)";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,PNO);
            preparedStatement.setInt(2,DNO);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
    }
}
