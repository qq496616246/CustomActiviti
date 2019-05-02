package com.hnu.scw.pojo;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 2:03 2019/5/2 0002
 * @ Description：与审批项目相关的所有关联表的信息
 * @ Modified By：
 * @Version: $version$
 */
public class RelativeInfoProject {

    private ProjectProcess projectProcess;
    private ApproverNode approverNode;
    private ApprovalProcess approvalProcess;
    private ApprovalProcessDetail approvalProcessDetail;

    public ProjectProcess getProjectProcess() {
        return projectProcess;
    }

    public void setProjectProcess(ProjectProcess projectProcess) {
        this.projectProcess = projectProcess;
    }

    public ApproverNode getApproverNode() {
        return approverNode;
    }

    public void setApproverNode(ApproverNode approverNode) {
        this.approverNode = approverNode;
    }

    public ApprovalProcess getApprovalProcess() {
        return approvalProcess;
    }

    public void setApprovalProcess(ApprovalProcess approvalProcess) {
        this.approvalProcess = approvalProcess;
    }

    public ApprovalProcessDetail getApprovalProcessDetail() {
        return approvalProcessDetail;
    }

    public void setApprovalProcessDetail(ApprovalProcessDetail approvalProcessDetail) {
        this.approvalProcessDetail = approvalProcessDetail;
    }
}
