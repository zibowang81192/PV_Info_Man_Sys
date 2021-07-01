package com.wzb.pvms.repository;

import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class designerRepository {
    //添加项目信息
    public int add(String DNAME){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql = "insert into designer(DNAME) values(?)";
        int DNO=0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,DNAME);
            preparedStatement.executeUpdate();

            DNO=this.find_last_insert_id();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
        return DNO;
    }
    //查询最新插入的id
    public int find_last_insert_id(){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        int DNO=0;

        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            //String sql = "select LAST_INSERT_ID() from designer";
            String sql = "select max(DNO) from designer";
            preparedStatement = connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();

            while(resultSet.next()){
                DNO=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return DNO;
    }

}
