<%@page import="com.MyEducationBlog.entities.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyEducationBlog.dbConnect.PostDao"%>
<%@page import="com.MyEducationBlog.helpers.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--bootstrap-->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                animation: wave 3s infinite;
                clip-path: polygon(30% 0, 68% 9%, 100% 0, 100% 84%, 68% 100%, 35% 93%, 0 100%, 0 12%);
            }
            @keyframes wave {
                0% {
                    clip-path: polygon(30% 0, 68% 7%, 100% 0, 100% 84%, 68% 100%, 35% 93%, 0 96%, 0 12%);
                }
                50% {
                    clip-path: polygon(33% 0, 68% 10%, 100% 0, 100% 80%, 68% 95%, 35% 99%, 0 100%, 0 0%);
                }
                100% {
                    clip-path: polygon(30% 0, 68% 7%, 100% 0, 100% 84%, 68% 100%, 35% 93%, 0 93%, 0 12%);
                }
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <div class="container-fluid p-0  m-0 primary-text-color" >
            <div class="jumbotron primary-background-2 banner-background">
                <div class="container">
                    <h3 class="display-3">
                        Welcome To Coding Block 
                    </h3>
                    <p>The fascinating thing about programming is its ability to transform ideas into tangible realities, empowering individuals to create anything from intricate algorithms to visually stunning applications.</p>
                    <p>Programming languages empower developers with concise tools to solve intricate problems elegantly. In just a few lines of code, they have the transformative ability to shape our daily digital experiences, showcasing the profound impact of well-crafted programming</p>
                    <a class="btn btn-outline-light primary-background btn-lg" href="register_page.jsp"><span class="fa fa-user-plus"></span>Start Now</a>
                    <a class="btn btn-outline-light primary-background btn-lg" href="login_page.jsp"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                </div>
            </div>

        </div>

        <!--cards-->
        <div class="container">
            <div class="row mb-2">
                <%
                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                ArrayList<Posts> list=   dao.getAllPosts();
                int i =0;
                for(Posts p : list){
                
                %>
                <%
                if(i==3){
                %>
                      <div class="row mb-2">
                  <%    
                }
                %>
                
                <div class="col-md-4" Style="margin-top: 20px">
                    <div class="card">
                        <div class="card-body">
                            <img class="card-img-top my-2" src="blog_pics/<%= p.getPic()%>" alt="Card image cap">
                            <h5 class="card-title"><%=  p.getTitle()   %></h5>
                            <p class="card-text"> <%= p.getContent().substring(0, 200) %> </p>
                             <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light primary-background btn-sm text-white">Read More</a>
                        </div>
                    </div>
                </div>
                             <%
                if(i==3){
                %>
                      </div>
                  <%
                      i=0;
                }
                %>
                            
                   
                <%
                i++;
                    }
                %>
                
                
                
                
        </div>

        </div>>




        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/newjavascript.js" type="text/javascript"></script>

        <!--        <script>
                    $(document).ready( function (){
                        alert("doc ready")
                    })
                </script>-->
    </body>
</html>
