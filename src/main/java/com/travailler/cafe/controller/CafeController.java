package com.travailler.cafe.controller;

import com.travailler.cafe.bean.CafeInfoVO;
import com.travailler.cafe.service.CafeinfoService;
import com.travailler.common.bean.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by betterFLY on 2017-11-08.
 */

@Controller
public class CafeController {

    @Autowired
    private CafeinfoService service;

    @RequestMapping(value="/add/cafelist")
    public ModelAndView cafeAdd(
            @ModelAttribute("cafeInfoVO")CafeInfoVO cafeInfoVO){
        ModelAndView mav = new ModelAndView("/cafe/cafe_add");

        List<CommonCodeVO> areaCodeList = service.getCommonCode();
        mav.addObject("areaCodeList",areaCodeList);
        return mav;
    }


    @RequestMapping(value = "/select/detailArea", method = RequestMethod.POST)
    public @ResponseBody List<CommonCodeVO> areaDetailList(
            @RequestParam("comCode")String comCode){
        List<CommonCodeVO> detailCodeList = service.getDetailCommonCode(comCode);
        return detailCodeList;
    }
}