package com.xiazhimiao.servlet;

import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminLoginServlet",urlPatterns = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DbUtils dbUtils = new DbUtils();
        String sql = "select id from admin_user where username='" + username + "' and password='" + password + "'";

        //调用SQL语句 返回数据结构
        List<Map<String, String>> list = dbUtils.querySQL(sql);
        if (list == null) {

            response.getWriter().print("用户名或密码错误！");
            //语法request.getRequestDispatcher("要去的页面的名称").forward(request,response);
            response.sendRedirect("index.jsp");


        } else {
            for (Map<String, String> map : list) {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    System.out.println(entry.getValue());
//                    HttpSession session = request.getSession();
//                    session.setAttribute("username", username);
                    request.getRequestDispatcher("QueryMusic").forward(request,response);
                }
            }
        }
    }
}
