/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MyEducationBlog.servlets;

import com.MyEducationBlog.dbConnect.UserDao;
import com.MyEducationBlog.entities.Message;
import com.MyEducationBlog.entities.User;
import com.MyEducationBlog.helpers.ConnectionProvider;
import com.MyEducationBlog.helpers.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession();

            User user = (User) s.getAttribute("currentuser");

            user.setEmail(request.getParameter("user_email"));
            user.setPassword(request.getParameter("password"));
            user.setAbout(request.getParameter("user_about"));
            user.setName(request.getParameter("user_name"));
            
            String oldFile = user.getProfile();

            Part part = request.getPart("image");
            String filename = part.getSubmittedFileName();

            user.setProfile(filename);

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean flag = dao.editUser(user);
            if (flag) {
                out.println("User Information Updated");

                String oldpath = request.getRealPath("/") + "pics" + File.separator + oldFile;
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

                Helper.deleteFile(oldpath);

                if (Helper.saveFile(part.getInputStream(), path)) {

                    Message msg = new Message("Updated Successfully", "Success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    out.println("Profile updation failed");
                    Message msg = new Message("Invalid Details", "Error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

            } else {
                out.println("Updation Failed");
                Message msg = new Message("Invalid Details", "Error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
