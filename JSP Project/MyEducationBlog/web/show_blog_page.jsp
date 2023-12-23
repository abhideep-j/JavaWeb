

<%@page import="com.MyEducationBlog.dbConnect.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyEducationBlog.entities.Category"%>
<%@page import="com.MyEducationBlog.entities.Category"%>
<%@page import="com.MyEducationBlog.entities.Posts"%>
<%@page import="com.MyEducationBlog.helpers.ConnectionProvider"%>

<%@page import="com.MyEducationBlog.dbConnect.PostDao"%>
<%@page import="com.MyEducationBlog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>



<%

    User user = (User) request.getSession().getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<% int pid = Integer.parseInt(request.getParameter("post_id"));

    PostDao pd = new PostDao(ConnectionProvider.getConnection());

    Posts p = pd.getPostByPid(pid);

    User u = pd.getUserById(p.getUserId());

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle()%> || Code Block By Abhideep</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <style>

            .banner-background{

                clip-path: polygon(30% 0, 68% 9%, 100% 0, 100% 84%, 68% 100%, 35% 93%, 0 100%, 0 12%);
            }

            .custom-card {
                /* Adjust the desired width for the card */
                max-width: 1500px;
                margin: 0 auto; /* Center the card horizontally */
            }
            .post-title{
                font-weight: 100;
                font-size: 30px; 
            }
            .post-content{
                font-weight: 110;
                font-size: 25;  
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20; 
                font-weight: 300;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding: 15px;
            }

            body {
                background: url(img/patti.png);
                background-size: cover;
                background-attachment: fixed;

            }

        </style>
        
        
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="DUwiCYqK"></script>

        
</head>
<body>
    <!--navbar--> 

    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Coding Block</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="	fa fa-bell-o"></span>Learn CS with Abhideep <span class="sr-only">(current)</span></a>
                </li>
<!--                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#"> Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure</a>
                    </div>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="	fa fa-user-o"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#add-post-modal"><span class="	fa fa-edit"></span>Add Post</a>
                </li>


            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#profileModal"><span class="	fa fa-user"></span><%= user.getName()%></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="	fa fa-user-times"></span>Log Out</a>
                </li>
            </ul>
        </div>
    </nav>




    <!--navbar Ends--> 

    <!--MAIN cONTENT OF bODY-->

    <div class="container  primary-background-2">


        <div class="row my-4 row-user">

            <div class="col-md-8 offset-md-2">
                <div class="card custom-card ">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%=  p.getTitle()%></h4>
                    </div>


                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getPic()%>" alt="Card image cap">

                        <div class="row my-3">
                            <div class="col-md-8"><p class="post-user-info"><a href="#"><%=  u.getName().trim()%> </a>has posted this page</p></div>
                            <div class="col-md-4"><p class="post-date"><%= p.getDatetime().toLocaleString()%></p></div>
                        </div>
                        <p class="post-content"><%=  p.getContent()%></p>
                        <br>
                        <br>
                        <div class="post-code">
                            <pre class="jumbotron"> <%= p.getCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer text-center primary-background">

                        <%
                            LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
                        %>


                        <a href="#!" class="btn btn-outline-light btn-sm text-white " onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)"><i class="fa fa-thumbs-up"></i><span class="like-counter"><%= dao.countLikeOnPost(p.getPid())%></span> </a>
                        <a href="#!" class="btn btn-outline-light btn-sm text-white"><i class="fa fa-commenting-o"></i><span></span> </a>
                    </div>
                    <div class="card-footer">
    <div class="fb-comments" data-href="http://localhost:9494/MyEducationBlog/show_blog_page.jsp?post_id=4" data-width="" data-numposts="100"></div>
