
package com.sedia.resume.service;

import com.sedia.resume.entity.SkillEntity;
import com.sedia.resume.entity.UserEntity;
import com.sedia.resume.exception.ApiException;
import com.sedia.resume.repository.SkillMapper;
import com.sedia.resume.repository.UserMapper;

import lombok.RequiredArgsConstructor;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class SkillService {

    final SkillMapper skillMapper;
    
   // final BCryptPasswordEncoder passwordEncoder;
    



//    //??
//    public EducationEntity save(EducationEntity school) {
//        if (education.findByEducationname(school.name()).isEmpty()) {
//        //	education.setSchool(passwordEncoder.encode(education.getPassword()));
//        	school.setCreateDate(LocalDateTime.now());
//        	education.save(school);
//            return school;
//        }
//        throw new RuntimeException("account already exists");
//    }
    
    
  
    
    // 檢查技能是否存在
    public boolean checkSkill(int id, int uid) {
		skillMapper.findBySkillId(id, uid).orElseThrow(() -> new RuntimeException("找不到 Skill"));
		return true;
    }

    // 取得技能
    public SkillEntity getSkill(int id, int uid) {
		return skillMapper.findBySkillId(id, uid).orElseThrow(() -> new RuntimeException("找不到 Skill"));
    }
    
    // 取得技能清單技能
    public List<SkillEntity> getSkillList(int uid) {
        return skillMapper.findAll(uid);
    }
    
    // 編輯技能
    public void updateSkill(SkillEntity skill) {    
    	skillMapper.updateSkill(skill);
    }
    
    // 新增技能
    public SkillEntity insertSkill(SkillEntity skill) { 
    	skillMapper.insertSkill(skill);
		return skill;
    }
    
    // 刪除技能
    public boolean deleteSkill(int id, int uid) { 
    	skillMapper.deleteSkill(id, uid);
		return true;
    }
    
}