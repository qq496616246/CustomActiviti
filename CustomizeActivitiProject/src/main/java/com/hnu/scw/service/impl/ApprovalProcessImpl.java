package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.ApprovalProcessMapper;
import com.hnu.scw.mapper.ApproverNodeMapper;
import com.hnu.scw.pojo.ApprovalProcess;
import com.hnu.scw.pojo.ApprovalProcessDetail;
import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:19 2018/6/15 0015
 * @ Description：处理审批流程的操作
 * @ Modified By：
 * @Version: $version$
 */
@Service
public class ApprovalProcessImpl {

    @Autowired
    private ApprovalProcessMapper approvalProcessMapper;

    /**
     * 添加审批节点
     * @param approvalProcess
     */
    public void saveProcessInfoData(ApprovalProcess approvalProcess) {
        approvalProcessMapper.saveProcessInfoData(approvalProcess);
    }

    /**
     * 查询流程表中一共有多少条数据，
     * @throws Exception
     * @return：返回最大的序号
     */
    public Integer findTotalNumber(){
        return approvalProcessMapper.findTotalNumber();
    }

    /**
     * 添加审批节点的管理
     * @param approvalProcessDetail
     */
    public void saveApprovalNode(ApprovalProcessDetail approvalProcessDetail){
        approvalProcessMapper.saveApprovalNode(approvalProcessDetail);
    }

}
