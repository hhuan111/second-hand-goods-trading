package com.second.hand.trading.server.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileService {

    /**
     * 上传文件
     * @param multipartFile
     * @param fileName
     * @return
     * @throws IOException
     */
    boolean uploadFile(MultipartFile multipartFile,String fileName)throws IOException;
}
