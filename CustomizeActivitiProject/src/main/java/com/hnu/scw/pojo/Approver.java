package com.hnu.scw.pojo;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:23 2019/4/28 0028
 * @ Description：审批人员信息
 * @ Modified By：
 * @Version: $version$
 */
public class Approver {
    private Integer  approverId;
    private String user_Id;
    private String approver_Description;
    private String approver_Rights_Description;
    private String user_Name;

    public Integer getApproverId() {
        return approverId;
    }

    public void setApproverId(Integer approverId) {
        this.approverId = approverId;
    }

    public String getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(String user_Id) {
        this.user_Id = user_Id;
    }

    public String getApprover_Description() {
        return approver_Description;
    }

    public void setApprover_Description(String approver_Description) {
        this.approver_Description = approver_Description;
    }

    public String getApprover_Rights_Description() {
        return approver_Rights_Description;
    }

    public void setApprover_Rights_Description(String approver_Rights_Description) {
        this.approver_Rights_Description = approver_Rights_Description;
    }

    public String getUser_Name() {
        return user_Name;
    }

    public void setUser_Name(String user_Name) {
        this.user_Name = user_Name;
    }
}
