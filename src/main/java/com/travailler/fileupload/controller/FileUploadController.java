package com.travailler.fileupload.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by betterFLY on 2017-11-10.
 */

@Controller
public class FileUploadController {

    @RequestMapping(value = "/main/fileUpload")
    public ModelAndView fileUploadMain(){
        ModelAndView mav = new ModelAndView("/fileupload/test");

        return mav;
    }
}
