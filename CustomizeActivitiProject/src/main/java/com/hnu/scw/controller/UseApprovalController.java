package com.hnu.scw.controller;

import com.hnu.scw.pojo.*;
import com.hnu.scw.service.impl.AssetAbandonImpl;
import com.hnu.scw.service.impl.ProjectApplyImpl;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @ Author     ：scw
 * @ Date       ：Created in 下午 3:08 2019/4/28 0028
 * @ Description：审批项目使用审批流程的管理
 * @ Modified By：
 * @Version: $version$
 */
@Controller
public class UseApprovalController {

    @Autowired
    private AssetAbandonImpl assetAbandon;

    @Autowired
    private ProjectApplyImpl projectApply;

    /**
     * 跳转到日常请假需要审批的界面
     * @return
     */
    @RequestMapping(value = "/showproject")
    public ModelAndView showProjectPage(){
        ModelAndView mav = new ModelAndView();
        //获取审批流程的信息
        List<ApprovalProcess> approvalProcess = projectApply.findApproveProcess();
        mav.addObject("approvalProcess", approvalProcess);
        mav.setViewName("abandontable_add");
        return mav;
    }

    /**
     * 处理添加日常请假表（对应数据库中的assetAbandon表）
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/save_abandon")
    public String save_abandon(ProjectProcess projectProcess, AssetAbandonManage assetAbandonManage){
        //(1)添加请假申请的数据
        assetAbandon.saveAssetAbandon(assetAbandonManage);
        //(2)添加数据信息到项目审批过程表中
        // 获取选取审批流程的ID和名字
        String processName = assetAbandonManage.getAbandon_approve();
        projectProcess.setProcess_ApprovalName(processName);
        // 获取项目申请的id
        projectProcess.setProject_Id(assetAbandonManage.getId());
        // 需要进行审批项目的项目类型，我这里就用“请假申请”为一个例子，
        // 实际中肯定是在前端就已经存在了，不同页面不同
        projectProcess.setProcess_Type(assetAbandonManage.getProcess_Type());
        // 根据流程ID和顺序,查询对应流程表中的第一个流程节点的ID和名字
        Integer processId = projectProcess.getProcess_ApprovalId();
        String nodeName = projectApply.findFirstNodeNameByProcessId(processId);
        projectProcess.setCurrent_NodeName(nodeName);
        projectProcess.setDescription_Passnumber(0);// 通过的人数
        projectProcess.setDescription_Refusenumber(0);// 不通过的人数
        // 该项目流程的完成状态，开始的状态是未完成
        projectProcess.setProcess_FinishStatus( "未完成");
        // 刚开始的时候设置的审批节点顺序为第一个，这个不设置也可以，因为数据库中默认了为第一个
        projectProcess.setCurrent_NodeOrder(1);
        // 设置该项目流程是需要进行审批操作
        projectProcess.setProject_Stryle("需要");
        // 将数据插入到项目过程表中
        projectApply.saveOneProjectProcessInfo(projectProcess);
        //----------处理添加审批流程的操作结束----scw--
        return "success";
    }


    /**
     * 显示所有需要审批的项目
     */
    @RequestMapping(value = "/showprojectlist")
    public ModelAndView showProjectList() throws Exception {
        ModelAndView mav = new ModelAndView();
        List<ProjectProcess> listProject = projectApply.findAllProject();
        mav.addObject("listProject",listProject);
        mav.setViewName("/project_list");
        return mav;

    }

    /**
     * 点击审批按钮进行的详细项目进程的显示
     * @return
     */
    @RequestMapping(value="/showprojectdetaileprocess")
    public ModelAndView editCurrentProjectProcessDetail(Integer projectprocess_Id){
        ModelAndView mav = new ModelAndView();
        //根据查询到的内容，获取到对应的数据表中的内容
        ProcessAndProject currentProjectContent = projectApply.findDifferentContent(projectprocess_Id);

        mav.addObject("currentProjectContent", currentProjectContent);
        mav.setViewName("/showcurrentproject_edit");
        return mav;
    }

