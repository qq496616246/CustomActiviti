package com.hnu.scw.pojo;

/**
 * 日常请假的实体类
 */
public class AssetAbandonManage implements java.io.Serializable{

	private Integer id;
	//是什么类型的项目（我这里自然就是日常请假了，如果还有财务审批，那么就是财务审批）
	private String process_Type;
	//请假的主题
	private String project_Name;
	//请假的原因
	private String abandon_reason;
	//审批流程的名字
	private String abandon_approve;
	//审批状态，默认是已提交
	private String approve_status = "已提交";

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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAbandon_reason() {
		return abandon_reason;
	}

	public void setAbandon_reason(String abandon_reason) {
		this.abandon_reason = abandon_reason;
	}

	public String getAbandon_approve() {
		return abandon_approve;
	}

	public void setAbandon_approve(String abandon_approve) {
		this.abandon_approve = abandon_approve;
	}

	public String getApprove_status() {
		return approve_status;
	}

	public void setApprove_status(String approve_status) {
		this.approve_status = approve_status;
	}
}
