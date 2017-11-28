package com.travailler.cafe.controller;

import com.travailler.cafe.bean.CafeInfoVO;
import com.travailler.cafe.service.CafeinfoService;
import com.travailler.common.bean.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

        List<CommonCodeVO> codeList = service.getCommonCode();

        mav.addObject("codeList",codeList);

        return mav;
    }

}
