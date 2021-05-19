package com.cl.service;

import com.cl.dao.UserMapper;
import com.cl.pojo.User;
import lombok.AllArgsConstructor;

import java.util.List;


public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }

    @Override
    public void delete(int id) {
        userMapper.delete(id);
    }

    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public void reAlter() {
        userMapper.reAlter();
    }

    @Override
    public List<User>  queryUser(User user) {
        return userMapper.queryUser(user);
    }


}
