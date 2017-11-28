package com.travailler.cafe.service;

import com.travailler.cafe.dao.CafeInfoMapperDao;
import com.travailler.common.Constants;
import com.travailler.common.bean.CommonCodeVO;
import com.travailler.common.entity.CommonCodeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by betterFLY on 2017-11-09.
 */

@Service
public class CafeInfoServiceImpl implements CafeinfoService{
    @Autowired
    private CafeInfoMapperDao dao;

    @Override
    public List<CommonCodeVO> getCommonCode(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("p_id", Constants.COMMON_CODE_AREA );

        List<CommonCodeEntity> entList = dao.selectCommonCode(map);
        List<CommonCodeVO> resultList = new ArrayList<CommonCodeVO>();

        for(int i=0; i <entList.size(); i++){
            CommonCodeEntity ent = entList.get(i);
            resultList.add(ent.convertCommonVO());
        }

        return resultList;
    }
}
