<%@page import="com.MyEducationBlog.entities.User"%>
<%@page import="com.MyEducationBlog.dbConnect.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyEducationBlog.entities.Posts"%>
<%@page import="com.MyEducationBlog.entities.Posts"%>
<%@page import="com.MyEducationBlog.dbConnect.PostDao"%>
<%@page import="com.MyEducationBlog.helpers.ConnectionProvider"%>
<div class="row">
    <% 

        PostDao pd = new PostDao(ConnectionProvider.getConnection());



        User user = (User) request.getSession().getAttribute("currentuser");


    %>


    <%        Thread.sleep(1000);

        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Posts> list = new ArrayList<Posts>();
        if (cid == 0) {
            list = pd.getAllPosts();
        } else {
            list = pd.getPostsByCatId(cid);
        }

        if (list.size() == 0) {
    %>
    <div class="col-md-12">
        <h3>No Post Found... Please Add More Posts</h3>
    </div>
    <%
        }

        for (Posts p : list) {
    %>
    <div class="col-md-6">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getPic()%>" alt="Card image cap">
            <div class="card-body" style="height: 150px; overflow: hidden;">
                <b><%= p.getTitle()%></b>
                <p><%= p.getContent().substring(0, 100)%>...</p>
            </div>
            <div class="card-footer text-center primary-background">
               
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm text-white">Read More</a>
               
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
