<%-- 
    Document   : error_page
    Created on : 20 Dec, 2023, 7:38:10 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something went Wrong</title>
        
        
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
        <div class="container text-center">
            
            <image src="img/computer.png" class="img-fluid">
            <h3>Sorry!  Something went wrong ...</h3>
            <%--<%= exception %>--%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
            
        </div>
        
    </body>
</html>
