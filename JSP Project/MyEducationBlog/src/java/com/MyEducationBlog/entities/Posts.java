
package com.MyEducationBlog.entities;

import java.sql.Timestamp;


public class Posts {
    private int cid ;
    private int pid ;
    private int userId ;
    private String title ;
    private String content ;
    private String code ;
    private String pic ;
    private Timestamp datetime;
    

    public Posts() {
    }

    public Posts(int cid, int pid, int userId, String title, String content, String code, String pic) {
        this.cid = cid;
        this.pid = pid;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.datetime = datetime;
    }
    public Posts(int cid, int pid, int userId, String title, String content, String code, String pic, Timestamp datetime) {
        this.cid = cid;
        this.pid = pid;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.datetime = datetime;
    }
    public Posts( int pid, int userId, String title, String content, String code, String pic, Timestamp datetime) {
        this.cid = cid;
        this.pid = pid;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.datetime = datetime;
    }

    public Posts(int cid, int userId, String title, String content, String code, String pic) {
        this.cid = cid;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.datetime = datetime;
    }

    public Posts(String title, String content, String code, String pic) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.datetime = datetime;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }
    
    

    
    
    

}
