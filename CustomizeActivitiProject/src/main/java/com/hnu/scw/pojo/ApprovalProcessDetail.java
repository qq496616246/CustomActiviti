package com.hnu.scw.pojo;

import java.io.Serializable;

/**
 * 
 * @author scw
 * 2017-09-17
 * function：实体类对象，对应于数据库中的数据库sys_process_detail
 *
 */
public class ApprovalProcessDetail implements Serializable{
	
	private static final long seriaVersionUID = 1L;
	private Integer process_Id ;   //审批流程细节表自增ID
	private Integer processdetail_Id;   //审批流程号ID
	private Integer processdetail_NodeId; //审批流程对应的审批节点
	private Integer processdetail_Nodeorder; //审批节点对应的顺序
	private String processdetail_Back;  //标识该审批节点是否可回退
	
	
	
	private Integer getProcessdetail_Id() {
		return processdetail_Id;
	}
	public void setProcessdetail_Id(Integer processdetail_Id) {
		this.processdetail_Id = processdetail_Id;
	}
	public Integer getProcessdetail_NodeId() {
		return processdetail_NodeId;
	}
	public void setProcessdetail_NodeId(Integer processdetail_NodeId) {
		this.processdetail_NodeId = processdetail_NodeId;
	}
	public Integer getProcessdetail_Nodeorder() {
		return processdetail_Nodeorder;
	}
	public void setProcessdetail_Nodeorder(Integer processdetail_Nodeorder) {
		this.processdetail_Nodeorder = processdetail_Nodeorder;
	}
	public String getProcessdetail_Back() {
		return processdetail_Back;
	}
	public void setProcessdetail_Back(String processdetail_Back) {
		this.processdetail_Back = processdetail_Back;
	}
	public static long getSeriaversionuid() {
		return seriaVersionUID;
	}
	
	public Integer getProcess_Id() {
		return process_Id;
	}
	public void setProcess_Id(Integer process_Id) {
		this.process_Id = process_Id;
	}
	
	public ApprovalProcessDetail(Integer process_Id, Integer processdetail_Id, Integer processdetail_NodeId,
								 Integer processdetail_Nodeorder, String processdetail_Back) {
		super();
		this.process_Id = process_Id;
		this.processdetail_Id = processdetail_Id;
		this.processdetail_NodeId = processdetail_NodeId;
		this.processdetail_Nodeorder = processdetail_Nodeorder;
		this.processdetail_Back = processdetail_Back;
	}
	public ApprovalProcessDetail(){
		super();
	}

}
