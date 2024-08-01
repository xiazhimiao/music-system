package com.xiazhimiao.servlet;


import com.xiazhimiao.tools.DbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//进来第一件事 添加urlPatterns = "/AddAnimal"路径
@WebServlet(name = "AddMusic",urlPatterns = "/AddMusic")
public class AddMusic extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接值操作
        //第一步 设置编码格式
        request.setCharacterEncoding("utf-8");
        //第二步根据 前端form表单中的控件name属性值接值
        //语法:request.getParameter("控件的name属性值");
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String music_name = request.getParameter("music_name");
        String singer = request.getParameter("singer");
        //第三步 获取完数据 开始调用JDBC工具 定义SQL语句
        DbUtils dbUtils = new DbUtils();
        String sql = "insert into music_by_id(id,type,music_name,singer) " +
                "values('"+id+"',"+type+",'"+music_name+"','"+singer+"')";
        //第四步 调用JDBC工具类中中的查询方法
        //调用updateSQL 包含添加 修改 删除功能 返回int类型数据被影响的行数
        int rows = dbUtils.updateSQL(sql);
        //如果行数影响为1 代表添加成功
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
