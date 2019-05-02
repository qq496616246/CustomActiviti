package com.hnu.scw.mapper;
import com.hnu.scw.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:21 2018/6/15 0015
 * @ Description：对应于审批项目的mapper操作接口
 * @ Modified By：
 * @Version: $version$
 */
public interface ApprovalProjectMapper {
    /**
     * 查询系统的所有审批流程内容
     * @return
     */
    List<ApprovalProcess> findList();

    /**
     * 根据流程ID获取第一个审批节点
     * @param proceesId
     * @return
     */
    String findFirstNodeName(Integer proceesId);

    /**
     * 插入一条项目审批数据到项目审批数据库中
     * @param projectProcess
     */
    void saveOneProjectProcessInfo(ProjectProcess projectProcess);

    /**
     * 返回所有需要审批的项目
     * @return
     */
    List<ProjectProcess> findAllProject();

    ProjectProcess findCurrentProjectDetail(Integer projectProcessId);

    ProcessAndProject findDifferentContent(@Param(value = "projectprocess_Id") Integer projectProcessId);

    void editProjectManagerStatus(Integer processId);

    Integer findCurrentNodeId(ProjectProcess projectProcess);

    void saveProjectProceeDetail(ProjectProcessDetail projectProcessDetail);

    Integer findProjectDescriptionPassNumber(ProjectProcess projectProcess);

    Integer findProjectDescriptionRefuseNumber(ProjectProcess projectProcess);

    RelativeInfoProject findRelativeInfo(ProjectProcess projectProcess);

    void saveProjectProcessDescription(ProjectProcessDescription projectProcessDescription);

    void editProjectProcess(ProjectProcess projectProcess);

    RelativeInfoProject findIfNextApprovalNode(ProjectProcess projectProcess);

    void editProjectProcessStatus(ProjectProcess projectProcess);

    void editAprojectManagerStatus(AssetAbandonManage assetAbandonManage);

    void editProjectProcessCurrentNode(ProjectProcess projectProcess);

    void editProjectProcessRefuseNumber(ProjectProcess projectProcess);

    void editCurrentProjectProcessContent(ProjectProcess projectProcess);

    void editDeletProjectProcessDeatil(Integer projectId);

    void editAgainDifferenProjectStatus(Integer currentProjecttId);

    List<String> findAllUserIdByNodeId(Integer nodeId);

    void editProjectProcessDetailByUserID(ProjectProcessDetail newProjectDetail);

    void editProjectProcessLastOrderInfo(Integer projectId);

    void editProjectProcessNodeName(ProjectProcess projectProcess);

    void editProjectProcessStatusFinished(ProjectProcess projectProcess);
}