   /**
     * 进行审批操作的处理（同意）
     */
    @RequestMapping(value = "/approvalaggree")
    public String editPorjectPorceeListByYes(ProjectProcess projectProcess,  ProjectProcessDetail projectProcessDetail) throws Exception {
        //首先当有人审核了，那么就将项目数据库中的审批状态由已提交变为审核中
        Integer currentProjecttId = projectProcess.getProject_Id();
        //获取审批的类型
        String currentProcessType = projectProcess.getProcess_Type();
        //修改对应的审批项目的状态为“审核中”，因为当用户提交之后的状态是“已提交”
        //而现在有人审核了，那么就对应要修改状态，方便用户看到是否有人审核
        projectApply.editProjectManagerStatus(currentProjecttId , currentProcessType);

        //(1)将该审核人具体的操作插入到项目流程细节表中
        //1:得到该操作的操作时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        projectProcessDetail.setDetail_ApprovalTime(df.format(new Date()));
        //2:获取当前审批人的userid(实际操作是从session中获取)
        //我这里模拟就是直接写死了啊
        String userId = "123";
        projectProcessDetail.setDetail_ApproverUserID(userId);
        //加入审批结果
        projectProcessDetail.setDetail_OptionResult("通过");
        //3:获取进行操作审批项目的当前处理节点的ID
        Integer currentNodeId = projectApply.findCurrentNodeId(projectProcess);
        projectProcessDetail.setDetail_CurrentNodeId(currentNodeId);
        //4:将数据插入到项目流程细节表中
        projectApply.saveProjectProceeDetail(projectProcessDetail);

        //(2)查询当前的项目流程中，在项目过程表中，通过的人数，并且+1(因为当前的操作也是通过)
        Integer passNumber = projectApply.findProjectDescriptionPassNumber(projectProcess) +1;
        //(3)获取当前项目流程，当前审批流程，当前审批节点的所有信息
        RelativeInfoProject approvalProcessInfo = projectApply.findRelativeInfo(projectProcess);
        //(4)比较当前节点通过人数和当前审批节点需要通过的最小人数的比较
        Integer nodeMinNumber =  approvalProcessInfo.getApproverNode().getNode_PassNumber();
        ProjectProcessDescription projectProcessDescription = new ProjectProcessDescription();
        projectProcessDescription.setDescription_ProcessId(projectProcess.getProjectprocess_Id());
        if( passNumber < nodeMinNumber){  //处于还是当前流程节点的状态
            //当前操作的时间
            projectProcessDescription.setDescription_Time(df.format(new Date()));
            //当前的项目流程内容
            projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getApprovalProcess().getProcess_Name()+"-审批执行中;审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-不变，通过人数+1");
            //在项目流程描述表中更新数据，主要就是更新当前的内容字段
            projectApply.saveProjectProcessDescription(projectProcessDescription);
            //更新项目过程表对应的过程信息(这个时候其实就是更新通过的人数字段)
            projectProcess.setDescription_Passnumber(passNumber);
            projectApply.editProjectProcess(projectProcess);
        }
        else{
            //大于或者相等的话，就判断是否又后续节点，有的话就进入下一个节点，
            // 没有的话，就为项目流程终止
            //当前操作的时间
            projectProcessDescription.setDescription_Time(df.format(new Date()));
            //判断是否还有后续节点
            RelativeInfoProject nextApprovalProcessInfo = projectApply.findIfNextApprovalNode(projectProcess);
            //判断得到的后续信息是否为空，如果为空就表示当前节点已经是流程的最后一个节点
            if(nextApprovalProcessInfo == null){
                //当前的项目流程内容
                projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getApprovalProcess().getProcess_Name()+"-执行完毕;审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-为最后一个节点，该审批过程结束");
                //在项目流程描述表中更新数据，主要就是更新当前的内容字段
                projectApply.saveProjectProcessDescription(projectProcessDescription);
                //更新项目过程表对应的过程信息(这个时候其实就是更新通过的人数字段,过程完成状态)
                //当前通过的人数
                projectProcess.setDescription_Passnumber(passNumber);
                projectApply.editProjectProcessStatus(projectProcess);
                //根据项目ID，更新不同表中的流程状态(通过项目审批ID和审批类型)为审批完成并且通过
                projectApply.editAprojectManagerStatus(currentProjecttId , currentProcessType , "审批完成(通过)");
            }
            else{ //还存在后续节点
                projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getApprovalProcess().getProcess_Name()+"-审批执行中;审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-审批完毕，进入后续节点-"+nextApprovalProcessInfo.getApproverNode().getNode_Name()+"-进行审批，通过人数变为0");
                //在项目流程描述表中更新数据，主要就是更新当前的内容字段
                projectApply.saveProjectProcessDescription(projectProcessDescription);
                //更新项目过程表对应的过程信息(这个时候其实就是更新通过的人数字段为0,当前的审批节点名字，审批的第几个次序字段)
                //修改当前的节点名称
                projectProcess.setCurrent_NodeName(nextApprovalProcessInfo.getApproverNode().getNode_Name());
                projectApply.editProjectProcessCurrentNode(projectProcess);
            }
        }
        return "approvalsuccess";
    }

    /**
     * 进行审批操作的处理（不同意）
     */
    @RequestMapping(value = "/approvaldisaggree")
    public String editPorjectPorceeListByNo(ProjectProcess projectProcess,  ProjectProcessDetail projectProcessDetail){
        //首先当有人审核了，那么就将项目数据库中的审批状态由已提交变为审核中
        Integer currentProjecttId = projectProcess.getProject_Id();
        //获取审批的类型
        String currentProcessType = projectProcess.getProcess_Type();
        projectApply.editProjectManagerStatus(currentProjecttId , currentProcessType);

        //(1)将该审核人具体的操作插入到项目流程细节表中
        //1:得到该操作的操作时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        projectProcessDetail.setDetail_ApprovalTime(df.format((new Date())));
        //2:获取当前审批人的userid(实际操作是从session中获取)
        //我这里模拟就是直接写死了啊
        String userId = "123";
        projectProcessDetail.setDetail_ApproverUserID(userId);
        //加入审批结果
        projectProcessDetail.setDetail_OptionResult("不通过");
        //3:获取进行操作审批项目的当前处理节点的ID
        Integer nodeId = projectApply.findCurrentNodeId(projectProcess);
        projectProcessDetail.setDetail_CurrentNodeId(nodeId);
        //4:将数据插入到项目流程细节表中
        projectApply.saveProjectProceeDetail(projectProcessDetail);
        //(2)查询当前的项目流程中，在项目过程表中，不通过的人数，并且+1(因为当前的操作也是不通过)
        Integer refuseNumber = projectApply.findProjectDescriptionRefuseNumber(projectProcess) +1;
        //(3)获取当前项目流程，当前审批流程，当前审批节点的所有信息
        RelativeInfoProject approvalProcessInfo = projectApply.findRelativeInfo(projectProcess);
        //(4)比较当前节点不通过人数和当前审批节点需要通过的最小人数的比较
        //获取到当前节点最少需要通过的人数
        Integer nodeMinNumber =  (Integer) approvalProcessInfo.getApproverNode().getNode_PassNumber();
        //获取当前节点中一共的总人数
        Integer totalNumber = (Integer) approvalProcessInfo.getApproverNode().getNode_TotalNumber();
        //进行比较不通过的人数的情况(二种)
        ProjectProcessDescription projectProcessDescription = new ProjectProcessDescription();
        projectProcessDescription.setDescription_ProcessId(projectProcess.getProjectprocess_Id());
        if(nodeMinNumber <= (totalNumber -refuseNumber )){  //最小通过人数 <= 总人数-拒绝人数，说明还有可能该流程同意，该流程不终止
            //添加信息到项目描述表中
            projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getApprovalProcess().getProcess_Name()+"-审批执行中;审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-不变，不通过人数+1");
            //当前操作的时间
            projectProcessDescription.setDescription_Time(df.format(new Date()));
            //在项目流程描述表中更新数据，主要就是更新当前的内容字段
            projectApply.saveProjectProcessDescription(projectProcessDescription);
            //更新项目过程表对应的过程信息(这个时候其实就是更新不通过的人数字段)
            projectProcess.setDescription_Refusenumber(refuseNumber);
            projectApply.editProjectProcessRefuseNumber(projectProcess);
        }
        else{
            // 最小通过 > 总人数-拒绝人数,这时候就进行判断当前节点是否可以打回，
            // 如果不能，则整个流程结束
            //获取当前审批节点是否能够被打回,true为可以打回
            String backResult = approvalProcessInfo.getApprovalProcessDetail().getProcessdetail_Back();
            //当前操作的时间
            projectProcessDescription.setDescription_Time(df.format(new Date()));
            //获取项目流程表的序号ID
            Integer projectId = projectProcess.getProject_Id();
            if("true".equals(backResult)){ //可以打回
                //(1)判断当前节点顺序是处于第几级
                Integer currentNodeOrder = (Integer) approvalProcessInfo.getProjectProcess().getCurrent_NodeOrder();
                if(currentNodeOrder == 1){  //表示的是第一级级别，那么就相当于重新开始
                    projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getProjectProcess().getProcess_ApprovalName()+"-由于总人数-不通过人数超过最小通过人数，并且审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-属于第一级能够打回，则重新进行当前审批节点审批处理");
                    //在项目流程描述表中插入数据，主要就是添加一个内容
                    projectApply.saveProjectProcessDescription(projectProcessDescription);
                    //根据项目进程ID，更新项目过程表中的通过和不通过的人数信息全部为0，还有审批状态为未完成
                    projectApply.editCurrentProjectProcessContent(projectProcess);
                    //根据项目进程ID，删除所有在项目明细表中的数据
                    projectApply.editDeletProjectProcessDeatil(projectId);
                    //因为又处于第一级审核并且处理审批的人数重新都设置为0了，那么这时候需要将对应项目中的审批状态设置为已提交，这样的话，就可以方便各个项目进行修改
                    projectApply.editAgainDifferenProjectStatus(currentProjecttId , currentProcessType);
                }
                else{  //表示要返回上一级节点重新进行处理
                    projectProcessDescription.setDescription_Content("当前审批流程-"+approvalProcessInfo.getProjectProcess().getProcess_ApprovalName()+"-由于总人数-不通过人数超过最小通过人数，并且审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-属于第"+currentNodeOrder+"级能够打回，则重新进行当前审批节点的前一级审批节点处理");
                    //在项目流程描述表中插入数据，主要就是添加一个数据
                    projectApply.saveProjectProcessDescription(projectProcessDescription);
                    //根据当前审批节点的ID，审批人员的userid，删除当前审批节点中审批人员的操作信息
                    //获取当前审批ID
                    Integer currentNodeId = (Integer) approvalProcessInfo.getApproverNode().getNode_Id();
                    //查询当前节点对应的UserId信息
                    List<String> approverUserIds = projectApply.findAllUserIdByNodeId(currentNodeId);
                    //删除当前审批节点中对应审批用户的操作信息
                    ProjectProcessDetail newProjectDetail = new ProjectProcessDetail();
                    //对应的项目流程ID
                    newProjectDetail.setDetail_ProcessId(projectId);
                    for(int i =0 ; i< approverUserIds.size() ; i++){
                        //审核人员ID
                        newProjectDetail.setDetail_ApproverUserID(approverUserIds.get(i));
                        projectApply.editProjectProcessDetailByUserID(newProjectDetail);
                    }
                    //获取上一级的审批顺序
                    Integer lastNodeOrder = currentNodeOrder - 1;
                    //根据项目流程ID，更新项目流程的审批顺序的字段和通过人数和不通过人数信息，审批是否完成
                    projectApply.editProjectProcessLastOrderInfo(projectId);
                    //获取上一级审批的相关的内容信息
                    RelativeInfoProject lastPageDate  = projectApply.findRelativeInfo(projectProcess);
                    //根据项目流程ID，更新当前项目过程ID中的审批节点的名字
                    ProjectProcess newProjectProcess = new ProjectProcess();
                    // 获取当前的节点名字
                    newProjectProcess.setCurrent_NodeName(lastPageDate.getApproverNode().getNode_Name());
                    //项目过程ID
                    newProjectProcess.setProject_Id(projectId);
                    projectApply.editProjectProcessNodeName(newProjectProcess);
                    //将当前修改了的审批节点中的审批人员的数据从项目明细表中进行删除，因为这个节点的人员之前已经有操作信息
                    //获取当前审批ID
                    currentNodeId = lastPageDate.getApproverNode().getNode_Id();
                    //查询当前节点对应的UserId信息
                    approverUserIds = projectApply.findAllUserIdByNodeId(currentNodeId);
                    //删除当前审批节点中对应审批用户的操作信息
                    //对应的项目流程ID
                    projectProcessDetail.setDetail_ProcessId(projectId);
                    for(int i =0 ; i< approverUserIds.size() ; i++){
                        //审核人员ID
                        projectProcessDetail.setDetail_ApproverUserID(approverUserIds.get(i));
                        projectApply.editProjectProcessDetailByUserID(projectProcessDetail);
                    }
                    //最终完成处理
                    //如果返回的上一级是第一级，那么还需要进行下面的一个处理
                    if(currentNodeOrder == 2){
                        //因为又处于第一级审核并且处理审批的人数重新都设置为0了，那么这时候需要将对应项目中的审批状态设置为已提交，这样的话，就可以方便各个项目进行修改
                        projectApply.editAgainDifferenProjectStatus(currentProjecttId , currentProcessType);
                    }
                }
            }
            else{ //不能够被打回，则将该项目流程直接修改完成状态
                projectProcessDescription.setDescription_Content( "当前审批流程-"+approvalProcessInfo.getProjectProcess().getProcess_ApprovalName()+"-由于总人数-不通过人数超过最小通过人数，并且审批节点-"+approvalProcessInfo.getApproverNode().getNode_Name()+"-无法被打回，则审批过程结束");
                //在项目流程描述表中插入数据，主要就是添加内容
                projectApply.saveProjectProcessDescription(projectProcessDescription);
                //更新项目过程表对应的过程信息(这个时候其实就是更新不通过的人数字段,过程是否完成状态)
                //当前不通过的人数
                projectProcess.setDescription_Refusenumber(refuseNumber);
                projectApply.editProjectProcessStatusFinished(projectProcess);
                //根据项目ID，更新不同表中的流程状态(通过项目审批ID和审批类型)
                projectApply.editAprojectManagerStatus(currentProjecttId , currentProcessType , "审批完成(不通过)");
            }
        }
        return "approvalsuccess";

    }
}
