package com.xiazhimiao.servlet;


import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//进来第一件事添加路径
@WebServlet(name = "QueryMyMusic", urlPatterns = "/QueryMyMusic")
public class QueryMyMusic extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            log("null");
            response.sendRedirect("jsp/NoLogin.jsp");
            return;
        }


        //查询数据 --> 数据库 --> 访问数据库使用JDBC
        DbUtils dbUtils = new DbUtils();
        //自定义SQL语句
        String sql = "select music_id from me_music where user_name='" + username + "'";
        //调用SQL语句 返回数据结构
        List<Map<String, String>> list = dbUtils.querySQL(sql);

        if (list.size() == 0) {
            request.getRequestDispatcher("jsp/my_music.jsp");
            log("66666666666666666");
            return;
        }

        List<Map<String, String>> LIST = new ArrayList<>();

        for (Map<String, String> map : list) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                //自定义SQL语句
                String sql0 = "select * from music_by_id where id='" + entry.getValue() + "'";
                List<Map<String, String>> list0 = dbUtils.querySQL(sql0);
                LIST.add(list0.get(0));
            }
        }
//        if(1==1){
//            for (Map<String, String> stringStringMap : LIST) {
//                for (Map.Entry<String, String> entry : stringStringMap.entrySet()) {
//                    log(entry.getKey()+"000000000"+entry.getValue());
//                }
//            }
//        }

        //数据要求回显在页面上
        //需要执行两个操作 1.传值 2.跳转页面
        //采用的技术栈 叫做【请求转发】  因为他可以传递任意类型(Object)的数据
        //语法结构:request.setAttribute("自定义key值",要传递的数据对象名称);
        //传值
        request.setAttribute("list", LIST);
        //跳转  传值和跳转他俩是搭配使用 == 合成 请求转发
        //语法request.getRequestDispatcher("文件夹名/要去的页面的名称").forward(request,response);
        //语法request.getRequestDispatcher("要去的页面的名称").forward(request,response);
        log("000000000000000000000");
        request.getRequestDispatcher("jsp/my_music.jsp").forward(request, response);
    }

    //超链接 属于get类型的请求 所以在servlet执行doGet方法
    //【注意】如果分不清什么样的请求 走哪一个方法
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用doPost方法 那么不论是get请求还是post请求 都会执行doPost方法
        doPost(request, response);
    }
}
