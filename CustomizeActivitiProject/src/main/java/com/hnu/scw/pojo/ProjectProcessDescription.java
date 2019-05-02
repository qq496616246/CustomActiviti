package com.hnu.scw.pojo;
/**
 * 
 * @author scw
 *2017-09-22
 *function：项目审批描述表,对应数据库中的aproject_prcessdescription
 */
public class ProjectProcessDescription {
	private Integer description_Id; //描述表的ID
	private String description_Time ; //进行描述操作的时间
	private String description_Content ; //进行描述的内容
	private Integer description_ProcessId ; //项目流程的ID
	public Integer getDescription_Id() {
		return description_Id;
	}
	public void setDescription_Id(Integer description_Id) {
		this.description_Id = description_Id;
	}
	public String getDescription_Time() {
		return description_Time;
	}
	public void setDescription_Time(String description_Time) {
		this.description_Time = description_Time;
	}
	public String getDescription_Content() {
		return description_Content;
	}
	public void setDescription_Content(String description_Content) {
		this.description_Content = description_Content;
	}

	public Integer getDescription_ProcessId() {
		return description_ProcessId;
	}
	public void setDescription_ProcessId(Integer description_ProcessId) {
		this.description_ProcessId = description_ProcessId;
	}
	
	
}
