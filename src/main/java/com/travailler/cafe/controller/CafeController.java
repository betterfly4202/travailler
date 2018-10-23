package com.travailler.cafe.controller;

import com.travailler.cafe.bean.CafeInfoVO;
import com.travailler.cafe.service.CafeinfoService;
import com.travailler.common.BaseController;
import com.travailler.common.bean.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by betterFLY on 2017-11-08.
 */

@Controller
public class CafeController extends BaseController {

    @Autowired
    private CafeinfoService service;

    @RequestMapping(value="/add/cafelist")
    public ModelAndView cafeAdd(
            @ModelAttribute("cafeInfoVO")CafeInfoVO cafeInfoVO){
        ModelAndView mav = new ModelAndView("/cafe/cafe_add");

//        List<CommonCodeVO> areaCodeList = service.getAreaCode();
//        List<CommonCodeVO> subjectCodeList = service.getSubjectCode();
//        mav.addObject("areaCodeList",areaCodeList);
//        mav.addObject("subjectCodeList",subjectCodeList);
        return mav;
    }


    @RequestMapping(value = "/select/detailArea", method = RequestMethod.POST)
    public @ResponseBody List<CommonCodeVO> areaDetailList(
            @RequestParam("comCode")String comCode){
        List<CommonCodeVO> detailCodeList = service.getAreaDetailCode(comCode);

        return detailCodeList;
    }



    @RequestMapping(value ="/create/cafe", method = RequestMethod.POST)
    public ModelAndView createCafe(
            HttpServletRequest request,
            @ModelAttribute("cafeInfoVO")CafeInfoVO cafeInfoVO){
//        ModelAndView mav;
        cafeInfoVO.setUserSeq(this.getUserInfo(request).getUserSeq());
        int result = service.createCate(cafeInfoVO);
        if(result>0)
            return new ModelAndView("/main");
        else
            return new ModelAndView("/main");
    }
}