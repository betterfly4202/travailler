package com.travailler.main.controller;

/**
 * Created by betterFLY on 2017-11-22.
 */
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/protected/demo")
public class ProtectedResource {
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String getGreeting(@PathVariable String name){
        String result = "Hello " + name+"\nThis is a protedted page.";
        return result;
    }

    @RequestMapping(value = "/korbit", method = RequestMethod.POST)
    public ModelAndView goKorbit(){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("username","dlcnddlf88@naver.com");
        map.put("password","qw131154");
        map.put("grant_type","password");

        return mav;
    }
}