package com.travailler.common;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

/**
 * Created by betterFLY on 2017-11-21.
 */

/**
    @Component > @Service
        : Spring Framework가 관리하는 컴포넌트의 일반적 타입
        : 개발자가 직접 조작이 가능한 크래스의 경우 @Component 선언
        : <==> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용
 */

/*
    AbstractView : Spring MVC pattern 사용시 DispatcherServlet 기능
                 : requestURI에 따라 컨트롤러로 분기하고 로직 처리 후 Resolver를 사용하여
                 : 해당 JSP 파일을 찾아 응답처리하는데 그 사이에 시점을 잡아 처리하는 기능
 */
@Component
public class FileDownload extends AbstractView {
    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception{
//        String originalFileName = (String)map.get("originalFileName");
//        String userAgent = request.getHeader("User-Agent");
//        String contentType = request.getContentType();
//        int contentLength = (int)file.length();
//        response.setContentType(contentType);
//        response.setContentLength(contentLength);
//
//        boolean ie = userAgent.indexOf("MSIE") > -1;
//        String fileName = null;
//
//        if(ie == true)
//            fileName = URLEncoder.encode(originalFileName, "UTF-8");
//        else
//            fileName = new String(originalFileName.getBytes("UTF-8"),"ISO-8859-1");
        File file = (File)map.get("downloadFile");
        String fileName = file.getName();

        response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
        response.setHeader("Content-Transfer-Encoding","binary");

        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;

        try{
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        }finally {
            if(fis != null){
                try{
                    fis.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            out.flush();
        }
    }
}
