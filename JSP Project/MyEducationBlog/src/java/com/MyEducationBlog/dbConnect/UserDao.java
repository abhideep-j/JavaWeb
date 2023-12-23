package com.MyEducationBlog.dbConnect;

import com.MyEducationBlog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                System.out.println("Saved");
                return true;
            }

        } catch (Exception e) {

        }
        return false;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {

            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
                user.setDatetime(rs.getTimestamp("date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean editUser(User user) {
        try {

            String query = "UPDATE user SET name=? , email=? , password=?, about =? ,profile=? where id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAbout());
            ps.setString(5, user.getProfile());
            ps.setInt(6, user.getId());
            
           int i= ps.executeUpdate();
            
            if(i>0){
            return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
