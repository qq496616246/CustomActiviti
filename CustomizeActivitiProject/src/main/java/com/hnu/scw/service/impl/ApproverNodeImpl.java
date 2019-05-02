package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.ApproverNodeMapper;
import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:19 2018/6/15 0015
 * @ Description：处理审批节点的操作
 * @ Modified By：
 * @Version: $version$
 */
@Service
public class ApproverNodeImpl {

    @Autowired
    private ApproverNodeMapper approverNodeMapper;

    /**
     * 添加审批节点
     * @param approverNode
     */
    public void saveApproNode(ApproverNode approverNode) {
        approverNodeMapper.saveapprovnode(approverNode);
    }

    /**
     * 查询节点表中一共有多少条数据，
     * @throws Exception
     * @return：返回最大的序号
     */
    public Integer findNumberNode(){
        return approverNodeMapper.findNumberNode();
    }

    /**
     * 添加审批节点顺序的管理
     * @param approverNodeOrder
     */
    public void saveApproNodeToPeople(ApproverNodeOrder approverNodeOrder){
        approverNodeMapper.saveApproNodeToPeople(approverNodeOrder);
    }
}
