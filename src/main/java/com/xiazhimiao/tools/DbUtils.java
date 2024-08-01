package com.xiazhimiao.tools;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//作为开发者 需要将一些常用的工具 封装 -- 工具类 以供其他(程序员)使用
public class DbUtils {
    //声明成员变量 方便封装和修改
    //1.驱动链接对象
    private Connection conn;
    //2.语句对象
    private Statement stmt;
    //3.结果集对象
    private ResultSet rs;
    //4.连接数据库的路径和账号密码
    //Mysql8 写法com.mysql.cj.jdbc.Driver
    //Mysql5 写法com.mysql.jdbc.Driver
    private String driver = "com.mysql.cj.jdbc.Driver";
    //mysql8: jdbc:mysql://localhost:3306/数据库名称?characterEncoding=utf8&serverTimezone=UTC
    //mysql5: jdbc:mysql://localhost:自己的端口号/数据库名称
    private String url = "jdbc:mysql://localhost:3306/music?characterEncoding=utf8&serverTimezone=UTC";
    //用户名和密码改成自己的
    private String username = "root";
    private String password = "1234";

    //获取连接方法
    private void getConnection(){
        try{
            //加载驱动
            Class.forName(driver);
            //获取链接
            conn = DriverManager.getConnection(url,username,password);
            //创建语句对象
            stmt = conn.createStatement();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //更新方法:将外界的SQL语句执行，并返回一个结果给外界
    //更新方法包含:insert添加 update修改 delete删除
    //返回值类型都是int  返回的是数据库被影响的行数
    public int updateSQL(String sql){
        try{
            //调用获取链接方法
            getConnection();
            //执行SQL语句
            System.out.println(sql);
            //通过语句对象stmt 执行SQL语句 返回被影响的行数
            int result = stmt.executeUpdate(sql);
            return result;
        }catch (Exception e){
            //异常捕获
            e.printStackTrace();
        }finally {
            //不管代码错误还是正确都会执行的代码块
            //调用关闭资源方法
            close();
        }
        return -1;//报错
    }

    //查询方法:
    //List<Map<String,String>>
    //ArrayList<HashMap<String,Object>>
    //1.HashMap<键/key(String),值/value(Object)> 可以存储键值对
    //HashMap可以存储键值对类型的数据
    //2.ArrayList 可以存储人机数据类型的数据  数组形式(可以存储多条)
    //ArrayList<数据类型>  数据类型 = HashMap<String,Object>
    public List<Map<String,String>> querySQL(String sql){
        //创建ArrayList对象
        List<Map<String,String>> list = new ArrayList<>();
        try{
            //调用获取连接方法
            getConnection();
            //通过语句对象执行SQL语句  得到 结果集对象
            rs = stmt.executeQuery(sql);
            //通过结果集对象 获取 表结构对象
            ResultSetMetaData rsmd = rs.getMetaData();
            //可以通过表结构获取字段个数
            int count = rsmd.getColumnCount();
            //将结果集对象rs中的数据进行遍历
            //遍历的方式while循环
            //rs.next() 判断结果集对象中有没有下一个数据 返回值是布尔类型
            //如果有下一个数据 我们就取下一个数据 如果没有终止循环
            while (rs.next()){
                //创建的HashMap对象
                Map<String,String> map = new HashMap<>();
                //遍历 for循环
                for(int i = 1;i <= count;i++){
                    //获取字段名
                    String name = rsmd.getColumnName(i);
                    //通过字段名获取字段值
                    String value = rs.getString(name);
                    //将字段名 字段值 存储到HashMap中
                    map.put(name,value);
                }
                //多个map使用arrayList存储
                list.add(map);
            }
            //返回数据
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close();
        }
        return null;
    }

    //释放资源的方法
    private void close(){
        try{
            if(rs != null){
                rs.close();
            }
            if(stmt != null){
                stmt.close();
            }
            if(conn != null){
                conn.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
