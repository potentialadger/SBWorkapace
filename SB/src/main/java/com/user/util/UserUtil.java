package com.user.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class UserUtil {

	public UserUtil() {
	}
	
	public static String uploadImg(MultipartFile mf) {
		String filename = mf.getOriginalFilename();
		String extension = "";
		
		int i = filename.lastIndexOf('.');
		if(i >= 0) {
			extension = filename.substring(i);
		}
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		filename = "user" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_"
				+ raNumber + extension;
		
		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if(!pathexist.exists()) {
			pathexist.mkdirs();
		}
		
		File fileDirPath = new File(fileDir, filename);
		
		try {
			mf.transferTo(fileDirPath);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return filename;
	}

}


