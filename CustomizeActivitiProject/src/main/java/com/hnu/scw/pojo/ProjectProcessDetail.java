package com.hnu.scw.pojo;
/**
 * 
 * @author scw
 * 2017-09-22
 * function：项目审批细节表，对应数据库中的aproject_processdetail
 *
 */
public class ProjectProcessDetail {
	private Integer detail_Id; //细节表ID
	private Integer detail_ProcessId ; //对应项目的ID
	private String detail_ApproverContent ; //审批人给予的审批意见
	private String detail_ApproverUserID ; //审批人的ID
	private String detail_ApprovalTime; //审批人操作的时间
	private String detail_OptionResult;  //审批人操作的结果
	private Integer detail_CurrentNodeId ; //审批的当前的节点ID
	
	
	public Integer getDetail_CurrentNodeId() {
		return detail_CurrentNodeId;
	}
	public void setDetail_CurrentNodeId(Integer detail_CurrentNodeId) {
		this.detail_CurrentNodeId = detail_CurrentNodeId;
	}
	public Integer getDetail_Id() {
		return detail_Id;
	}
	public void setDetail_Id(Integer detail_Id) {
		this.detail_Id = detail_Id;
	}
	public Integer getDetail_ProcessId() {
		return detail_ProcessId;
	}
	public void setDetail_ProcessId(Integer detail_ProcessId) {
		this.detail_ProcessId = detail_ProcessId;
	}
	public String getDetail_ApproverContent() {
		return detail_ApproverContent;
	}
	public void setDetail_ApproverContent(String detail_ApproverContent) {
		this.detail_ApproverContent = detail_ApproverContent;
	}
	public String getDetail_ApproverUserID() {
		return detail_ApproverUserID;
	}
	public void setDetail_ApproverUserID(String detail_ApproverUserID) {
		this.detail_ApproverUserID = detail_ApproverUserID;
	}
	public String getDetail_ApprovalTime() {
		return detail_ApprovalTime;
	}
	public void setDetail_ApprovalTime(String detail_ApprovalTime) {
		this.detail_ApprovalTime = detail_ApprovalTime;
	}
	public String getDetail_OptionResult() {
		return detail_OptionResult;
	}
	public void setDetail_OptionResult(String detail_OptionResult) {
		this.detail_OptionResult = detail_OptionResult;
	}
	
	
}
