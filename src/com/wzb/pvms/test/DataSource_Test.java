package com.wzb.pvms.test;
import com.wzb.pvms.util.JDBCTools;

import java.sql.Connection;

public class DataSource_Test {
    public static void main(String[] args) {
        Connection connection= JDBCTools.getConnection();
        System.out.println(connection);
    }

}
