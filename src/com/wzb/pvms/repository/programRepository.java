package com.wzb.pvms.repository;

import com.wzb.pvms.entity.brief;
import com.wzb.pvms.entity.program;
import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class programRepository {

    public List<program> findAll() {//查找并显示所有基本信息
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        List<program> list=new ArrayList<>();
        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select * from program";
            preparedStatement = connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();
            program pro=null;

            while(resultSet.next()){
                int PNO=resultSet.getInt(1);
                String PNAME=resultSet.getString(2);
                String PTYPE=resultSet.getString(3);
                String PTERM=resultSet.getString(4);
                String POWNER=resultSet.getString(5);
                String PFIRM=resultSet.getString(6);
                int PYEAR=resultSet.getInt(7);
                int PMONTH=resultSet.getInt(8);
                pro=new program(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH);
                list.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return list;
    }

    //获取简要信息，仅包括program的PNO, PNAME和designer的DNAME.
    public List<brief> findBrief(){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        List<brief> list=new ArrayList<>();

        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select pro.PNO,pro.PNAME,desi.DNAME from program pro ,dp_r dp ,designer desi where pro.PNO=dp.PNO and desi.DNO=dp.DNO";
            preparedStatement = connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();
            brief brief=null;

            while(resultSet.next()){
                int PNO=resultSet.getInt(1);
                String PNAME=resultSet.getString(2);
                String DNAME=resultSet.getString(3);
                brief=new brief(PNO,PNAME,DNAME);
                list.add(brief);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return list;

    }
    public program findByPNO(int pno){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        program pro=null;

        try {
            connection= JDBCTools.getConnection();
            System.out.println(connection);
            String sql = "select * from program where PNO=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,pno);
            resultSet=preparedStatement.executeQuery();

            while(resultSet.next()){
                int PNO=resultSet.getInt(1);
                String PNAME=resultSet.getString(2);
                String PTYPE=resultSet.getString(3);
                String PTERM=resultSet.getString(4);
                String POWNER=resultSet.getString(5);
                String PFIRM=resultSet.getString(6);
                int PYEAR=resultSet.getInt(7);
                int PMONTH=resultSet.getInt(8);
                pro=new program(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return pro;
    }

    //添加项目信息
    public void add(int PNO,String PNAME,String PTYPE,String PTERM,String POWNER,String PFIRM,int PYEAR,int PMONTH){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql = "insert into program(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH) values(?,?,?,?,?,?,?,?)";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,PNO);
            preparedStatement.setString(2,PNAME);
            preparedStatement.setString(3,PTYPE);
            preparedStatement.setString(4,PTERM);
            preparedStatement.setString(5,POWNER);
            preparedStatement.setString(6,PFIRM);
            preparedStatement.setInt(7,PYEAR);
            preparedStatement.setInt(8, PMONTH);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
    }
    public void deleteByID(int PNO){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection=JDBCTools.getConnection();
        String sql="delete from program where PNO=?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, PNO);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
    }

    public void updateByPNO(int PNO,String PNAME,String PTYPE,String PTERM,String POWNER,String PFIRM,int PYEAR,int PMONTH){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        connection = JDBCTools.getConnection();
        System.out.println(connection);
        String sql="update program set PNAME=?,PTYPE=?,PTERM=?,POWNER=?,PFIRM=?,PYEAR=?,PMONTH=? where PNO=?";
        //String sql = "insert into program(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH) values(?,?,?,?,?,?,?,?)";
        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,PNAME);
            preparedStatement.setString(2,PTYPE);
            preparedStatement.setString(3,PTERM);
            preparedStatement.setString(4,POWNER);
            preparedStatement.setString(5,PFIRM);
            preparedStatement.setInt(6,PYEAR);
            preparedStatement.setInt(7, PMONTH);
            preparedStatement.setInt(8,PNO);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,preparedStatement,null);
        }

    }

}
