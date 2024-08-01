package com.xiazhimiao.servlet;


import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteMusicById", urlPatterns = "/DeleteMusicById")
public class DeleteMusicById extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        //定义SQL语句
        String sql = "delete from music_by_id where id = '" + id + "'";
        //删除音乐的同时必须删除所有购买这个音乐的用户的目录下的这个音乐
        String sql0 = "delete from me_music where music_id = '" + id + "'";

        //调用JDBC
        DbUtils dbUtils = new DbUtils();

        //按理说这里应该添加一个事务，以防出错可以回滚，防止出现异常数据，但这里时间问题就不写了
        int rows = dbUtils.updateSQL(sql);
        int rows0 = dbUtils.updateSQL(sql0);

        if (rows == 1 && rows0 >= 0) {
            // 【重定向】
            //response.sendRedirect("要去的页面名称");
            //可以跳转页面 无需传值
            response.sendRedirect("jsp/success.jsp");
        } else {
            //删除失败
            response.sendRedirect("jsp/fail.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
