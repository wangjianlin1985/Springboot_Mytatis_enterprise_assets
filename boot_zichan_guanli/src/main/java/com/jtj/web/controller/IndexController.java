package com.jtj.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by me
 * 2018/3/13.
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String index(){
        return "about";
    }

}
