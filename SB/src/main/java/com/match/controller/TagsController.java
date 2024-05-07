package com.match.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.match.bean.TagsBean;
import com.match.service.TagsService;
import com.user.bean.UserBean;

@Controller
public class TagsController {

    @Autowired
    private TagsService tagsService;

    // 查詢標籤編號 + 名稱
    @GetMapping("/queryTag")
    public String queryTags(@RequestParam(required = false, name = "tagNo") Integer tagNo,
                            @RequestParam(required = false, name = "tagName") String tagName,
                            Model model) {
        List<TagsBean> tags;
        if (tagNo != null) {
            TagsBean tag = tagsService.getTagById(tagNo);
            tags = tag != null ? Collections.singletonList(tag) : Collections.emptyList();
        } else if (tagName != null && !tagName.isEmpty()) {
            tags = tagsService.findByTagName(tagName);
        } else {
            tags = tagsService.findAll();
        }
        model.addAttribute("tags", tags);
        return "match/jsp/TagsHP.jsp";
    }

    // 查詢所有標籤
    @GetMapping("/tagsHP")
    public String showTagsPage(Model model) {
        List<TagsBean> tags = tagsService.findAll();
        model.addAttribute("tags", tags);
        return "match/jsp/TagsHP.jsp";
    }

    // 重新加載標籤頁面
    @GetMapping("/refreshTags")
    public String refreshTagsPage() {
        return "redirect:tagsHP";
    }

    // 新增標籤
    @PostMapping("/tags")
    public String createTag(@RequestParam("tagNameParam") String tagNameParam) {
        TagsBean newTag = new TagsBean(tagNameParam);
        tagsService.insert(newTag);
        return "redirect:tagsHP";
    }

    // 刪除標籤
    @DeleteMapping("/deleteTag/{tagNo}")
    public String deleteTag(@PathVariable("tagNo") int tagNo) {
        tagsService.deleteById(tagNo);
        return "redirect:/tagsHP";
    }

    // 批量刪除標籤
    @PostMapping("/deleteBatchTags")
    public String deleteBatchTags(@RequestParam("tagNos") List<Integer> tagNos) {
        if (!tagNos.isEmpty()) {
            for (Integer tagNo : tagNos) {
                tagsService.deleteById(tagNo);
            }
        }
        return "redirect:/tagsHP";
    }

    // 查詢欲修改的標籤
    @GetMapping("/updateTag/{tagNo}")
    public String queryUpdateTagById(@PathVariable("tagNo") int tagNo, Model model) {
        TagsBean tag = tagsService.getTagById(tagNo);
        model.addAttribute("tag", tag);
        return "match/jsp/TagsHP.jsp";
    }

    // 修改標籤
    @PutMapping("/updateTag/{tagNo}")
    public String updateTag(@PathVariable("tagNo") int tagNo,
                            @RequestParam("tagName") String tagName) {
        TagsBean updatedTag = new TagsBean(tagNo, tagName);
        tagsService.update(updatedTag);
        return "redirect:/tagsHP";
    }
    
    
    
    
    //---ManyToMany
    
    @GetMapping(path = "/findTag/{tagNo}.json", produces = "application/json;charset=UTF-8")
    ResponseEntity<TagsBean> TagsBean(@PathVariable("tagNo") Integer tagNo) {
    Optional<TagsBean> opTag = tagsService.getOneById(tagNo);
    if (opTag.isPresent()) {
    return ResponseEntity.ok(opTag.get());
    }
    return ResponseEntity.notFound().build(); 
    }
    
	

    
	
	//-------Test-----------
	
    
//    @GetMapping("/{tagNo}/users")
//    public String getUsersForTag(@PathVariable Integer tagNo, Model model) {
//        Set<UserBean> users = tagsService.getUsersForTag(tagNo);
//        model.addAttribute("tagNo", tagNo);
//        model.addAttribute("users", users);
//        return "users";
//    }
//    
//    @GetMapping("/findByTagNo")
//    public String showFindByTagNoPage(Model model) {
//        // 如果需要在页面上显示初始数据,可以在这里准备数据并添加到 Model 中
//        return "match/jsp/FindByTagNo.jsp";
//    }

}