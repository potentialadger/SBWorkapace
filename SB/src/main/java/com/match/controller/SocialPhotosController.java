//新增、刪除跟修改應該由用戶來做，這裡的管理員操作按鈕先關掉


package com.match.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
	
	
	
	// 查詢編號+姓名 for GoalsHP.jsp
/*	@GetMapping("/queryPhotoNo")
	public String queryPhotos(@RequestParam(required = false, name = "photoNo") Integer photoNo,
	                         @RequestParam(required = false, name = "photoTheme") String photoTheme,
	                         Model model) {
	    List<SocialPhotosBean> photos;
	    if (photoNo != null) {
	    	SocialPhotosBean bean = spService.getById(photoNo);
	        photos = bean != null ? Collections.singletonList(bean) : Collections.emptyList();
	    } else if (photoTheme != null && !photoTheme.isEmpty()) {
	        photos = spService.findByPhotoTheme(photoTheme);
	    } else {
	        photos = spService.findAll();
	    }
	    model.addAttribute("photos", photos);
	    return "match/jsp/SocialPhotosHP.jsp";
	}*/


	
    // 查詢單張照片
    @GetMapping("/getSPhotos/{photoNo}")
    public String getPhotoById(@PathVariable Integer photoNo, Model model) {
        SocialPhotosBean photo = spService.getById(photoNo);
        if (photo == null) {
            // 處理找不到照片的情況,例如返回錯誤頁面或其他操作
            return "error";
        }
        model.addAttribute("photo", photo);
        return "match/jsp/SocialPhotosHP.jsp";
    }
    
	
	// 查詢單張照片
/*	@GetMapping("/getSPhotos/{photoNo}")
	public ResponseEntity<SocialPhotosBean> getPhotoById(@PathVariable Integer photoNo) {
		SocialPhotosBean photo = spService.getById(photoNo);
		if (photo == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(photo);
	}*/

	
	// 查詢所有照片  -  從這裡傳全部資料到前端
	@GetMapping("/socialPhotosHP")
	public String getAllPhotos(Model model) {
	    List<SocialPhotosBean> photos = spService.findAll();
	    model.addAttribute("photos", photos);
	    return "match/jsp/SocialPhotosHP.jsp";
	}
	
	
	// 查詢所有照片 (傳JSON)
//	@GetMapping("/getAllSPhotos")
//	public ResponseEntity<List<SocialPhotosBean>> getAllPhotos() {
//		List<SocialPhotosBean> photos = spService.findAll();
//		return ResponseEntity.ok(photos);
//	}
	
	
	// 刷新全部頁面
	@GetMapping("/refreshPhotos")
	public String refreshPhotosPage() {
		return "redirect:socialPhotosHP";
	}

	
	// 根據主題查詢照片
//    @GetMapping("/photos/theme/{photoTheme}")
//    public ResponseEntity<List<SocialPhotosBean>> getPhotosByTheme(@PathVariable String photoTheme) {
//        List<SocialPhotosBean> photos = spService.findByPhotoTheme(photoTheme);
//        return ResponseEntity.ok(photos);
//    }
	
	
    // 删除照片
    @DeleteMapping("/deletePhoto/{photoNo}")
    public String deletePhoto(@PathVariable Integer photoNo) {
        spService.deleteById(photoNo);
        return "redirect:/socialPhotosHP";
    }

	
	// 删除照片 (傳JSON)
