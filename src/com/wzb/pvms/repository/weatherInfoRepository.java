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

    //添加项目信息
    public int add(double LSRA_MJ,double LSRA_KWH,int BRA,double YMAT,double YHT,double YLT,
                    double HMMT, int MDFS,double AWS,double EWS,double ATD,int PC){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql = "insert into weather(LSRA_MJ,LSRA_KWH,BRA,YMAT,YHT,YLT,HMMT,MDFS,AWS,EWS,ATD,PC) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        int WNO=0;
        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setDouble(1,LSRA_MJ);
            preparedStatement.setDouble(2,LSRA_KWH);
            preparedStatement.setInt(3,BRA);
            preparedStatement.setDouble(4,YMAT);
            preparedStatement.setDouble(5,YHT);
            preparedStatement.setDouble(6,YLT);
            preparedStatement.setDouble(7,HMMT);
            preparedStatement.setInt(8,MDFS);
            preparedStatement.setDouble(9,AWS);
            preparedStatement.setDouble(10,EWS);
            preparedStatement.setDouble(11,ATD);
            preparedStatement.setInt(12,PC);

            preparedStatement.executeUpdate();
            WNO=this.find_last_insert_id();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
        return WNO;
    }

    //查询最新插入的id
    public int find_last_insert_id(){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        int WNO=0;

        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            //String sql = "select LAST_INSERT_ID() from weather";
            String sql = "select max(WNO) from weather";
            preparedStatement = connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();

            while(resultSet.next()){
                WNO=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return WNO;
    }

    public void updateByFNO(int WNO,double LSRA_MJ,double LSRA_KWH,int BRA,double YMAT,double YHT,double YLT,
                            double HMMT,int MDFS,double AWS,double EWS,double ATD,int PC){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql="update weather set LSRA_MJ=?,LSRA_KWH=?,BRA=?,YMAT=?,YHT=?,YLT=?,HMMT=?,MDFS=?,AWS=?,EWS=?,ATD=?,PC=? where WNO=?";
        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setDouble(1,LSRA_MJ);
            preparedStatement.setDouble(2,LSRA_KWH);
            preparedStatement.setInt(3,BRA);
            preparedStatement.setDouble(4,YMAT);
            preparedStatement.setDouble(5,YHT);
            preparedStatement.setDouble(6,YLT);
            preparedStatement.setDouble(7, HMMT);
            preparedStatement.setInt(8,MDFS);
            preparedStatement.setDouble(9,AWS);
            preparedStatement.setDouble(10,EWS);
            preparedStatement.setDouble(11,ATD);
            preparedStatement.setInt(12,PC);
            preparedStatement.setInt(13,WNO);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }

    }

}
