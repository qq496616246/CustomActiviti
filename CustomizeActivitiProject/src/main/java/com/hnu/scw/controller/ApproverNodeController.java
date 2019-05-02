package com.hnu.scw.controller;

import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;
import com.hnu.scw.service.impl.ApproverNodeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:08 2019/4/28 0028
 * @ Description：审批节点的管理
 * @ Modified By：
 * @Version: $version$
 */
@Controller
public class ApproverNodeController {

    @Autowired
    private ApproverNodeImpl approverNodeImpl;

    /**
     * 跳转到添加审批节点的界面
     * @return
     */
    @RequestMapping(value = "/showapprovernode")
    public String showApproverPage(){
        return "asystem_appnode_list";
    }

    /**
     * 处理添加节点的操作
     * @return
     * @throws Exception
     */
    @RequestMapping(value ="/asystem_saveapprovernode")
    public String editApproverNode(String saveapproverid, ApproverNode approverNode) {
        //首先得到所有提交过来的userid的内容，因为在jsp之前用"-"进行的分割
        String users = saveapproverid;
        String[] useridOne =  users.split("-");//得到单个的审核人员的ID

        //进行插入数据的处理，分别要插入到两张表中，sys_approvnodepeople和sys_approvnode
        approverNodeImpl.saveApproNode(approverNode);  //插入到审核节点表中

        //查询数据库中节点数据的最大ID的数字（因为这样才知道当前的节点ID，方便节点管理表中得到该新增条目的序号）
        Integer number =  approverNodeImpl.findNumberNode();

        //循环遍历插入（下标从1开始，因为分割后第一个是为空的，之前这样处理了）
        for(int i =1 ; i <useridOne.length ; i++){
            ApproverNodeOrder approverNodeOrder = new ApproverNodeOrder();
            approverNodeOrder.setApprovnode_nodeId(number);
            approverNodeOrder.setApprovnode_UserId(useridOne[i]);
            approverNodeOrder.setApprovnode_Order(i);
            //插入数据到审核节点对应的顺序表中
            approverNodeImpl.saveApproNodeToPeople(approverNodeOrder);
        }
        return "success";
    }

}
