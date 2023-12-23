package com.MyEducationBlog.dbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {

        try {
            String query = "insert into likes(pid,userid) values (?,?);";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);
            ps.setInt(2, uid);

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            String query = "select count(*) from likes where pid=?;";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        try {
            String query = "select * from likes where pid=? and uid=?;";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);
            ps.setInt(2, uid);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean deleteLike(int pid,int uid){
    try {
            String query = "delete  from likes where pid=? and uid=?;";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);
            ps.setInt(2, uid);

            int i = ps.executeUpdate();
            if(i> 0){
            return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return false;
    }

}
