package com.forum.frontdesk;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.forum.bean.CategoriesBean;
import com.forum.bean.PostsBean;
import com.forum.service.CategoriesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/postsFrontDesk")
public class FrontDeskPostsController {

	@Autowired
	private PostsServiceInterface postsService;

	@Autowired
	private CategoriesService categoriesService;

	// 前台 單筆關鍵字模糊查詢
	@GetMapping("/OnePosts")
	public String getPostsBeanKeyword(@RequestParam("postsBeanKeyword") String postsBeanKeyword, Model m) {
		List<PostsBean> postsList = postsService.getPostsBeanKeyword(postsBeanKeyword);
		if (postsList != null && !postsList.isEmpty()) {
			m.addAttribute("postsM", postsList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/frontdesk/posts/jsp/UserHome.jsp";
	}

	// 前台 全部查詢
	@GetMapping("/AllPosts")
	public String getAllPosts(Model m) {

		List<PostsBean> postsList = postsService.getAllPosts();

		m.addAttribute("postsM", postsList);

		return "/forum/frontdesk/posts/jsp/UserHome.jsp";
	}

	// 前台 新增用的取得分類版
	@GetMapping("/InsertPostsCategories")
	public String getAllCategoriesToJsp(Model m) {

		List<CategoriesBean> categoriesBeans = categoriesService.getAllCategories();

		m.addAttribute("categoriesList", categoriesBeans);

		return "/forum/backstage/posts/jsp/InsertPosts.jsp(要改成前台)";
	}

	// 前台 新增
	@PostMapping("/InsertPosts")
	public String insertPosts(@RequestParam("category_no") int category_no, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("image_url") MultipartFile image_url,
			HttpSession session) {

		UserBean userData = (UserBean) session.getAttribute("userData");

		CategoriesBean category = categoriesService.getCategoryNo(category_no);

		PostsBean posts = new PostsBean();
		posts.setUserBean(userData);
		posts.setCategoriesBean(category);
		posts.setTitle(title);
		posts.setContent(content);
		posts.setUpdate_date(new Date());

		try {

			// 從上傳的文件 image_url 中獲取原始文件名。
			String fileName = image_url.getOriginalFilename();
			// 以下判斷是為了過濾掉非圖檔的 檔案 只要.jpg, .png, .pdf 等
			// 創建一個空字符串來保存文件的擴展名 例如 .jpg, .png, .pdf 等 用於識別文件的類型。
			String SaveFileType = "";
			// 找到最後一個點的索引位置 例:example.txt =從e開始0123456(7)為點的位置
			int i = fileName.lastIndexOf('.');
			// 如果找到了擴展名，則從文件名中截取擴展名部分 從索引位置點開始取 = .txt
			if (i >= 0) {
				SaveFileType = fileName.substring(i);
			}
			// 生成一個隨機數，作為文件名的一部分，以避免文件名衝突 增加一個辨別條件(怕兩個人上傳同樣名稱之類的檔案的情況)
			Random random = new Random();
			int raNumber = random.nextInt(10000);

			// 獲取當前日期和時間
			Date currentDate = new Date();
			// 定義日期格式
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			// 將日期格式化為字符串
			String formattedDate = formatter.format(currentDate);
			// 構建新的文件名，將格式化後的日期、隨機數和擴展名組合在一起 成為此檔案新的辨別的方式
			fileName = formattedDate + "_" + raNumber + SaveFileType;
			// 指定文件上傳的目錄路徑
			String fileDir = "C:/temp/upload/";
			// 創建一個文件，把路徑跟新的檔案辨別名稱加上去。
			File fileDirPath = new File(fileDir, fileName);

			image_url.transferTo(fileDirPath);

			posts.setImage_url(fileName);

			postsService.insertPosts(posts);

			return "redirect:/posts/AllPosts(跳回所有文章或剛發的該筆文章)";

		} catch (

		IOException e) {
			e.printStackTrace();
			// 如果發生 IO 錯誤，提示用戶文件上傳失敗 前台還要再做一個頁面
			return "redirect:/posts/error?message=文件上傳失敗";
		}
	}

	// 前台 刪除
	@DeleteMapping("/DeletePosts")
	public String deletePosts(@RequestParam("postsNo") String postsNo) {

		postsService.deletePosts(Integer.parseInt(postsNo));

		return "redirect:/posts/AllPosts(要跳回所有文章)";

	}

	// 前台 更新用查詢和分類
	@GetMapping("/UpdateSelectPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, Model m) {

		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));
		m.addAttribute("updateSelect", posts);

		List<CategoriesBean> categoriesList = categoriesService.getAllCategories();

		m.addAttribute("categoriesList", categoriesList);

		return "/forum/backstage/posts/jsp/UpdatePosts.jsp";

	}

