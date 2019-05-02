package com.hnu.scw.pojo;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 7:06 2019/5/1 0001
 * @ Description：审批项目和项目审批详情
 * @ Modified By：
 * @Version: $version$
 */
public class ProcessAndProject {
    private AssetAbandonManage assetAbandonManage;
    private ProjectProcess projectProcess;

    public AssetAbandonManage getAssetAbandonManage() {
        return assetAbandonManage;
    }

    public void setAssetAbandonManage(AssetAbandonManage assetAbandonManage) {
        this.assetAbandonManage = assetAbandonManage;
    }

    public ProjectProcess getProjectProcess() {
        return projectProcess;
    }

    public void setProjectProcess(ProjectProcess projectProcess) {
        this.projectProcess = projectProcess;
    }
}
