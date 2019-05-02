package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.ApprovalProjectMapper;
import com.hnu.scw.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;


/**
 * 审批处理相关的代码
 * @author scw
 *
 */
@Service
public class ProjectApplyImpl {
	@Autowired
	private ApprovalProjectMapper approvalProjectMapper;
	
	/**
	 * 查询审批流程 增加项目的时候进行选择
	 * @return
	 */
	public List<ApprovalProcess> findApproveProcess() {
		return approvalProjectMapper.findList();
	}

	/**
	 * 根据审批流程Id获取第一处理的节点名
	 * @param proceesId
	 * @return
	 */
	public String findFirstNodeNameByProcessId(Integer proceesId){
		return approvalProjectMapper.findFirstNodeName(proceesId);
	}

	/**
	 * 添加一条需要审批的数据到审批项目表中
	 * @param projectProcess
	 */
	public void saveOneProjectProcessInfo(ProjectProcess projectProcess){
		approvalProjectMapper.saveOneProjectProcessInfo(projectProcess);
	}

	/**
	 * 返回所有审批的项目
	 * @return
	 */
	public List<ProjectProcess> findAllProject(){
		return approvalProjectMapper.findAllProject();
	}

	/**
	 * 根据项目审批Id获取对应的详细信息
	 * @param projectProcessId
	 * @return
	 */
	public ProjectProcess findCurrentProjectDetail(Integer projectProcessId){
		return approvalProjectMapper.findCurrentProjectDetail(projectProcessId);
	}

	/**
	 * 查询对应审批项目和对应项目审批流程的相关详细信息
	 * @param projectProcessId
	 * @return
	 */
	public ProcessAndProject findDifferentContent(Integer projectProcessId){
		return approvalProjectMapper.findDifferentContent(projectProcessId);
	}

	/**
	 * 修改对应项目的审批状态
	 * @param processId
	 * @param projectType
	 */
	public void editProjectManagerStatus(Integer processId, String projectType){
		if("日常请假".equals(projectType)){
			approvalProjectMapper.editProjectManagerStatus(processId);
		}
	}

	/**
	 * 根据当前审批项目的ID和类型，获得对应操作的审批节点的信息ID
	 * @param projectProcess
	 * @return
	 */
	public Integer findCurrentNodeId(ProjectProcess projectProcess){
		return approvalProjectMapper.findCurrentNodeId(projectProcess);
	}

	/**
	 * 将审批细节的信息插入到数据表中（aproject_processdetail）
	 * @param projectProcessDetail
	 */
	public void saveProjectProceeDetail(ProjectProcessDetail projectProcessDetail){
		approvalProjectMapper.saveProjectProceeDetail(projectProcessDetail);
	}

	/**
	 * 将对应项目审批信息中的通过人数+1，并返回人数
	 * @param projectProcess
	 * @return
	 */
	public Integer findProjectDescriptionPassNumber(ProjectProcess projectProcess){
		return approvalProjectMapper.findProjectDescriptionPassNumber(projectProcess);
	}
	/**
	 * 将对应项目审批信息中的不通过人数+1，并返回人数
	 * @param projectProcess
	 * @return
	 */
	public Integer findProjectDescriptionRefuseNumber(ProjectProcess projectProcess){
		return approvalProjectMapper.findProjectDescriptionRefuseNumber(projectProcess);
	}

	/**
	 * 获取项目审批相关联表的详细信息
	 * @param projectProcess
	 * @return
	 */
	public RelativeInfoProject findRelativeInfo(ProjectProcess projectProcess){
		return approvalProjectMapper.findRelativeInfo(projectProcess);
	}

	/**
	 * 插入数据到项目审批流程表
	 * @param projectProcessDescription
	 */
	public void saveProjectProcessDescription(ProjectProcessDescription projectProcessDescription){
		approvalProjectMapper.saveProjectProcessDescription(projectProcessDescription);
	}

	/**
	 * 更新当前审批项目中不通过的人数字段信息
	 * @param projectProcess
	 */
	public void editProjectProcessRefuseNumber(ProjectProcess projectProcess){
		approvalProjectMapper.editProjectProcessRefuseNumber(projectProcess);
	}
	/**
	 * 根据项目审批表中的通过人数的字段信息
	 * @param projectProcess
	 */
	public void editProjectProcess(ProjectProcess projectProcess){
		approvalProjectMapper.editProjectProcess(projectProcess);
	}

