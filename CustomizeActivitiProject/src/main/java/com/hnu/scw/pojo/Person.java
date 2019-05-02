package com.hnu.scw.pojo;

import java.io.Serializable;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 2:14 2018/6/15 0015
 * @ Description：定义一个‘人’的实体类
 * @ Modified By：
 * @Version: $version$
 */
public class Person implements Serializable{
    private Integer id;
    private String name;

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

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
