package com.travailler.addonfile.controller;

import com.travailler.common.FileUpload;
import com.travailler.common.PropertiesValue;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by betterFLY on 2017-11-21.
 */
@Controller
public class AddonFileController {
    Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private PropertiesValue propertiesValue;

    @RequestMapping(value = "/main/plupload")
    public ModelAndView pluploadMain(){
        ModelAndView mav = new ModelAndView("/fileupload/plupload");
        return mav;
    }

    // https://github.com/biezhi/springmvc-plupload/blob/master/src/main/java/com/plupload/controller/PluploadController.java
    @RequestMapping(value = "/plupload/file", method= RequestMethod.POST)
    public @ResponseBody String plupload(@RequestParam MultipartFile file,
                                         @RequestParam("name") String fileName,
                           HttpServletRequest request, HttpServletResponse response){
        String filePath = propertiesValue.file_addonfile_save_path;
        FileUpload fl = new FileUpload();
//        fl.plFileUpload(file,filePath, fileName, request, response);
        return "UPLOAD_SUCCESS";
    }

    @RequestMapping(value = "/file/download")
    public ModelAndView fileDown(@RequestParam String filePath, HttpServletRequest request) throws Exception{
        File file= new File(filePath);
        // viewName : bean Setting, modelName : download Logic
        return new ModelAndView("fileDownload","downloadFile",file);
    }


    @RequestMapping(value="/my/uploader")
    public ModelAndView myUploader(){
        ModelAndView mav = new ModelAndView("fileupload/selfUpload");

        return mav;
    }

    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public @ResponseBody String fileUpload(@RequestParam("afile") MultipartFile file,
                                           @RequestParam("fileName") String fileName,
                                           HttpServletResponse response,
                                           HttpServletRequest request) {
        request.getHeader("chunks");
        request.getHeader("fileName");
        String filePath = propertiesValue.file_addonfile_save_path;
        FileUpload fl = new FileUpload();
        fl.basicUpload(file, filePath);

        return "SUCCESS";
    }

    @RequestMapping(value="/gmedia/upload")
    public ModelAndView gmediaFileUpload(){
        ModelAndView mav = new ModelAndView("fileupload/gmediaUpload");

        return mav;
    }
}