package com.cl.service;

import com.cl.dao.ManagerMapper;
import com.cl.pojo.Manager;

public class ManagerServiceImpl implements ManagerService {
    private ManagerMapper managerMapper;

    public void setManagerMapper(ManagerMapper managerMapper) {
        this.managerMapper = managerMapper;
    }

    @Override
    public Manager findManager(Manager manager) {
        return managerMapper.findManager(manager);
    }
}
