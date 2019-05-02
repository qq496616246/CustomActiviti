package com.hnu.scw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnu.scw.pojo.Person;
import com.hnu.scw.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 2:15 2018/6/15 0015
 * @ Description：框架的构建是否成功的测试
 * @ Modified By：
 * @Version: $version$
 */
@Controller
public class MyTestController {

    @Autowired
    private PersonService personService;
    /**
     * 测试
     * @return
     */
    @RequestMapping(value = "test")
    public String testMyFirst(){
        return "user_toapprover";
    }
}
