package com.travailler.common;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/**
 * Created by betterFLY on 2017-11-21.
 */
public class FileUpload {
    Logger logger = Logger.getLogger(this.getClass());


    private static final int BUFFER_SIZE = 100 * 1024;

    public void plFileUpload(MultipartFile file, String filePath, HttpServletRequest request){
        try {
            String fileName = file.getOriginalFilename();
//            String fileName = request.getParameter("name");

            Integer chunk = 0, chunks = 0;
            if(null != request.getParameter("chunk") && !request.getParameter("chunk").equals("")){
                chunk = Integer.valueOf(request.getParameter("chunk"));
            }
            if(null != request.getParameter("chunks") && !request.getParameter("chunks").equals("")){
                chunks = Integer.valueOf(request.getParameter("chunks"));
            }
            logger.info("chunk:[" + chunk + "] chunks:[" + chunks + "]");

            File folder = new File(filePath);
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
    }

    public void appendFile(InputStream in, File destFile) {
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
                e.getMessage();
                logger.error(e.getMessage());
            }
        }
    }
}
