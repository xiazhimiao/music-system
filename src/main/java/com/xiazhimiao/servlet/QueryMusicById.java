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

@WebServlet(name = "QueryMusicById",urlPatterns = "/QueryMusicById")
public class QueryMusicById extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收修改超链接传递的id值
        String id = request.getParameter("id");
        //System.out.println(id);
        //执行数据回显操作 通过我要修改的数据id值 查询该条数据
        String sql = "select * from music_by_id where id = '"+id+"'";
        DbUtils dbUtils = new DbUtils();
        List<Map<String, String>> list = dbUtils.querySQL(sql);
        //由于id是唯一性数据 所有通过id 查询数据 只会得到一条数据
        Map<String, String> map = list.get(0);
        //再将得到的数据 传递到页面中
        //传递数据 + 跳转页面 == 请求转发
        request.setAttribute("map",map);
        //通常情况下 修改页面页面的样式和添加页面相同
        request.getRequestDispatcher("jsp/updateMusic.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
