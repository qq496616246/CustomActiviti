package com.hnu.scw.pojo;
/**
 * 
 * function：审批节点的实体类
 * @author scw
 *2017-09-14
 */
public class ApproverNode {
	public Integer node_Id;  //节点序号
	public String node_Name; //节点名字
	public Integer node_PassNumber; //节点最小需要通过人数
	public Integer node_TotalNumber;  //节点的总人数
	public String node_Description; //节点的描述
	public Integer getNode_Id() {
		return node_Id;
	}
	public void setNode_Id(Integer node_Id) {
		this.node_Id = node_Id;
	}
	public String getNode_Name() {
		return node_Name;
	}
	public void setNode_Name(String node_Name) {
		this.node_Name = node_Name;
	}
	public Integer getNode_PassNumber() {
		return node_PassNumber;
	}
	public void setNode_PassNumber(Integer node_PassNumber) {
		this.node_PassNumber = node_PassNumber;
	}
	public Integer getNode_TotalNumber() {
		return node_TotalNumber;
	}
	public void setNode_TotalNumber(Integer node_TotalNumber) {
		this.node_TotalNumber = node_TotalNumber;
	}
	public String getNode_Description() {
		return node_Description;
	}
	public void setNode_Description(String node_Description) {
		this.node_Description = node_Description;
	}

	
}
