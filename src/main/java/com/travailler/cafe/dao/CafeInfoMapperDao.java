package com.travailler.cafe.dao;

import com.travailler.common.entity.CommonCodeEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by betterFLY on 2017-11-09.
 */

@Repository
public interface CafeInfoMapperDao {
    List<CommonCodeEntity> selectCommonCode(Map<String, Object> map);
}
