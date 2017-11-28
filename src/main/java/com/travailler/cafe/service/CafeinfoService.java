package com.travailler.cafe.service;

import com.travailler.common.bean.CommonCodeVO;

import java.util.List;

/**
 * Created by betterFLY on 2017-11-09.
 */
public interface CafeinfoService {
    List<CommonCodeVO> getCommonCode();
    List<CommonCodeVO> getDetailCommonCode(String comCode);
}
