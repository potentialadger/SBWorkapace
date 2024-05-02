package com.match.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.match.bean.SocialPhotosBean;
import com.match.service.SocialPhotosService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SocialPhotosController {
	
	@Autowired
	private SocialPhotosService socialPhotosService;
	
	
    // 查詢單張照片
//    @GetMapping("/photos/{photoNo}")
//    public ResponseEntity<SocialPhotosBean> getPhotoById(@PathVariable Integer photoNo) {
//        SocialPhotosBean photo = socialPhotosService.getById(photoNo);
//        if (photo == null) {
//            return ResponseEntity.notFound().build();
//        }
//        return ResponseEntity.ok(photo);
//    }
	
    // 查詢所有照片
//    @GetMapping("/photos")
//    public ResponseEntity<List<SocialPhotosBean>> getAllPhotos() {
//        List<SocialPhotosBean> photos = socialPhotosService.findAll();
//        return ResponseEntity.ok(photos);
//    }

    // 根據主題查詢照片
//    @GetMapping("/photos/theme/{photoTheme}")
//    public ResponseEntity<List<SocialPhotosBean>> getPhotosByTheme(@PathVariable String photoTheme) {
//        List<SocialPhotosBean> photos = socialPhotosService.findByPhotoTheme(photoTheme);
//        return ResponseEntity.ok(photos);
//    }

    // 删除照片
//    @DeleteMapping("/photos/{photoNo}")
//    public ResponseEntity<Void> deletePhoto(@PathVariable Integer photoNo) {
//        socialPhotosService.deleteById(photoNo);
//        return ResponseEntity.noContent().build();
//    }
	
	
	//上傳圖片 - 新增
	@PostMapping(value = "/insertsphoto")
	@ResponseBody
	public SocialPhotosBean insertSPhoto(@RequestParam("userNo") Integer userNo,
	                                     @RequestParam("photoTheme") String photoTheme,
	                                     @RequestParam("sPhoto") MultipartFile mf,
	                                     HttpServletRequest request) throws IllegalStateException, IOException {
	    HttpSession session = request.getSession();

	    String filename = mf.getOriginalFilename();
	    String extension = "";
	    int i = filename.lastIndexOf('.');
	    if (i >= 0) {
	        extension = filename.substring(i);
	    }

	    Random random = new Random();
	    int raNumber = random.nextInt(10000);
	    filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber + extension;

	    String fileDir = "C:/temp/upload/";
	    File pathexist = new File(fileDir);
	    if (!pathexist.exists()) {
	        pathexist.mkdirs();
	    }

	    File fileDirPath = new File(fileDir, filename);
	    mf.transferTo(fileDirPath);

	    SocialPhotosBean sPhoto = socialPhotosService.insertOrUpdate(userNo, photoTheme, filename);
	    session.setAttribute("photono", sPhoto.getPhotoNo());

	    return sPhoto;
	}
	
	
	//上傳圖片 - 修改
	@PostMapping(value = "/updatesphoto", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public SocialPhotosBean updateSPhoto(@RequestParam("userNo") Integer userNo,
            							 @RequestParam("photoTheme") String photoTheme,
            							 @RequestParam("sPhoto") MultipartFile mf,
            							 HttpServletRequest request) throws IllegalStateException, IOException {
										 HttpSession session = request.getSession();
		Integer photoNo = (Integer)session.getAttribute("photoNo");  //..?
		
		String filename = mf.getOriginalFilename();
		String extension = "";
		
		int i = filename.lastIndexOf('.');
		if(i >= 0) {
			extension = filename.substring(i);
		}
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber + extension;
		
		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if(!pathexist.exists()) {
			pathexist.mkdirs();
		}
		
		File fileDirPath = new File(fileDir, filename);
		mf.transferTo(fileDirPath);
		
		SocialPhotosBean sPhoto = socialPhotosService.insertOrUpdate(userNo, photoTheme, filename);
		
		return sPhoto;
	}
	
}
