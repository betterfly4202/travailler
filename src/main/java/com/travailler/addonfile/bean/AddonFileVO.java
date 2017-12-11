package com.travailler.addonfile.bean;

/**
 * Created by betterFLY on 2017. 12. 2.
 * Github : http://github.com/betterfly88
 */

public class AddonFileVO {
    private String fileName;
    private String filePaht;

    public AddonFileVO(String fileName, String filePaht) {
        super();
        this.fileName = fileName;
        this.filePaht = filePaht;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePaht() {
        return filePaht;
    }

    public void setFilePaht(String filePaht) {
        this.filePaht = filePaht;
    }
}
