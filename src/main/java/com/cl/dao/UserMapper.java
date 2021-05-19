package com.cl.dao;

import com.cl.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    public List<User> findAll();
    public void insert(User user);
    void delete(@Param("id") int id);

    User findById(@Param("id")int id);

    void update(User user);

    public List<User> queryUser(User user);
    void reAlter();
//
//    int findTotalCount(Map<String, String[]> condition);//查询总记录数
//    //分页条件查询
//    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);//分页查询
}
