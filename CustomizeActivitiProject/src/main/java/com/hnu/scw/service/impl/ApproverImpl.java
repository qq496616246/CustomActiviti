package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.ApproverMapper;
import com.hnu.scw.pojo.Approver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:19 2018/6/15 0015
 * @ Description：处理审批人员的操作
 * @ Modified By：
 * @Version: $version$
 */
@Service
public class ApproverImpl {

    @Autowired
    private ApproverMapper approverMapper;

    /**
     * 添加用户为审批人
     * @param approver
     */
    public void saveApproverUser(Approver approver) {
        approverMapper.saveApprover(approver);
    }
}
