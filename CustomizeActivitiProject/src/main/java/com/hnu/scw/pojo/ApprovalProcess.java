package com.hnu.scw.pojo;

import java.io.Serializable;

/**
 * 
 * @author scw
 *2017-09-17
 *function：作为实体类对象，对应数据库中的审批流程表sys_process_approval
 */
public class ApprovalProcess {
	private Integer process_Id;  //审批流程的ID，自增
	private String process_Name; //审批流程的名称
	private String process_Content;  //审批流程的内容
	private String process_Type;   //审批流程的类型

	public Integer getProcess_Id() {
		return process_Id;
	}
	public void setProcess_Id(Integer process_Id) {
		this.process_Id = process_Id;
	}
	public String getProcess_Name() {
		return process_Name;
	}
	public void setProcess_Name(String process_Name) {
		this.process_Name = process_Name;
	}
	public String getProcess_Content() {
		return process_Content;
	}
	public void setProcess_Content(String process_Content) {
		this.process_Content = process_Content;
	}
	public String getProcess_Type() {
		return process_Type;
	}
	public void setProcess_Type(String process_Type) {
		this.process_Type = process_Type;
	}
	
	
	
}
