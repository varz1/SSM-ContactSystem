package com.cl.service;

import com.cl.pojo.User;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface UserService {
    public List<User> findAll();

    public void insert(User user);

    void delete(int id);

    User findById(int id);

    void update(User user);

    void reAlter();
    public User checkName(String name);
    public List<User>  queryUser(User user);
}
