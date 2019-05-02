package com.hnu.scw.controller;

import com.hnu.scw.pojo.Approver;
import com.hnu.scw.service.impl.ApproverImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:08 2019/4/28 0028
 * @ Description：审核人的管理
 * @ Modified By：
 * @Version: $version$
 */
@Controller
public class ApproverController {

    @Autowired
    private ApproverImpl approverImpl;

    /**
     * 跳转到添加审批人员的界面
     * @return
     */
    @RequestMapping(value = "/showapprover")
    public String showApproverPage(){
        return "user_toapprover";
    }

    /**
     * 添加审批人员的信息
     * @return 返回添加成功的页面
     */
    @RequestMapping(value = "/addapprover")
    public String addApprover(Approver approver){
        approverImpl.saveApproverUser(approver);
        return "success";
    }

}
