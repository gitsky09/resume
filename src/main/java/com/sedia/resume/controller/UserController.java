package com.sedia.resume.controller;

import com.sedia.resume.entity.UserEntity;
import com.sedia.resume.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController {

  final UserService service;

  @GetMapping("/user")
  public List<UserEntity> getUser(@AuthenticationPrincipal String username){
//    String username = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    return service.getUsers();
  }

  @PostMapping("/user")
  public UserEntity createUser(@RequestBody UserEntity user){
	  return service.save(user);
  }

  @GetMapping("/user/{id}")
  public UserEntity getUser(@PathVariable int id){
    return service.getUserById(id);
  }


}
