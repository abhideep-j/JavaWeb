<%-- 
    Document   : register_page
    Created on : 20 Dec, 2023, 1:04:12 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
             .banner-background{
              
            }
        </style>
    </head>
    <body>
        <%@include  file="normal_navbar.jsp" %>
        <main class="primary-background banner-background">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-circle fa-3x"></span><br>Register Here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="reg-form">

                                <div class="form-group">
                                    <label for="user_name">Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>



                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="Male"> Male
                                    <input type="radio" id="gender" name="gender"  value="Female"> Female

                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" name="user_about"  id="" cols="10" rows="5"placeholder="Something about you"></textarea>
                                </div>



                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
                                </div>

                                <div class="container text-center" id="loader" style="display: none"> <span class="	fa fa-refresh fa-3x"></span>
                                    <h4>Please Wait...</h4></div>
                                <div>

                                    <br>
                                    <button type="submit" class="btn btn-primary" id="submit-button">Submit</button>
                            </form>
                        </div>

                    </div>




                </div>
            </div>

        </main>




        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/newjavascript.js" type="text/javascript"></script>



        <script>
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();

                let form = new FormData(this);

                $('#submit-button').hide();
                $('#loader').show();

                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#submit-button').show();
                        $('#loader').hide();

                        if (data.trim() === 'done') {
                            swal("Registered Successfully.. We are redirecting you to Login Page")
                                    .then((value) => {
                                        window.location = "login_page.jsp";
                                    });
                        } else {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        swal("Something went Wrong");
                        $('#submit-button').show();
                        $('#loader').hide();
                    },
                    processData: false,
                    contentType: false
                });
            });
        </script>



    </body>
</html>
