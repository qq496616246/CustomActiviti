package com.hnu.scw.pojo;
/**
 * 
 * @author scw
 *2017-09-21
 *function：项目流程的实体类，对应数据库中的aproject_process
 */
public class ProjectProcess {
	private Integer projectprocess_Id;  //项目流程表中ID
	private Integer project_Id ;  //项目ID
	private String project_Name;  //项目的审批内容主题
	private String project_Stryle = "需要"; //项目是否需要审批，默认需要审批
	private Integer current_NodeOrder; //当前审批节点的序号，标识是在第几个审批节点中
	private String process_FinishStatus ; //当前项目流程是否完成
	private Integer process_ApprovalId ; //选择的审批流程的ID
	private String process_ApprovalName ; //审批流程的名字
	private String current_NodeName ; //当前审批节点的名称
	private Integer description_Passnumber ; //当前审批节点通过的人数
	private Integer description_Refusenumber ; //当前审批节点拒绝通过的人数
	private String process_Type; //需要进行审批流程处理的审批类型，比如采购，报废，维修



	public String getProject_Name() {
		return project_Name;
	}

	public void setProject_Name(String project_Name) {
		this.project_Name = project_Name;
	}

	public String getProcess_Type() {
		return process_Type;
	}
	public void setProcess_Type(String process_Type) {
		this.process_Type = process_Type;
	}
	public Integer getDescription_Refusenumber() {
		return description_Refusenumber;
	}
	public void setDescription_Refusenumber(Integer description_Refusenumber) {
		this.description_Refusenumber = description_Refusenumber;
	}
	public Integer getDescription_Passnumber() {
		return description_Passnumber;
	}
	public void setDescription_Passnumber(Integer description_Passnumber) {
		this.description_Passnumber = description_Passnumber;
	}
	public Integer getProjectprocess_Id() {
		return projectprocess_Id;
	}
	public void setProjectprocess_Id(Integer projectprocess_Id) {
		this.projectprocess_Id = projectprocess_Id;
	}
	public Integer getProject_Id() {
		return project_Id;
	}
	public void setProject_Id(Integer project_Id) {
		this.project_Id = project_Id;
	}
	public String getProject_Stryle() {
		return project_Stryle;
	}
	public void setProject_Stryle(String project_Stryle) {
		this.project_Stryle = project_Stryle;
	}
	public Integer getCurrent_NodeOrder() {
		return current_NodeOrder;
	}
	public void setCurrent_NodeOrder(Integer current_NodeOrder) {
		this.current_NodeOrder = current_NodeOrder;
	}
	public String getProcess_FinishStatus() {
		return process_FinishStatus;
	}
	public void setProcess_FinishStatus(String process_FinishStatus) {
		this.process_FinishStatus = process_FinishStatus;
	}
	public Integer getProcess_ApprovalId() {
		return process_ApprovalId;
	}
	public void setProcess_ApprovalId(Integer process_ApprovalId) {
		this.process_ApprovalId = process_ApprovalId;
	}
	public String getProcess_ApprovalName() {
		return process_ApprovalName;
	}
	public void setProcess_ApprovalName(String process_ApprovalName) {
		this.process_ApprovalName = process_ApprovalName;
	}
	public String getCurrent_NodeName() {
		return current_NodeName;
	}
	public void setCurrent_NodeName(String current_NodeName) {
		this.current_NodeName = current_NodeName;
	}
	
	
	
}
