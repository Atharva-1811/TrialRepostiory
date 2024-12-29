package com.embelSoft.utility;

import java.io.File;
import java.io.IOException;
import java.util.List;
 

public class ImageUpload {
 
    public static void ImgUpload() {
        String charset = "UTF-8";
        java.io.File uploadFile1 = new File("C:/logo.png");
//        File renamed = new File("C:/Logo2.png");
//        uploadFile1.renameTo(renamed);
       // File uploadFile2 = new File("e:/logo.JPG");
        String requestURL = "http://localhost:8080/embelSoft/WebContent/images";
 
        try {
            MultipartUtility multipart = new MultipartUtility(requestURL, charset);
             
//            multipart.addHeaderField("User-Agent", "CodeJava");
//            multipart.addHeaderField("Test-Header", "Header-Value");
//             
//            multipart.addFormField("description", "Cool Pictures");
//            multipart.addFormField("keywords", "Java,upload,Spring");
             
            multipart.addFilePart("fileUpload", uploadFile1);
           // multipart.addFilePart("fileUpload", uploadFile2);
 
            List<String> response = multipart.finish();
             
            System.out.println("SERVER REPLIED:");
             
            for (String line : response) {
                System.out.println(line);
            }
        } catch (IOException ex) {
            System.err.println(ex);
        }
    }
}
