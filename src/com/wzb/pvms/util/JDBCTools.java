package com.wzb.pvms.util;

import java.sql.*;

public class JDBCTools {
    private static Connection connection=null;
    //数据库名称 dataSource_sims 按需修改
    private static String url = "jdbc:mysql://localhost:3306/db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Hongkong";
    private static String user = "root";
    private static String password = "";
    static{

        //加载驱动
        //因为只需，所以使用静态成员变量
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    public static Connection getConnection(){
        //获取连接
        try {
            connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(connection);
        return connection;
    }

    public static void release(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet){
       if(connection!=null){
           try {
               connection.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
       if(preparedStatement!=null){
           try {
               preparedStatement.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
       if(resultSet!=null){
           try {
               resultSet.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
    }
}
