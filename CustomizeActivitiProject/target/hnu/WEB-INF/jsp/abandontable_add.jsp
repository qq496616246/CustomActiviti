
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- 引入 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" charset="utf-8"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.tips.js"></script>
		
		<!-- 内容居中显示 -->
		<style type="text/css">
		.mytable  tr td {
			text-align: center;
		}
		
		.mytable tr td label {
			text-align: center;
		}
		.mytable tr td input {
			text-align: center;
		}
		</style>
		
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//保存
	function save(){
		if($("#abandon_reason").val()==""){
			
			$("#abandon_reason").tips({
				side:3,
	            msg:'请输入请假原因',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#abandon_reason").focus();
			return false;
		}
		else{
		//获取下拉列表中的所选择的流程的名字
		var id = $('#abandon_approve option:selected').attr("id");
		$("#process_ApprovalId").val(id);
						
	    $("#editAbandonForm").submit(); 
		$("#zhongxin").hide();
		$("#zhongxin2").show();   		 
		}
	}

    /**
	 * 取消按钮
     */
	function clickcancel() {
		alert("自己去实现把")
    }
	
</script>
	</head>
	
	<body>
	<form action="/save_abandon" name="editAbandonForm" id="editAbandonForm" method="post">
		<!-- 隐藏审批流程的ID -->
		<input type="hidden" id="process_ApprovalId" name ="process_ApprovalId">
		<!--当前项目的类型-->
		<input type="hidden" id="process_Type" name ="process_Type" value="日常请假">
		<div id="zhongxin" style="margin-left: 10px;margin-right: 10px;margin-top: 15px;">
		<table id="table_report"
							class="text-table table table-striped table-bordered table-hover">
							<tbody class="mytable">
								<!-- 开始循环 -->
								<tr>				
									<td style="text-align: center;" colspan="6"><label><b style="color: red"><h2>新增日常请假表</h2></b></label></td>
								</tr>
								<td><label>请假项目名<b style="color: red">*</b></label></td>
								<td><input type="text" name="project_Name" id="project_Name" placeholder="请输入报废项目名">

								<td><label>请假原因<b style="color: red">*</b></label></td>
										<td><input type="text" name="abandon_reason" id="abandon_reason" placeholder="请输入报废原因">
										</td>
								</td>
									<td><label>请假审批<b style="color: red">*</b></label></td>
									<td>
										<select class="chzn-select" name="abandon_approve" id="abandon_approve" data-placeholder="请选择审批流程" style="width: 221px;vertical-align: center">
											<c:forEach items="${approvalProcess}" var="info" >
												<option id=${info.process_Id }>${info.process_Name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr style="height: 40">
									<td style="text-align: center;" colspan="7">
										<a class="btn btn-primary" onclick="save();">提交</a>
										<a class="btn btn-danger"  onclick="clickcancel();">取消</a>
									</td>
								</tr>
							</tbody>
						</table>
		</div>
	</form>

</body>
</html>