</div>
                </div>


            </div>








        </div>



    </div>









    <!--END OF MAIN cONTENT OF bODY-->





    <!--profile modal-->

    <!-- Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white ">
                    <h5 class="modal-title" id="exampleModalLabel">Coding Blocks
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
                        <h5 class="modal-title mt-3"><%= user.getName()%></h5>

                        <!--// details--> 
                        <div id="profile-detail">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered On:</th>
                                        <td><%= user.getDatetime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--profile edit-->
                        <div id="profile-edit" style="display: none;">

                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><input type="email" class="form-control" value="<%= user.getEmail()%>" name ="user_email"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Name:</th>
                                        <td><input type="text" class="form-control" value="<%= user.getName()%>" name ="user_name"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password:</th>
                                        <td><input type="text" class="form-control" value="<%= user.getPassword()%>" name ="password"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender().toUpperCase()%><td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><textarea name="user_about" rows="3" cols="35"><%= user.getAbout()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Select Picture</th>
                                        <td><input type="file" class="form-control" name ="image" accept="image/*"></td>
                                    </tr>
                                </table>
                                <div class="container text-center"><button class="btn btn-outline-primary">Save</button></div>
                            </form>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary primary-background" id="edit-profile-button">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--end profile modal-->

    <!--add post modal-->

    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content primary-background-2 ">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Add Post Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="AddPostServlet" id="addpostform" method="POST" enctype="multipart/form-data">



                        <div class="form-group primary-background-2">
                            <select class="form-control"  name="cid">
                                <option selected disabled="">
                                    ---Select Category---
                                </option>
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCid()%>">
                                    <%=  c.getName()%>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>



                        <div class="form-group">
                            <input type="text" placeholder="Enter post Title" name="pTitle" Class="form-control">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" Style="height: 200px"  name="pContent" placeholder="Enter Your Content"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" Style="height: 200px" name="pCode" placeholder="Enter Your Program Code(if Any)"></textarea>
                        </div>

                        <div class="form-group">
                            <label>Select Your Picture ...</label>
                            <br>
                            <input type="file" accept="image/*" name="pic">
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary"><span id="paper-plane-icon" class="fa fa-paper-plane-o"></span>&nbsp;Post</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>




    <!--end post modal-->




    <!--javascripts-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/newjavascript.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>





    <script>

                            $(document).ready(function () {
                                let editStatus = false;
                                $("#edit-profile-button").click(function () {

                                    if (editStatus) {
                                        $("#profile-detail").show();
                                        $("#profile-edit").hide();
                                        editStatus = false;
                                        $(this).text("Edit")

                                    } else {
                                        $("#profile-detail").hide();
                                        $("#profile-edit").show();
                                        editStatus = true;
                                        $(this).text("Back")
                                    }



                                })
                            });



    </script>

    <!--post form--> 
    <script>
        function showPostMEnu() {
            event.preventDefault();

            let form = new FormData(this);

            $.ajax({
                url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() == 'Posted')
                        swal("Good job!", "Posted Successfully!", "success");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    swal("Error!", "Something Went Wrong!", "error");

                },
                processData: false,
                contentType: false
            });


        }


        $("#addpostform").on("submit", function (event) {
            showPostMEnu();
        });




    </script>
    <script>
        function shakeIcon() {
            var icon = document.getElementById('paper-plane-icon');
            icon.classList.add('shake');

            setTimeout(function () {
                icon.classList.remove('shake');
            }, 500); // Adjust the duration of the shake animation here
        }

        setInterval(shakeIcon, 3000); // Repeat every 3 seconds
    </script>

    <!--loadiung  post using ajax-->
    <script>
        function getPosts(catId, temp) {
            $("#loader").show();
            $("#post-container").hide();
            $(".c-link").removeClass('active')




            $.ajax({
                url: "load_post.jsp",
                data: {cid: catId},
                method: 'POST',
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#post-container").show();
                    $("#loader").hide();
                    $("#post-container").html(data);
                    $(temp).addClass('active');
                }
            });
        }


        $(document).ready(function (e) {
            let allpostref = $('.c-link')[0]
            getPosts(0, allpostref);

        });
    </script>



</body>
</html>
