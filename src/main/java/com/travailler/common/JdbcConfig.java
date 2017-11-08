package com.travailler.common;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * Created by betterFLY on 2017-11-09.
 */

@Configuration
public class JdbcConfig {

//    @Autowired
//    DecryptService decrypt;
//
//    @Bean(destoryMethod="close")
//    public DataSource dataSource(){
//        BasicDataSource dataSource = new BasicDataSource();
//        dataSource.setDriverClassName("core.log.jdbc.driver.OracleDriver");
//        dataSource.setUrl("jdbc:oracle:thin:@110.93.135.145:8834:orcl");
//        dataSource.setUsername("betterfly");
//        dataSource.setPassword("gmedia");
//
//        return dataSource;
//    }
}
