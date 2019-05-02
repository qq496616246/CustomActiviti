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
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</head>
<body>

<form action="/addapprover" name="addApproverForm" id="addApproverForm" method="post">
		<!--这个就从系统里面的用户那里获得-->
		<input type="hidden" name="user_Id" id="user_Id" value="213"/>
		<div id="zhongxin">
		<table>			
			
			<tr><h7>用户姓名：</h7></tr>
			<tr>
				<td>
					<input type="text" name="user_Name" id="user_Name"  placeholder="用户姓名" title="姓名"/>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="8" cols="80" placeholder="输入审批人描述信息" style="width: 500px;" name="approver_Description" id="approver_Description"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<textarea rows="8" cols="80" placeholder="输入审批权限描述信息" style="width: 500px;" name="approver_Rights_Description" id="approver_Rights_Description"></textarea>
				</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<button type="submit" onclick="save();">保存</button>
				</td>
			</tr>
		</table>
		</div>		
	</form>	
	
</body>
</html>