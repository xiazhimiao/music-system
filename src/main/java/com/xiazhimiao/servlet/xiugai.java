package com.xiazhimiao.servlet;

import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "xiugai", urlPatterns = "/xiugai")
public class xiugai extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        if (username == null) {
            resp.sendRedirect("jsp/NoLogin.jsp");
            return;
        }
        DbUtils dbUtils = new DbUtils();
        String password = req.getParameter("password");
        String money = req.getParameter("money");
        if(Objects.equals(password, "") && Objects.equals(money, "")){
            return;
        }
        if(Objects.equals(password, "")){
            String sql0 = "update user set  money = '" + money + "' where username = '" + username + "'";
            dbUtils.updateSQL(sql0);
            req.getRequestDispatcher("jsp/OKxiugai.jsp").forward(req,resp);
            return;
        }
        if(Objects.equals(money, "")){
            String sql1 = "update user set  password = '" + password + "' where username = '" + username + "'";
            dbUtils.updateSQL(sql1);
            req.getRequestDispatcher("jsp/OKxiugai.jsp").forward(req,resp);
            return;
        }
        String sql = "update user set password = '" + password + "',money = '" + money + "' where username = '" + username + "'";
        dbUtils.updateSQL(sql);
        req.getRequestDispatcher("jsp/OKxiugai.jsp").forward(req,resp);
    }
}
