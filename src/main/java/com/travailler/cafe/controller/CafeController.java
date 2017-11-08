package com.travailler.cafe.controller;

import com.travailler.cafe.bean.CafeInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by betterFLY on 2017-11-08.
 */

@Controller
public class CafeController {

    @RequestMapping(value="/add/cafelist")
    public ModelAndView cafeAdd(
            @ModelAttribute("cafeInfoVO")CafeInfoVO cafeInfoVO){
        ModelAndView mav = new ModelAndView("/cafe/cafe_add");

        return mav;
    }

}