//	@DeleteMapping("/deleteSPhotos/{photoNo}")
//	public ResponseEntity<Void> deletePhoto(@PathVariable Integer photoNo) {
//		spService.deleteById(photoNo);
//		return ResponseEntity.noContent().build();
//	}
    
    
	//批量刪除
	@PostMapping("/deleteBatchPhotos")
	public String deleteBatchPhotos(@RequestParam("photoNos") List<Integer> photoNos) {
	    if (!photoNos.isEmpty()) {
	        for (Integer photoNo : photoNos) {
	        	spService.deleteById(photoNo);
	        }
	    }
	    return "redirect:/socialPhotosHP";
	}

	
	// 接收用戶上傳的照片，將其儲存到伺服器中，並在資料庫中新增相應的記錄       //...再看需不需要寫上傳多張
	@PostMapping(value = "/insertSPhoto")
	@ResponseBody
	public List<SocialPhotosBean> insertSPhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("sPhoto") MultipartFile[] mfs,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    HttpSession session = request.getSession();
	    List<SocialPhotosBean> insertedPhotos = new ArrayList<>();

	    for (MultipartFile mf : mfs) {
	        String filename = mf.getOriginalFilename();
	        String extension = "";
	        int i = filename.lastIndexOf('.');
	        if (i >= 0) {
	            extension = filename.substring(i);
	        }

	        Random random = new Random();
	        int raNumber = random.nextInt(10000);
	        filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
	                + extension;

	        String fileDir = "C:/temp/upload/";
	        File pathexist = new File(fileDir);
	        if (!pathexist.exists()) {
	            pathexist.mkdirs();
	        }

	        File fileDirPath = new File(fileDir, filename);
	        mf.transferTo(fileDirPath);

	        SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, filename);
	        insertedPhotos.add(sPhoto);
	    }

	    session.setAttribute("insertedPhotos", insertedPhotos);

	    return insertedPhotos;
	}
	
	
	
	//先這樣
	@PostMapping(value = "/updateSPhotos", consumes = "application/json" ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<SocialPhotosBean> updateSPhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("photoPath") List<MultipartFile> photoPaths,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    List<SocialPhotosBean> updatedPhotos = new ArrayList<>();

	    for (int i = 0; i < photoPaths.size(); i++) {
	        MultipartFile mf = photoPaths.get(i);

	        String filename = mf.getOriginalFilename();
	        String extension = "";
	        int j = filename.lastIndexOf('.');
	        if (j >= 0) {
	            extension = filename.substring(j);
	        }
	        Random random = new Random();
	        int raNumber = random.nextInt(10000);
	        filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
	                + extension;

	        String fileDir = "C:/temp/upload/";
	        File pathexist = new File(fileDir);
	        if (!pathexist.exists()) {
	            pathexist.mkdirs();
	        }
	        File fileDirPath = new File(fileDir, filename);
	        mf.transferTo(fileDirPath);

	        SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, filename/*, photoTheme*/);
	        updatedPhotos.add(sPhoto);
	    }

	    return updatedPhotos;
	}
	
	
	
	
//  看需不需要寫上傳多張
//  第一種方式 : 沒有使用 photoNoToUpdate 參數，是從 Session 中獲取 photoNo    //  1.讓使用者選擇要更新的照片，並進行修改或上傳新的版本    //  2.當使用者按下保存按鈕時，從會話中獲取照片編號，然後將更新後的照片信息（如用戶編號、照片主題和新的照片文件）作為參數傳遞到後端，然後使用第一種方法進行處理。
	
/*	@PostMapping(value = "/updatePhotos", produces = "application/json;charset=UTF-8")   //注意要加 .json", produces = "application/json;charset=UTF-8"
	@ResponseBody
	public SocialPhotosBean updateSPhoto(@RequestParam("userNo") Integer userNo,
										 @RequestParam("photoTheme") String photoTheme, 
										 @RequestParam("sPhoto") MultipartFile mf,
										 HttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer photoNo = (Integer) session.getAttribute("photoNo"); // ..?

		String filename = mf.getOriginalFilename();
		String extension = "";

		int i = filename.lastIndexOf('.');
		if (i >= 0) {
			extension = filename.substring(i);
		}

		Random random = new Random();
		int raNumber = random.nextInt(10000);

		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
				+ extension;

		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if (!pathexist.exists()) {
			pathexist.mkdirs();
		}

		File fileDirPath = new File(fileDir, filename);
		mf.transferTo(fileDirPath);

		SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, photoTheme, filename);

		return sPhoto;
	}*/
	
	
	
	/*@PostMapping(value = "/updatePhotos", produces = "application/json;charset=UTF-8")   //注意要加 .json", produces = "application/json;charset=UTF-8"
	@ResponseBody
	public SocialPhotosBean updateSPhoto(@RequestParam("userNo") Integer userNo,
										 @RequestParam("photoTheme") String photoTheme, 
										 @RequestParam("sPhoto") MultipartFile mf,
										 HttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer photoNo = (Integer) session.getAttribute("photoNo"); // ..?

		String filename = mf.getOriginalFilename();
		String extension = "";

		int i = filename.lastIndexOf('.');
		if (i >= 0) {
			extension = filename.substring(i);
		}

		Random random = new Random();
		int raNumber = random.nextInt(10000);

		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
				+ extension;

		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if (!pathexist.exists()) {
			pathexist.mkdirs();
		}

		File fileDirPath = new File(fileDir, filename);
		mf.transferTo(fileDirPath);

		SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, photoTheme, filename);

		return sPhoto;
	}*/
	
	
	/*@PostMapping(value = "/updateSPhotos", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<SocialPhotosBean> updatePhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("photoTheme") String[] photoThemes,
	                                            @RequestParam("photoPath") MultipartFile[] photoPaths,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    HttpSession session = request.getSession();
	    List<SocialPhotosBean> updatedPhotos = new ArrayList<>();

	    for (int j = 0; j < photoPaths.length; j++) {
	        MultipartFile photoPath = photoPaths[j];
	        String photoTheme = photoThemes[j];

	        String filename = photoPath.getOriginalFilename();
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
	        photoPath.transferTo(fileDirPath);

	        SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, photoTheme, filename);
	        updatedPhotos.add(sPhoto);
	    }

	    return updatedPhotos;
	}*/
	
	
	
	
	
	
	/*@PostMapping(value = "/updateSPhoto", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<SocialPhotosBean> updatePhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("photoTheme") String[] photoThemes,
	                                            @RequestParam("sPhoto") MultipartFile[] mfs,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    HttpSession session = request.getSession();
	    List<SocialPhotosBean> updatedPhotos = new ArrayList<>();

	    for (int j = 0; j < mfs.length; j++) {
	        MultipartFile mf = mfs[j];
	        String photoTheme = photoThemes[j];

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
	        updatedPhotos.add(sPhoto);
	    }

	    return updatedPhotos;
	}*/
	
	
	
	

	

	
	
	
	
	
	//-----Test
	
	
