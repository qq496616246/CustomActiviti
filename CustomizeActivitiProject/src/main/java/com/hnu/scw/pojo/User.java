package com.hnu.scw.pojo;

import java.sql.Date;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 1:13 2018/7/1 0001
 * @ Description：定义个user用户类
 * @ Modified By：
 * @Version: $version$
 */
public class User {
    private Integer id;
    private String name ;
    private Integer age;
    private Date birthday;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", birthday=" + birthday +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
