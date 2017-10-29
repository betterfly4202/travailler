package com.travailler.login.dao;

import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

@Repository
public interface LoginMapperDao {
    int insertLoginUser(Map<String, Object> map);
}