	/**
	 * 判断当前审批完成的节点后是否还有后续需要审批的节点
	 * @param projectProcess
	 * @return
	 */
	public RelativeInfoProject findIfNextApprovalNode(ProjectProcess projectProcess){
		return approvalProjectMapper.findIfNextApprovalNode(projectProcess);
	}

	/**
	 * 更新审批项目中的通过人数和审批状态字段信息
	 * @param projectProcess
	 */
	public void editProjectProcessStatus(ProjectProcess projectProcess){
		approvalProjectMapper.editProjectProcessStatus(projectProcess);
	}

	/**
	 * 根据项目ID，修改项目审批的结果
	 * @param projectId:各自项目的ID ，
	 *        currentProcessType:项目的类型 ，
	 *        approResult：审批的结果---审批通过并且是否通过
	 */
	public void editAprojectManagerStatus(Integer projectId ,String currentProcessType ,String approResult){
		if("日常请假".equals(currentProcessType)){
			AssetAbandonManage assetAbandonManage = new AssetAbandonManage();
			assetAbandonManage.setId(projectId);
			assetAbandonManage.setApprove_status(approResult);
			approvalProjectMapper.editAprojectManagerStatus(assetAbandonManage);
		}
	}

	/**
	 * 更新当前的审批项目的下一个节点的内容
	 * @param projectProcess
	 */
	public void editProjectProcessCurrentNode(ProjectProcess projectProcess){
		approvalProjectMapper.editProjectProcessCurrentNode(projectProcess);
	}

	/**
	 * 将对应的审批项目的信息更新（因此此时相当于重新开始）
	 * @param projectProcess
	 */
	public void editCurrentProjectProcessContent(ProjectProcess projectProcess){
		approvalProjectMapper.editCurrentProjectProcessContent(projectProcess);
	}

	/**
	 * 根据项目进程ID，删除所有的项目明细表中的数据
	 * @param projectId
	 */
	public void editDeletProjectProcessDeatil(Integer projectId){
		approvalProjectMapper.editDeletProjectProcessDeatil(projectId);
	}

	/**
	 * 当重新返回到第一级流程处理的时候，需要将各个项目中的状态设置为“已提交”，这样能够方便各个项目对内容进行修改
	 * @param currentProjecttId：各个需要审批的项目ID
	 * @param currentProcessType：需要审批的项目的类型，是项目立项还是耗材申请，还是报废申请等
	 */
	public void editAgainDifferenProjectStatus(Integer currentProjecttId, String currentProcessType){
		//判断属于的是什么审批项目，这样处理的表也就会不一样
		//判断一下需要进行显示的数据是属于哪个表里面(因为审批项目中可能是在资产，报废和维修表中)
		if ("日常请假".equals(currentProcessType)) {
			approvalProjectMapper.editAgainDifferenProjectStatus(currentProjecttId);
		}
	}
	/**
	 * 根据节点ID，返回所有的审核人员的userid
	 * @param nodeId
	 * @return
	 */
	public List<String> findAllUserIdByNodeId(Integer nodeId){
		return approvalProjectMapper.findAllUserIdByNodeId(nodeId);
	}

	/**
	 * 根据审批人员ID，删除对应的项目明细表中之前的操作信息
	 * @param newProjectDetail
	 */
	public void editProjectProcessDetailByUserID(ProjectProcessDetail newProjectDetail) {
		approvalProjectMapper.editProjectProcessDetailByUserID(newProjectDetail);
	}

	/**
	 * 根据项目流程ID，更新项目流程的审批顺序的字段和通过人数和不通过人数信息
	 * @param projectId
	 */
	public void editProjectProcessLastOrderInfo(Integer projectId) {
		approvalProjectMapper.editProjectProcessLastOrderInfo(projectId);
	}

	/**
	 * 根据项目流程ID，更新当前节点的名字
	 * @param projectProcess
	 */
	public void editProjectProcessNodeName(ProjectProcess projectProcess) {
		approvalProjectMapper.editProjectProcessNodeName(projectProcess);
	}

	/**
	 * 根据项目流程ID，更新不通过人数和是否完成状态
	 * @param projectProcess
	 */
	public void editProjectProcessStatusFinished(ProjectProcess projectProcess){
		approvalProjectMapper.editProjectProcessStatusFinished(projectProcess);
	}
}
