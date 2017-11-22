package com.travailler.common;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
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
       File file = (File)map.get("downloadFile");
        String fileName = file.getName();

        response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
        response.setHeader("Content-Transfer-Encoding","binary");

        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;

        try {
            fis = new FileInputStream(file);
            byte[] buf = new byte[8192];

            int bytesRead = 0, bytesBuffered = 0;

            while ((bytesRead = fis.read(buf)) > -1) {
                out.write(buf, 0, bytesRead);
                bytesBuffered += bytesRead;
                if (bytesBuffered > 1024 * 1024) {
                    bytesBuffered = 0;
                    out.flush();
                }
            }
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            if(out != null)
                out.flush();
        }
    }
}
