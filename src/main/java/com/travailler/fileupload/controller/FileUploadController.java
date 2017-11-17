package com.travailler.fileupload.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
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


    // https://github.com/biezhi/springmvc-plupload/blob/master/src/main/java/com/plupload/controller/PluploadController.java
    private static final int BUFFER_SIZE = 100 * 1024;
    @RequestMapping(value = "/plupload/file", method= RequestMethod.POST) //ajax에서 호출하는 부분
    @ResponseBody
    public String plupload(@RequestParam MultipartFile file, HttpServletRequest request, HttpSession session) {
        try {
            String fileName = file.getOriginalFilename();
            String realPath = "E:/upload_test";

            Integer chunk = 0, chunks = 0;
            if(null != request.getParameter("chunk") && !request.getParameter("chunk").equals("")){
                chunk = Integer.valueOf(request.getParameter("chunk"));
            }
            if(null != request.getParameter("chunks") && !request.getParameter("chunks").equals("")){
                chunks = Integer.valueOf(request.getParameter("chunks"));
            }
            logger.info("chunk:[" + chunk + "] chunks:[" + chunks + "]");

            File folder = new File(realPath);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            File destFile = new File(folder, fileName);
            if (chunk == 0 && destFile.exists()) {
                destFile.delete();
                destFile = new File(folder, fileName);
            }
            appendFile(file.getInputStream(), destFile);
            if (chunk == chunks - 1) {
                logger.info("upload success !");
            }else {
                logger.info("left ["+(chunks-1-chunk)+"] chunks...");
            }

        } catch (IOException e) {
            logger.error(e.getMessage());
        }
        return "UPLOAD_SUCCESS";
    }

    private void appendFile(InputStream in, File destFile) {
        OutputStream out = null;
        try {
            if (destFile.exists()) {
                out = new BufferedOutputStream(new FileOutputStream(destFile, true), BUFFER_SIZE);
            } else {
                out = new BufferedOutputStream(new FileOutputStream(destFile),BUFFER_SIZE);
            }
            in = new BufferedInputStream(in, BUFFER_SIZE);

            int len = 0;
            byte[] buffer = new byte[BUFFER_SIZE];
            while ((len = in.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            try {
                if (null != in) {
                    in.close();
                }
                if(null != out){
                    out.close();
                }
            } catch (IOException e) {
                logger.error(e.getMessage());
            }
        }
    }
}
