package com.hnu.scw.service.impl;

import com.hnu.scw.mapper.ApprovalProcessMapper;
import com.hnu.scw.mapper.AssetAbandonMapper;
import com.hnu.scw.pojo.ApprovalProcess;
import com.hnu.scw.pojo.ApprovalProcessDetail;
import com.hnu.scw.pojo.AssetAbandonManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:19 2018/6/15 0015
 * @ Description：日常请假项目的操作
 * @ Modified By：
 * @Version: $version$
 */
@Service
public class AssetAbandonImpl {

    @Autowired
    private AssetAbandonMapper assetAbandonMapper;

    /**
     * 添加资产报废数据
     * @param assetAbandonManage
     */
    public void saveAssetAbandon(AssetAbandonManage assetAbandonManage) {
        assetAbandonMapper.saveAssetAbandon(assetAbandonManage);
    }




}
