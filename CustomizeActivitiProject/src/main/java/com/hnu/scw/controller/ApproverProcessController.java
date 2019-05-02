package com.hnu.scw.controller;

import com.hnu.scw.pojo.ApprovalProcess;
import com.hnu.scw.pojo.ApprovalProcessDetail;
import com.hnu.scw.pojo.ApproverNode;
import com.hnu.scw.pojo.ApproverNodeOrder;
import com.hnu.scw.service.impl.ApprovalProcessImpl;
import com.hnu.scw.service.impl.ApproverNodeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:08 2019/4/28 0028
 * @ Description：审批流程的管理
 * @ Modified By：
 * @Version: $version$
 */
@Controller
public class ApproverProcessController {

    @Autowired
    private ApprovalProcessImpl approvalProcessImpl;

    /**
     * 跳转到添加审批流程的界面
     * @return
     */
    @RequestMapping(value = "/showapproverprocess")
    public ModelAndView showApproverPage(){
        ModelAndView mav = new ModelAndView();
        List<ApproverNode> list = new ArrayList<ApproverNode>();
        //这里模拟一下已经存在了N个审批节点的数据（实际开发中就去读审批节点表即可）
        ApproverNode approverNode = new ApproverNode();
        approverNode.setNode_Id(1);
        approverNode.setNode_Name("我是小白节点");
        ApproverNode approverNode1 = new ApproverNode();
        approverNode1.setNode_Id(2);
        approverNode1.setNode_Name("我是小红节点");
        ApproverNode approverNode2 = new ApproverNode();
        approverNode2.setNode_Id(3);
        approverNode2.setNode_Name("我是小黑节点");
        list.add(approverNode);
        list.add(approverNode1);
        list.add(approverNode2);
        //返回所有的审核节点的信息
        mav.addObject("nodeinfo" ,list) ;
        mav.setViewName("asystem_approvalprocess_add");
        return mav;
    }

    /**
     * 处理添加审批流程的数据
     * @return
     * @throws Exception
     */
    @RequestMapping( value ="/asystem_editprocessdetail")
    public String editProvessDedail(String allnodeselecteids, String allnodeselectechecks, String savenodenumber, ApprovalProcess approvalProcess, ApprovalProcessDetail approvalProcessDetail) throws Exception{
        //(1)将流程数据进行插入到数据库中
        approvalProcessImpl.saveProcessInfoData(approvalProcess);
        //(2)查询得到审批流程表中最大的流程ID号，从而得到该增加的审批节点对应的审批流程ID
        Integer totalProcessNumber = approvalProcessImpl.findTotalNumber();
        //(3)得到一共添加的审批节点个数，这样就能够得到每个节点的顺序
        int nodeNumber = Integer.parseInt(savenodenumber);
        //(4)循环遍历每个节点的信息，然后插入到审批流程详细数据表中
        ApprovalProcessDetail aapd = new ApprovalProcessDetail();
        //(5)获取所有的节点的ID和是否能够被退回的信息
        String[] splitIds = allnodeselecteids.split(",");
        String[] splitChecks = allnodeselectechecks.split(",");
        for (int i = 0 ; i <nodeNumber ;i++){
            aapd.setProcessdetail_Id(totalProcessNumber); //设置节点对应的审批流程ID，其实就是总条数
            aapd.setProcessdetail_NodeId(Integer.parseInt(splitIds[i]));//设置节点ID
            aapd.setProcessdetail_Back(splitChecks[i]); //设置是否该节点可以返回,true就是可以，false就是不行
            aapd.setProcessdetail_Nodeorder(i+1); //设置节点处理顺序，因为从0开始，但是数据库设置为1开始，所以要+1
            //插入数据到数据库
            approvalProcessImpl.saveApprovalNode(aapd);
        }
        //处理完后返回到显示所有流程界面
        return "success";
    }

}