//  第二種方式 : 使用 photoNoToUpdate 參數    //  1.讓使用者選擇要更新的照片，並透過介面輸入照片的相關資訊。  //  2.當使用者按下保存按鈕時，將更新照片的編號、用戶編號、照片主題和新的照片文件作為參數傳遞到後端，然後使用第二種方法進行處理。

//	@PostMapping(value = "/updateSPhoto", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public SocialPhotosBean updateSPhoto(@RequestParam("photoNo") Integer photoNoToUpdate,
//	                                     @RequestParam("userNo") Integer userNo,
//	                                     @RequestParam("photoTheme") String photoTheme,
//	                                     @RequestParam("sPhoto") MultipartFile mf,
//	                                     HttpServletRequest request) throws IllegalStateException, IOException {
//
//	    String filename = mf.getOriginalFilename();
//	    String extension = "";
//	    int i = filename.lastIndexOf('.');
//	    if (i >= 0) {
//	        extension = filename.substring(i);
//	    }
//
//	    Random random = new Random();
//	    int raNumber = random.nextInt(10000);
//	    filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber + extension;
//
//	    String fileDir = "C:/temp/upload/";
//	    File pathexist = new File(fileDir);
//	    if (!pathexist.exists()) {
//	        pathexist.mkdirs();
//	    }
//
//	    File fileDirPath = new File(fileDir, filename);
//	    mf.transferTo(fileDirPath);
//
//	    // 使用 getById 方法查找現有記錄
//	    SocialPhotosBean existingPhoto = spService.getById(photoNoToUpdate);
//
//	    if (existingPhoto != null) {
//	        // 如果記錄存在，則調用 insertOrUpdate 方法更新該記錄
//	        return spService.insertOrUpdate(userNo, photoTheme, filename);
//	    } else {
//	        // 如果記錄不存在，則新增一條記錄
//	        return spService.insertOrUpdate(userNo, photoTheme, filename);
//	    }
//	}
//	
	
	
	
	//-----Test

	// 查詢單張照片
//	@GetMapping("/photos/{photoNo}")
//	public String getPhotoById(@PathVariable Integer photoNo, Model model) {
//	    SocialPhotosBean photo = spService.getById(photoNo);
//	    if (photo == null) {
//	        // 處理找不到照片的情況,例如返回錯誤頁面或其他操作
//	        return "error"; // 這裡替換為實際的錯誤頁面路徑
//	    }
//	    model.addAttribute("photo", photo);
//	    return "photoDetails"; // 這裡替換為顯示單張照片詳情的JSP文件路徑
//	}

	// 查詢所有照片
//	@GetMapping("/photos")
//	public String getAllPhotos(Model model) {
//	    List<SocialPhotosBean> photos = spService.findAll();
//	    model.addAttribute("photos", photos);
//	    return "photoList"; // 這裡替換為列出所有照片的JSP文件路徑
//	}

	// 根據主題查詢照片
//	@GetMapping("/photos/theme/{photoTheme}")
//	public String getPhotosByTheme(@PathVariable String photoTheme, Model model) {
//	    List<SocialPhotosBean> photos = spService.findByPhotoTheme(photoTheme);
//	    model.addAttribute("photos", photos);
//	    return "photoList"; // 這裡替換為列出按主題過濾的照片的JSP文件路徑
//	}

	// 删除照片
//	@DeleteMapping("/photos/{photoNo}")
//	public String deletePhoto(@PathVariable Integer photoNo) {
//		spService.deleteById(photoNo);
//	    // 可以在這裡添加刪除成功後的操作,例如重定向到列表頁面
//	    return "redirect:/photos"; // 這裡替換為重定向到照片列表頁面的路徑
//	}

}
