package vn.edu.giadinh.tasksmanagement;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;

public class Main {
    public static void main(String[] args) {
        try{
            Driver driver = new Driver();
            DriverManager.registerDriver(driver);
            String url = "jdbc:mysql://localhost:3306/task_manager";
            String user = "root";
            String password = "123456";
            Connection con = DriverManager.getConnection(url, user, password);
            con.close();
            System.out.println("done");        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
