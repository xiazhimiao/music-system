package com.xiazhimiao.servlet;



import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateMusicById",urlPatterns = "/UpdateMusicById")
public class UpdateMusicById extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接值
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        //第二步根据 前端form表单中的控件name属性值接值
        //语法:request.getParameter("控件的name属性值");
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String music_name = request.getParameter("music_name");
        String singer = request.getParameter("singer");
        //第三步 自定义SQL语句
        String sql = "update music_by_id set type = "+type+",music_name = '"+music_name+"'" +
                ",singer = '"+singer+"' where id = '"+id+"'";
        //第四步 调用JDBC封装
        DbUtils dbUtils = new DbUtils();
        int rows = dbUtils.updateSQL(sql);
        if(rows == 1){
            //添加成功
            // 【重定向】
            //response.sendRedirect("要去的页面名称");
            //可以跳转页面 无需传值
            response.sendRedirect("jsp/success.jsp");
        }else {
            //添加失败
            response.sendRedirect("jsp/fail.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
