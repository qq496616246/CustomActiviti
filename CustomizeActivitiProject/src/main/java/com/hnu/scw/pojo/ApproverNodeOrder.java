package com.hnu.scw.pojo;
/**
 * 
 * @author scw
 * 2017-09-14
 *function：对于审批节点对应的实体类，节点管理
 */
public class ApproverNodeOrder {
	public Integer approvnode_Id;  //节点管理序号，主键
	public String approvnode_UserId; //节点对应的用户ID
	public Integer approvnode_Order; //节点用户对应的序号
	public Integer approvnode_nodeId; //节点的序号ID，外键
	public Integer getApprovnode_Id() {
		return approvnode_Id;
	}
	public void setApprovnode_Id(Integer approvnode_Id) {
		this.approvnode_Id = approvnode_Id;
	}
	public String getApprovnode_UserId() {
		return approvnode_UserId;
	}
	public void setApprovnode_UserId(String approvnode_UserId) {
		this.approvnode_UserId = approvnode_UserId;
	}
	public Integer getApprovnode_Order() {
		return approvnode_Order;
	}
	public void setApprovnode_Order(Integer approvnode_Order) {
		this.approvnode_Order = approvnode_Order;
	}
	public Integer getApprovnode_nodeId() {
		return approvnode_nodeId;
	}
	public void setApprovnode_nodeId(Integer approvnode_nodeId) {
		this.approvnode_nodeId = approvnode_nodeId;
	}
	
	
}
