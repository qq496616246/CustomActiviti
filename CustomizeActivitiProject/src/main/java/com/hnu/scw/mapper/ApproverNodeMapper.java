package com.hnu.scw.mapper;
import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:21 2018/6/15 0015
 * @ Description：对应于审批节点的mapper操作接口
 * @ Modified By：
 * @Version: $version$
 */
public interface ApproverNodeMapper {
    /**
     * 添加一个审批节点实体
     * @param approverNode
     */
    void saveapprovnode(ApproverNode approverNode);

    Integer findNumberNode ();

    void saveApproNodeToPeople(ApproverNodeOrder approverNodeOrder);
}
