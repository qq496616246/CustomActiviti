package com.hnu.scw.mapper;

import com.hnu.scw.pojo.Approver;
import com.hnu.scw.pojo.Person;
import com.hnu.scw.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:21 2018/6/15 0015
 * @ Description：对应于审批的mapper操作接口
 * @ Modified By：
 * @Version: $version$
 */
public interface ApproverMapper {
    /**
     * 添加一个审批人员实体
     * @param approver
     */
    void saveApprover(Approver approver);

}