	// 前台 更新
	@PutMapping("/UpdatePosts")
	public String updatePosts(@RequestParam("post_no") Integer post_no, @RequestParam("user_no") int user_no,
			@RequestParam("category_no") int category_no, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("image_url") MultipartFile image_url,
			@RequestParam("update_date") String update_date, HttpSession session) {

		try {

			UserBean userData = (UserBean) session.getAttribute("userData");

			CategoriesBean category = categoriesService.getCategoryNo(category_no);

			PostsBean postsToUpdate = postsService.getPostsNo(post_no);

			postsToUpdate.setUserBean(userData);
			postsToUpdate.setCategoriesBean(category);
			postsToUpdate.setTitle(title);
			postsToUpdate.setContent(content);
			postsToUpdate.setUpdate_date(new Date());

			// 從上傳的文件 image_url 中獲取原始文件名。
			String fileName = image_url.getOriginalFilename();
			// 以下判斷是為了過濾掉非圖檔的 檔案 只要.jpg, .png, .pdf 等
			// 創建一個空字符串來保存文件的擴展名 例如 .jpg, .png, .pdf 等 用於識別文件的類型。
			String SaveFileType = "";
			// 找到最後一個點的索引位置 例:example.txt =從e開始0123456(7)為點的位置
			int i = fileName.lastIndexOf('.');
			// 如果找到了擴展名，則從文件名中截取擴展名部分 從索引位置點開始取 = .txt
			if (i >= 0) {
				SaveFileType = fileName.substring(i);
			}
			// 生成一個隨機數，作為文件名的一部分，以避免文件名衝突 增加一個辨別條件(怕兩個人上傳同樣名稱之類的檔案的情況)
			Random random = new Random();
			int raNumber = random.nextInt(10000);

			// 獲取當前日期和時間
			Date currentDate = new Date();
			// 定義日期格式
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			// 將日期格式化為字符串
			String formattedDate = formatter.format(currentDate);
			// 構建新的文件名，將格式化後的日期、隨機數和擴展名組合在一起 成為此檔案新的辨別的方式
			fileName = formattedDate + "_" + raNumber + SaveFileType;
			// 指定文件上傳的目錄路徑
			String fileDir = "C:/temp/upload/";
			// 創建一個文件，把路徑跟新的檔案辨別名稱加上去。
			File fileDirPath = new File(fileDir, fileName);

			image_url.transferTo(fileDirPath);

			postsToUpdate.setImage_url(fileName);

			postsService.updatePosts(postsToUpdate);

			return "redirect:/posts/AllPosts(要跳出更新成功)";

		} catch (IOException e) {
			e.printStackTrace();
			// 如果發生 IO 錯誤，提示用戶文件上傳失敗 這個再看可不可以刪除
			return "redirect:/posts/error?message=文件上傳失敗";
		}
	}
	
	// 瀏覽次數
	@GetMapping("/SelectPosts")
	public String getPosts(@RequestParam("postsNo") String postsNo, Model m) {
	    
		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));
	    
	    // 更新瀏覽次數
	    int newViewCount = posts.getView_count() + 1;
	    
	    posts.setView_count(newViewCount);
	    // 把更新的文章插入資料庫
	    postsService.updatePosts(posts);

	    m.addAttribute("updateSelect", posts);

	    return "前台用單筆查詢";
	}

}
