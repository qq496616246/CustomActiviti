<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
</head>
<!-- 设置表格居中 -->
<style type="text/css">
	#table_report thead tr th{
		text-align: center;
	}
	#table_report tbody tr td{
		text-align: center;
	}
</style>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top: -12px;">
							<thead>
								<tr>
									<th class="center"><label><input type="checkbox" id="zcheckbox"><span class="lbl"></span></label></th>
									<th>序号</th>
									<th>审批项目名</th>	
									<th>审批项目流程名</th>								
									<th>当前审批节点</th>
									<th>审批项目类型</th>
									<th>是否审批完成</th>
									<th class="center">操作</th>
								</tr>
							</thead>

							<tbody>
								<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty listProject}">			
								<c:forEach items="${listProject}" var="projectitem" varStatus="itemindex">
									<tr>
										<td class="center" style="width: 30px;">
										<label>
											<input type="checkbox" name="ids">
											<span class="lbl"></span>
										</label>
										</td>
										<td>${itemindex.index+1}</td>
										<td>${projectitem.project_Name}</td>
										<td>${projectitem.process_ApprovalName}</td>
										<td>${projectitem.current_NodeName}</td>
										<td>${projectitem.process_Type}</td>
										<td style="color: red;">${projectitem.process_FinishStatus}</td>
										<td>
											<a  class="btn btn-mini btn-info" title="审批" onClick="lookCurrentProject('${projectitem.projectprocess_Id}');">
											<i class="icon-edit"></i>审批</a> 							
										</td>
									</tr>
								</c:forEach>	
								</c:when>
								<c:otherwise>
									<tr class="main_info">
									<td colspan="15" class="center">暂时没有数据</td>
									</tr>							
								</c:otherwise>
								</c:choose>							
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" charset="utf-8"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.tips.js"></script>

	<script type="text/javascript">		
		$(top.hangge());
		
		//当搜索框获取到焦点的时候
		$("#retrieve_content").hover(function(){
			$("#retrieve_content").tips({
				side:3,
	            msg:'检索列表范围：审批项目名；审批项目流程名；当前审批节点；审批项目类型；是否审批完成',
	            bg:'#AE81FF',
	            time:3
	        });	
		});
		
		//处理点击审批按钮的操作
		function lookCurrentProject(projectId){
            window.location = "${pageContext.request.contextPath}/showprojectdetaileprocess?projectprocess_Id="+projectId;
		}

		//处理姓名检索的功能
		function search(){
			//提交检索功能
			$('#approversearchform').submit();
		}
		
		</script>
</body>
</html>