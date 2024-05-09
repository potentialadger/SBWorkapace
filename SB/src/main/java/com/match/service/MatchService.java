package com.match.service;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.match.bean.MatchBean;
import com.match.repository.MatchRepository;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class MatchService {

    @Autowired
    private MatchRepository matchRepos;

    public int likeUser(int user1No, int user2No) {
        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);

        if (match == null) {
            // 創建新的配對記錄
            match = new MatchBean(user1No, user2No, LocalDateTime.now());
            match.setMatchStatus(0); // 喜歡
            match = matchRepos.save(match);

            if (oppositeMatch != null && oppositeMatch.getMatchStatus() == 0) {
                // 對方之前也喜歡該用戶
                match.setMatchStatus(2); // 配對成功
                oppositeMatch.setMatchStatus(2);
                match.setMatchedAt(LocalDateTime.now());
                oppositeMatch.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                matchRepos.save(oppositeMatch);
                return 2;
            }
        } else {
            // 如果之前已經存在記錄，則對方已經作出回應
            if (oppositeMatch != null) {
                if (oppositeMatch.getMatchStatus() == 0) {
                    // 對方之前也喜歡該用戶
                    match.setMatchStatus(2); // 配對成功
                    oppositeMatch.setMatchStatus(2);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 2;
                } else {
                    // 對方之前不喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                }
            }
        }

        return 0; // 配對中
    }

    
    // 配對不成功會將"不喜歡"改為"配對失敗"
    public int dislikeUser(int user1No, int user2No) {
        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);

        if (match == null) {
            // 創建新的配對記錄
            match = new MatchBean(user1No, user2No, LocalDateTime.now());
            match.setMatchStatus(1); // 不喜歡
            match = matchRepos.save(match);

            if (oppositeMatch != null && oppositeMatch.getMatchStatus() == 1) {
                // 對方之前也不喜歡該用戶
                match.setMatchStatus(3); // 配對失敗
                oppositeMatch.setMatchStatus(3);
                match.setMatchedAt(LocalDateTime.now());
                oppositeMatch.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                matchRepos.save(oppositeMatch);
                return 3;
            }
        } else {
            if (oppositeMatch != null) {
                if (oppositeMatch.getMatchStatus() == 1) {
                    // 對方之前也不喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                } else {
                    // 對方之前喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                }
            } else {
                // 對方還沒有作出回應
                match.setMatchStatus(1); // 不喜歡
                match.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                return 1;
            }
        }

        return 1; // 不喜歡
    }

    public List<MatchBean> getSuccessfulMatches() {
        return matchRepos.findByMatchStatus(2); // 獲取 MatchStatus 為 2 (配對成功) 的記錄
    }
}





//----配對不成功會維持原狀，"不喜歡"



//package com.match.service;
//
//import java.time.LocalDateTime;
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import com.match.bean.MatchBean;
//import com.match.repository.MatchRepository;
//import jakarta.transaction.Transactional;
//
//@Service
//@Transactional
//public class MatchService {
//
//    @Autowired
//    private MatchRepository matchRepos;
//
//    public int likeUser(int user1No, int user2No) {
//        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
//        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);
//
//        if (match == null) {
//            // 創建新的配對紀錄
//            match = new MatchBean(user1No, user2No, LocalDateTime.now());
//            match.setMatchStatus(0); // 喜歡
//            match = matchRepos.save(match);
//
//            if (oppositeMatch != null && oppositeMatch.getMatchStatus() == 0) {
//                // 對方之前也喜歡該使用者
//                match.setMatchStatus(2); // 配對成功
//                oppositeMatch.setMatchStatus(2);
//                match.setMatchedAt(LocalDateTime.now());
//                oppositeMatch.setMatchedAt(LocalDateTime.now());
//                matchRepos.save(match);
//                matchRepos.save(oppositeMatch);
//                return 2;
//            }
//        } else {
//            // 如果之前已經存在記錄，則對方已經作出回應
//            if (oppositeMatch != null) {
//                if (oppositeMatch.getMatchStatus() == 0) {
//                    // 對方之前也喜歡該使用者
//                    match.setMatchStatus(2); // 配對成功
//                    oppositeMatch.setMatchStatus(2);
//                    match.setMatchedAt(LocalDateTime.now());
//                    oppositeMatch.setMatchedAt(LocalDateTime.now());
//                    matchRepos.save(match);
//                    matchRepos.save(oppositeMatch);
//                    return 2;
//                } else {
//                    // 對方之前不喜歡該使用者
//                    match.setMatchStatus(3); // 配對失敗
//                    oppositeMatch.setMatchStatus(3);
//                    match.setMatchedAt(LocalDateTime.now());
//                    oppositeMatch.setMatchedAt(LocalDateTime.now());
//                    matchRepos.save(match);
//                    matchRepos.save(oppositeMatch);
//                    return 3;
//                }
//            }
//        }
//
//        return 0; // 配對中
//    }
//
//    public int dislikeUser(int user1No, int user2No) {
//        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
//        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);
//
//        if (match == null) {
//            // 創建新的配對紀錄
//            match = new MatchBean(user1No, user2No, LocalDateTime.now());
//            match.setMatchStatus(1); // 不喜歡
//            match = matchRepos.save(match);
//        } else {
//            if (oppositeMatch != null) {
//                if (oppositeMatch.getMatchStatus() == 0) {
//                    // 對方之前喜歡該使用者
//                    match.setMatchStatus(3); // 配對失敗
//                    oppositeMatch.setMatchStatus(3);
//                    match.setMatchedAt(LocalDateTime.now());
//                    oppositeMatch.setMatchedAt(LocalDateTime.now());
//                    matchRepos.save(match);
//                    matchRepos.save(oppositeMatch);
//                    return 3;
//                } else {
//                    // 對方之前也不喜歡該使用者
//                    match.setMatchStatus(3); // 配對失敗
//                    oppositeMatch.setMatchStatus(3);
//                    match.setMatchedAt(LocalDateTime.now());
//                    oppositeMatch.setMatchedAt(LocalDateTime.now());
//                    matchRepos.save(match);
//                    matchRepos.save(oppositeMatch);
//                    return 3;
//                }
//            } else {
//                // 對方還沒有作出回應
//                match.setMatchStatus(1); // 不喜歡
//                match.setMatchedAt(LocalDateTime.now());
//                matchRepos.save(match);
//                return 1;
//            }
//        }
//
//        return 1; // 不喜歡
//    }
//
//    public List<MatchBean> getSuccessfulMatches() {
//        return matchRepos.findByMatchStatus(2); // 獲取 MatchStatus 為 2（配對成功）的記錄
//    }
//}