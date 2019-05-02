package com.hnu.scw.mapper;
import com.hnu.scw.pojo.ApprovalProcess;
import com.hnu.scw.pojo.ApprovalProcessDetail;
import com.hnu.scw.pojo.AssetAbandonManage;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:21 2018/6/15 0015
 * @ Description：对应于日常请假的mapper操作接口
 * @ Modified By：
 * @Version: $version$
 */
public interface AssetAbandonMapper {
    /**
     * 添加对应日常请假项目的详细信息
     * @param assetAbandonManage
     */
    void saveAssetAbandon(AssetAbandonManage assetAbandonManage);
}
