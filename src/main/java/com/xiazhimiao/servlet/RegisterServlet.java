package com.xiazhimiao.servlet;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiazhimiao.pojo.Result;
import com.xiazhimiao.tools.DbUtils;
import org.apache.logging.log4j.core.Logger;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet(name = "RegisterServlet", urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取输入流
        BufferedReader reader = request.getReader();
        StringBuilder formData = new StringBuilder();
        String line;

        // 逐行读取数据
        while ((line = reader.readLine()) != null) {
            formData.append(line);
            // 通常表单数据会在一行中，但如果不是，可以按需添加换行符
//            formData.append("\\n");
        }

        // 关闭输入流
        reader.close();

        // 返回表单数据

        JSONObject jsonObject = JSON.parseObject(formData.toString());

        String username =jsonObject.getString("username");
        String password = jsonObject.getString("password");
        log("user:   " + username);
        log("pass:   " + password);


        DbUtils dbUtils = new DbUtils();

        String sql0 = "select * from user where username='" + username + "'";
        List<Map<String, String>> list = dbUtils.querySQL(sql0);


        if (list.size() != 0) {
            //       response.addHeader("err", "000");
//            HttpSession session = request.getSession();
//            session.setAttribute("panduan", "该用户名已被注册");
            //response.sendRedirect("index.jsp");

            //创建响应对象
            Result result = new Result(0, "err", null);

            response.setContentType("application/json");

            response.setCharacterEncoding("UTF-8");

//            String json = new Gson().toJson(result);
            String json = JSONObject.toJSONString(result);

            response.getWriter().write(json);


        } else {

            String sql = "INSERT INTO user (username, password)VALUES ('" + username + "','" + password + "')";
            //调用SQL语句 返回数据结构
            int conut = dbUtils.updateSQL(sql);
            if (conut == 1) {

                //创建响应对象
                Result result = new Result(1, "成功", null);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String json = JSONObject.toJSONString(result);
                response.getWriter().write(json);
                //只有登录才记住id
//                HttpSession session = request.getSession();
//                session.setAttribute("username", username);


            }


        }

    }
}