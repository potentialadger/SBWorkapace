package com.match.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	private SocialPhotosService spService;
	
	
	// 查詢單張照片
	@GetMapping("/photos/{photoNo}")
	public String getPhotoById(@PathVariable Integer photoNo, Model model) {
	    SocialPhotosBean photo = spService.getById(photoNo);
	    if (photo == null) {
	        // 處理找不到照片的情況,例如返回錯誤頁面或其他操作
	        return "error"; // 這裡替換為實際的錯誤頁面路徑
	    }
	    model.addAttribute("photo", photo);
	    return "photoDetails"; // 這裡替換為顯示單張照片詳情的JSP文件路徑
	}

	// 查詢所有照片
	@GetMapping("/photos")
	public String getAllPhotos(Model model) {
	    List<SocialPhotosBean> photos = spService.findAll();
	    model.addAttribute("photos", photos);
	    return "photoList"; // 這裡替換為列出所有照片的JSP文件路徑
	}

	// 根據主題查詢照片
	@GetMapping("/photos/theme/{photoTheme}")
	public String getPhotosByTheme(@PathVariable String photoTheme, Model model) {
	    List<SocialPhotosBean> photos = spService.findByPhotoTheme(photoTheme);
	    model.addAttribute("photos", photos);
	    return "photoList"; // 這裡替換為列出按主題過濾的照片的JSP文件路徑
	}

	// 删除照片
	@DeleteMapping("/photos/{photoNo}")
	public String deletePhoto(@PathVariable Integer photoNo) {
		spService.deleteById(photoNo);
	    // 可以在這裡添加刪除成功後的操作,例如重定向到列表頁面
	    return "redirect:/photos"; // 這裡替換為重定向到照片列表頁面的路徑
	}
	
	
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

	    SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, photoTheme, filename);
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
		
		SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, photoTheme, filename);
		
		return sPhoto;
	}
	
}
