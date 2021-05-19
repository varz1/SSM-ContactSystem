package com.cl.dao;

import com.cl.pojo.Manager;
import org.apache.ibatis.annotations.Select;

public interface ManagerMapper {

    public Manager findManager(Manager manager);
}
