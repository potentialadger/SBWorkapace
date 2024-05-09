package com.match.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.match.bean.MatchBean;
import com.match.service.MatchService;

@Controller
public class MatchController {

    @Autowired
    private MatchService mService;

    @PostMapping("/{user1No}/{user2No}/like")
    public ResponseEntity<String> likeUser(@PathVariable int user1No, @PathVariable int user2No) {
        int matchStatus = mService.likeUser(user1No, user2No);
        if (matchStatus == 2) {
            return ResponseEntity.ok("Match successful!");
        } else if (matchStatus == 3) {
            return ResponseEntity.ok("Match failed.");
        } else {
            return ResponseEntity.badRequest().body("Invalid user numbers.");
        }
    }

    @PostMapping("/{user1No}/{user2No}/dislike")
    public ResponseEntity<String> dislikeUser(@PathVariable int user1No, @PathVariable int user2No) {
        int matchStatus = mService.dislikeUser(user1No, user2No);
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
}