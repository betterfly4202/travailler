package com.travailler.addonfile.bean;

/**
 * Created by betterFLY on 2017. 12. 2.
 * Github : http://github.com/betterfly88
 */

public class AddonFileVO {
    private String fileName;
    private String filePath;
    private String filePieceChunk;
    private String fileTotalChunk;

//    public AddonFileVO(String fileName, String filePath) {
//        super();
//        this.fileName = fileName;
//        this.filePath = filePath;
//    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFilePieceChunk() {
        return filePieceChunk;
    }

    public void setFilePieceChunk(String filePieceChunk) {
        this.filePieceChunk = filePieceChunk;
    }

    public String getFileTotalChunk() {
        return fileTotalChunk;
    }

    public void setFileTotalChunk(String fileTotalChunk) {
        this.fileTotalChunk = fileTotalChunk;
    }
}
