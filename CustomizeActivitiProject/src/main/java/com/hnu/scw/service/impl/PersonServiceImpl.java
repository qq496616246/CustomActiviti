package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.PersonMapper;
import com.hnu.scw.pojo.Person;
import com.hnu.scw.pojo.User;
import com.hnu.scw.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:19 2018/6/15 0015
 * @ Description：person实体处理的service实现类
 * @ Modified By：
 * @Version: $version$
 */
@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonMapper personMapper;

    @Override
    public void addPerson(Person person) {
        personMapper.addPerson(person);
        //下面这个是特别用于测试事务配置是否成功的
        //因为配置文件中用的是xml配置事务，所以就不需要额外加@Transacitonal注解进行标识
        int a = 10 / 0 ;
    }
    @Override
    public List<Person> findPerson() {
        return personMapper.findPersonList();
    }

    @Override
    public void addUser(User user) {
        personMapper.addUser(user);
    }
}
