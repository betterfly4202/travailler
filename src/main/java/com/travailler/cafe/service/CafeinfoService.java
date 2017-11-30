package com.travailler.cafe.service;

import com.travailler.cafe.bean.CafeInfoVO;
import com.travailler.common.bean.CommonCodeVO;

import java.util.List;

/**
 * Created by betterFLY on 2017-11-09.
 */
public interface CafeinfoService {
    List<CommonCodeVO> getAreaCode();
    List<CommonCodeVO> getSubjectCode();
    List<CommonCodeVO> getAreaDetailCode(String comCode);

    int createCate(CafeInfoVO cafeInfoVO);
}
