package com.xiazhimiao.servlet;

import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "BuyMusic", urlPatterns = "/BuyMusic")
public class BuyMusic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            log("null");
            response.sendRedirect("jsp/NoLogin.jsp");
            return;
        }

        //接收修改超链接传递的id值
        String music_id = request.getParameter("id");

        double money = 0;
        DbUtils dbUtils = new DbUtils();
        String sql = "select money from user where username='" + username + "'";
        List<Map<String, String>> maps = dbUtils.querySQL(sql);
        Set<Map.Entry<String, String>> entrySet = maps.get(0).entrySet();
        for (Map.Entry<String, String> entry : entrySet) {
            log("444444444444444444444");
            money = Double.parseDouble(entry.getValue());
            if (money < 5) {
                log("5555555555555555");
                response.sendRedirect("jsp/NoMoney.jsp");
                return;
            }
        }

        //上面证明钱足够买音乐（统一5块钱）

        money-=5;
        String sql0 = " UPDATE user  SET money = "+money+" where username='" + username + "'";
        dbUtils.updateSQL(sql0);

        String sql1 = "INSERT INTO me_music ( user_name, music_id) VALUES ('"+username+"', '"+music_id+"')";
        dbUtils.updateSQL(sql1);

        response.sendRedirect("jsp/BuyOK.jsp");
    }

}
