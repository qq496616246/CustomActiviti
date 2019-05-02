<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib  uri="http://java.sun.com/jsp/jstl/functions"   prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目审批界面</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" charset="utf-8"/>
	<!-- 引入 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/chosen.jquery.min.js"></script>
<style type="text/css">
	.project_apply_add td{
		vertical-align: middle;	
	}
</style>

</head>
<body>
	<div class="container-fluid" id="main-container">
				<form action="" method="post" name="projectprocessform" id="projectprocessform" >
					<input type="hidden" name="detail_ProcessId" id="detail_ProcessId" value="${currentProjectContent.projectProcess.projectprocess_Id}">
					<input type="hidden" name="projectprocess_Id" id="projectprocess_Id" value="${currentProjectContent.projectProcess.projectprocess_Id}">
					<input type="hidden" name="description_Id" id="description_Id" value="${currentProjectContent.projectProcess.projectprocess_Id}">
					<input type="hidden" name="project_Id" id="project_Id" value="${currentProjectContent.projectProcess.project_Id}">
					<input type="hidden" name="process_Type" id="process_Type" value="${currentProjectContent.projectProcess.process_Type}">
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<td style="text-align: center;" colspan="6"><label><b style="color: red"><h2>项目审批</h2></b></label></td>
						</tr>
						<c:if test="${currentProjectContent.projectProcess.process_Type == '日常请假'}">
						   	<tr>
								<th>请假项目名</th>
								<td>
									<input type="text" id="project_Name" name="project_Name" disabled="disabled"
										   value="${currentProjectContent.assetAbandonManage.project_Name}" class="col-xs-10 col-sm-5"></td>

								<th>请假原因</th>
								<td>
									<input type="text" id="abandon_reason" name="abandon_reason" disabled="disabled"
									value="${currentProjectContent.assetAbandonManage.abandon_reason}" class="col-xs-10 col-sm-5"></td>
								<th>审批流程</th>
								<td><input type="text" id="abandon_approve" name="abandon_approve" disabled="disabled"
										   value="${currentProjectContent.assetAbandonManage.abandon_approve}" class="col-xs-10 col-sm-5"></td>
							</tr>
						</c:if>

							<tr>
								<th>审批意见</th>
								<td colspan="6">
									<textarea rows="5" cols="" placeholder="请输入审批意见" style="width:98%;" name="detail_ApproverContent" id="detail_ApproverContent"></textarea>
								</td>
							</tr>

							<tr>
								<td style="text-align: center;" colspan="6">
									<button type="button" class="btn  btn-success" onclick="agreeOption();" style="margin: 20px;">
										<i class="ace-icon fa fa-check bigger-110"></i> 审批通过
									</button>
									<button class="btn  btn-primary" type="button"
										onClick="disagreeOption();" style="margin: 20px;">
										<i class="ace-icon fa fa-check bigger-110"></i> 审批不通过
									</button>

									<button class="btn  btn-danger" type="button"
										onClick="cancelOption();" style="margin: 20px;">
										<i class="ace-icon fa fa-check bigger-110"></i> 返回
									</button>
								</td>
							</tr>

							<tr>
								<th>当前状态</th>	
 									<td colspan="6">
 									<textarea  rows="1" cols="80" style="width: 98%;font-size:16px;color: red;"   readonly="readonly" >1、请填写对审批项目审批意见2、请进行对本项目的审批操作-同意或者不同意</textarea>
 								</td>	
							</tr>
						</thead>
					</table>
				</form>
	</div>
	
	
	 
	<script type="text/javascript">
		$(top.hangge());
		
		//点击取消按钮，返回项目流程主界面
		function cancelOption() {
			alert("自己开发呗")
		}

		//点击同意按钮的操作
		function agreeOption(){
			if($('#detail_ApproverContent').val()=="" || $('#detail_ApproverContent').val()==null){			
				alert("意见不能为空")
				$("#detail_ApproverContent").focus();
				return false;
			}
            $('#projectprocessform').attr({action:"/approvalaggree"});
            $('#projectprocessform').submit();
		}
		
		//点击不同意按钮的操作
		function disagreeOption(){
			if($('#detail_ApproverContent').val()=="" || $('#detail_ApproverContent').val()==null){
                alert("意见不能为空")
                $("#detail_ApproverContent").focus();
				return false;
			}			
			//规则都符合之后进行判断是否是已经完成的过程跳转到后台(ajax)
			var detail_ProcessId =$('#detail_ProcessId').val() ; //获取当前项目过程ID
			var process_Type = $('#process_Type').val();//获取当前项目过程的类型
			var project_Id = $('#project_Id').val();//获取当前审批项目的ID
            $('#projectprocessform').attr({action:"/approvaldisaggree"});
            $('#projectprocessform').submit();
		}

	</script>
</body>
</html>

