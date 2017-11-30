package com.travailler.cafe.service;

import com.travailler.cafe.bean.CafeInfoVO;
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
    public List<CommonCodeVO> getAreaCode(){
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

    @Override
    public List<CommonCodeVO> getSubjectCode(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("p_id", Constants.COMMON_CODE_SUBJECT );

        List<CommonCodeEntity> entList = dao.selectCommonCode(map);
        List<CommonCodeVO> resultList = new ArrayList<CommonCodeVO>();

        for(int i=0; i <entList.size(); i++){
            CommonCodeEntity ent = entList.get(i);
            resultList.add(ent.convertCommonVO());
        }
        return resultList;
    }

    @Override
    public List<CommonCodeVO> getAreaDetailCode(String comCode){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("p_id", comCode);

        List<CommonCodeEntity> entList = dao.selectCommonCode(map);
        List<CommonCodeVO> resultList = new ArrayList<CommonCodeVO>();

        for(int i=0; i <entList.size(); i++){
            CommonCodeEntity ent = entList.get(i);
            resultList.add(ent.convertCommonVO());
        }
        return resultList;
    }

    @Override
    public int createCate(CafeInfoVO cafeInfoVO){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user_seq",cafeInfoVO.getUserSeq());
        map.put("ca_url",cafeInfoVO.getCaUrl());
        map.put("ca_name",cafeInfoVO.getCaName());
        map.put("ca_public_yn",cafeInfoVO.getCaPublicYn());
        map.put("ca_topic",cafeInfoVO.getCaTopic());
        map.put("ca_area",cafeInfoVO.getCaArea());
        map.put("ca_desc",cafeInfoVO.getCaDesc());
        map.put("ca_img",cafeInfoVO.getCaImg());

        int successFlag = 0;
        successFlag = dao.insertCafeInfo(map);


        return successFlag;
    }

}
