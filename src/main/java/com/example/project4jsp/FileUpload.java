package com.example.project4jsp;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public ProductVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        ProductVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");

            one = new ProductVO();
            String sid = multipartRequest.getParameter("sid");
            if(sid != null && sid.equals("")) one.setId(Integer.parseInt(sid));
//            one.setId(Integer.parseInt(multipartRequest.getParameter("id")));
            one.setName(multipartRequest.getParameter("name"));
            one.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
            one.setType(multipartRequest.getParameter("type"));
            one.setNum(Integer.parseInt(multipartRequest.getParameter("num")));
            one.setSize(multipartRequest.getParameter("size"));
            one.setSeller(multipartRequest.getParameter("seller"));
            one.setCountry(multipartRequest.getParameter("country"));


            if(sid != null && sid.equals("")) {
                ProductDAO dao = new ProductDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if (filename != null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if (filename == null & oldfilename != null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        } return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
