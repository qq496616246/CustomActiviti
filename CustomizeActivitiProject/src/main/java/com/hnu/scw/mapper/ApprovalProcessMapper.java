package com.hnu.scw.mapper;
import com.hnu.scw.pojo.ApprovalProcess;
import com.hnu.scw.pojo.ApprovalProcessDetail;
import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:21 2018/6/15 0015
 * @ Description：对应于审批流程的mapper操作接口
 * @ Modified By：
 * @Version: $version$
 */
public interface ApprovalProcessMapper {
    /**
     * 添加一个审批流程实体
     * @param approvalProcess
     */
    public void saveProcessInfoData(ApprovalProcess approvalProcess);

    Integer findTotalNumber();

    /**
     * 添加对应审批流程的审批节点的详细信息
     * @param approvalProcessDetail
     */
    void saveApprovalNode(ApprovalProcessDetail approvalProcessDetail);
}
