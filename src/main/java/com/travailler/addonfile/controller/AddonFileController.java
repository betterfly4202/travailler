package com.travailler.addonfile.controller;

import com.travailler.common.FileUpload;
import com.travailler.common.HandlerFile;
import com.travailler.common.PropertiesValue;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
        fl.plFileUpload(file,filePath, fileName, request, response);
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
        ModelAndView mav = new ModelAndView("/fileupload/myUpload");

        return mav;
    }


    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public @ResponseBody String fileUpload(MultipartHttpServletRequest request, HttpServletResponse response) {

        //0. notice, we have used MultipartHttpServletRequest

        //1. get the files from the request object
        Iterator<String> itr =  request.getFileNames();

        MultipartFile mpf = request.getFile(itr.next());
        System.out.println(mpf.getOriginalFilename() +" uploaded!");

//        try {
            //just temporary save file info into ufile
//            ufile.length = mpf.getBytes().length;
//            ufile.bytes= mpf.getBytes();
//            ufile.type = mpf.getContentType();
//            ufile.name = mpf.getOriginalFilename();

//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
        //2. send it back to the client as <img> that calls get method
        //we are using getTimeInMillis to avoid server cached image

        return "SUCCESS";
    }
}