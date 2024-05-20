package com.match.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.match.bean.MatchBean;
import com.match.service.MatchService;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MatchController {

    @Autowired
    private MatchService mService;
    
	@Autowired
	private UserService uService;
    
    
    @PostMapping("/like/{user2No}")
    public String likeUser(@PathVariable int user2No, HttpSession session,Model m) {
    	UserBean uBean = (UserBean)session.getAttribute("userData");

        int matchStatus = mService.likeUser(uBean.getUserNo(), user2No);
        
        if (matchStatus == 2) {
            // 如果 matchStatus 等於 2，代表這兩個用戶匹配成功，則執行相應的處理
            UserBean user1 = uService.getUserData(uBean.getUserNo());
            UserBean user2 = uService.getUserData(user2No);
            
            // 將用戶資料添加到 Model 對象中
            m.addAttribute("user1", user1);
            m.addAttribute("user2", user2);
            return "match/jsp/SuccessPage.jsp";          // 成功的jsp
        }else {
            return "/newMatchPage";
        }
    }

    @PostMapping("/dislike/{user2No}")
    public ResponseEntity<String> dislikeUser(@PathVariable int user2No, HttpSession session) {
    	UserBean uBean = (UserBean)session.getAttribute("userData");

        int matchStatus = mService.dislikeUser(uBean.getUserNo(), user2No);
        
        if (matchStatus == 3) {
            return ResponseEntity.ok("Match failed.");
        } else if (matchStatus == 1) {
            return ResponseEntity.ok("User disliked.");
        } else {
            return ResponseEntity.badRequest().body("Invalid user numbers.");
        }
    }
    

    @GetMapping("/successful")
    public ResponseEntity<List<MatchBean>> getSuccessfulMatches() {
        List<MatchBean> successfulMatches = mService.getSuccessfulMatches();
        return ResponseEntity.ok(successfulMatches);
    }
    
    
    
	// 查詢編號+姓名 for GoalsHP.jsp
    @GetMapping("/queryMatchNo")
    public String queryMatches(@RequestParam(required = false, name = "matchNo") Integer matchNo,
                               @RequestParam(required = false, name = "matchStatus") Integer matchStatus,
                               Model model) {
        List<MatchBean> matches;
        if (matchNo != null) {
            MatchBean bean = mService.getById(matchNo);
            matches = bean != null ? Collections.singletonList(bean) : Collections.emptyList();
        } else if (matchStatus != null) {
            matches = mService.findByMatchStatus(matchStatus);
        } else {
            matches = mService.findAll();
        }
        model.addAttribute("matches", matches);
        return "match/jsp/MatchHP.jsp";
    }
    
    
    
    
    //查詢全部
	@GetMapping("/matchHP")
	public String getAllMatches(Model model) {
	    List<MatchBean> matches = mService.findAll();
	    model.addAttribute("matches", matches);
	    return "match/jsp/MatchHP.jsp";
	}
    
	// 刷新全部頁面
	@GetMapping("/refreshMatches")
	public String refreshMatchesPage() {
	    return "redirect:/matchHP";
	}
	

	
	
}