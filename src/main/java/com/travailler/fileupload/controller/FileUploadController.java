package com.travailler.fileupload.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.Iterator;

/**
 * Created by betterFLY on 2017-11-10.
 */

@Controller
public class FileUploadController {
    Logger logger = Logger.getLogger(this.getClass());

    @RequestMapping(value = "/main/fileUpload")
    public ModelAndView fileUploadMain(){
        ModelAndView mav = new ModelAndView("/fileupload/test");

        return mav;
    }


    @RequestMapping(value = "/upload/file") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
        String filePath = "E:/upload_test"; //설정파일로 뺀다.

        Iterator<String> itr =  multipartRequest.getFileNames();
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */

            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로

            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리

                logger.debug("originalFilename : "+originalFilename);
                logger.debug("fileFullPath : "+fileFullPath);
            } catch (Exception e) {
                logger.debug("postTempFile_ERROR : "+fileFullPath);
                e.printStackTrace();
            }
        }
        return "success";
    }



    @RequestMapping(value = "/main/plupload")
    public ModelAndView pluploadMain(){
        ModelAndView mav = new ModelAndView("/fileupload/plupload");

        return mav;
    }


    @RequestMapping(value = "/plupload/file") //ajax에서 호출하는 부분
    @ResponseBody
    public String plupload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
        String filePath = "E:/upload_test"; //설정파일로 뺀다.

        Iterator<String> itr =  multipartRequest.getFileNames();
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로

            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리

                logger.debug("originalFilename : "+originalFilename);
                logger.debug("fileFullPath : "+fileFullPath);
            } catch (Exception e) {
                logger.debug("postTempFile_ERROR : "+fileFullPath);
                e.printStackTrace();
            }
        }
        return "success";
    }
}
