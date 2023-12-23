package com.MyEducationBlog.dbConnect;

import com.MyEducationBlog.entities.Category;
import com.MyEducationBlog.entities.Posts;
import com.MyEducationBlog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

public class PostDao {

    Connection con = null;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<Category>();
        try {
            String query = "select * from categories";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("category_name");
                String description = rs.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public boolean savePost(Posts post) {
        try {
            String query = "insert into posts(cid,userid,ptitle,pcontent,pcode,ppic) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, post.getCid());
            ps.setInt(2, post.getUserId());
            ps.setString(3, post.getTitle());
            ps.setString(4, post.getContent());
            ps.setString(5, post.getCode());
            ps.setString(6, post.getPic());

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public ArrayList<Posts> getAllPosts() {
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            String query = "select * from posts order by pid desc";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int pid = rs.getInt("pid");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");

                String title = rs.getString("ptitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp time = rs.getTimestamp("regDate");

                Posts p = new Posts(cid, pid, userid, title, content, code, pic, time);

                list.add(p);
            }
            return list;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<Posts> getPostsByCatId(int id) {
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            String query = "select * from posts where cid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int pid = rs.getInt("pid");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");

                String title = rs.getString("ptitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp time = rs.getTimestamp("regDate");

                Posts p = new Posts(pid, userid, title, content, code, pic, time);

                list.add(p);

            }
            return list;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public Posts getPostByPid(int pid) {

        try {
            String query = "select * from posts where pid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int pidRec = rs.getInt("pid");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");

                String title = rs.getString("ptitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp time = rs.getTimestamp("regDate");

                Posts p = new Posts(cid, pidRec, userid, title, content, code, pic, time);

                return p;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
 
    public User getUserById(int id) {
        try {
            String query = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
              
                String name = rs.getString("name");
                

                User u = new User();
                u.setName(name);

                return u;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

}
