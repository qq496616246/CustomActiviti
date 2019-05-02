<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批节点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" charset="utf-8"/>
<!-- 引入 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/chosen.jquery.min.js"></script>
<!-- 设置表格居中 -->
<style type="text/css">
	#table_report thead tr th{
		text-align: center;
	}
	#table_report tbody tr td{
		text-align: center;
	}
</style>
</head>
<body>
		
		<!-- 添加节点的界面 ，默认开始不显示-->
		<div id="addNodeInfodiv"  class="row-fluid" >
 		<form action="" method="post" id="submmitapprovnode" name="submmitapprovnode">
 			<input type="hidden" id="saveapproverid" name="saveapproverid">
 			<table id="table_report" class=" table-text table table-striped table-bordered table-hover" >
				<thead>
					<tr>
						<th>审批节点名称</th>
						<td>
							<input type="text" placeholder="审批节点名称" name="node_Name" id="node_Name">
						</td>
						<th>审批通过最少人数</th>
						<td>
							<input type="text" placeholder="审批节点需要通过的最少人数" name="node_PassNumber" id="node_PassNumber" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
						</td>
						<th>审批总人数</th>
						<td>
							<input type="text" placeholder="审批节点的总审批人数" name="node_TotalNumber" id="node_TotalNumber" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" >
						</td>
					</tr>
					
					<!-- 关于显示审核人员列表内容 -->
					<tr>
						<th>添加审核人员</th>
						<td>
							<select id="showapproverpeople" name="showapproverpeople">
								<option>选择要添加的人员</option>
								<!--我这里演示就先下死的-->
								<option value="1">张三</option>
								<option value="2">李四</option>
								<option value="3">王五</option>
								<!--以后就是从审核人员表里面读出对应的数据	-->


							</select>
							<button type="button" class="btn btn-success" id="addApprover" name="addApprover" onclick="addApproverjs();">添加</button>						
						</td>
					</tr>
					
					<tr>
						<th>节点审批人员名单</th>
						<td colspan="6" id="approverOrder" style="height: 150px;width: 92%">
							
						</td>
					</tr >
									
					<tr>
						<th>审批节点描述</th>
						<td colspan="6">
							<textarea rows="6" cols="30" style="width: 98%" name="node_Description" id="node_Description"></textarea>
						</td>
					
					</tr>	
					<tr>
 						<th>温馨提示</th>	
 						<td colspan="6">
 							<textarea  rows="1" cols="80" style="width: 98%;font-size:18px;color: red;" placeholder="(1)点击提交后添加到审批节点列表中;(2)点击取消返回节点列表界面" readonly="readonly"></textarea>
 						</td>								
					</tr>
					
					<tr>
						<td style="text-align:center;" colspan="6">
							<button class="btn btn-info" type="button" onClick="submmitcontent()"> <i class="ace-icon fa fa-check bigger-110"></i> 提交 </button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-danger" type="button" onClick="cancelcontent()"> <i class="ace-icon fa fa-check bigger-110"></i> 取消</button>
						</td>
					</tr>							
					</thead>
				</table>
			</form>
		</div>
</div>
		<script type="text/javascript">
			//处理添加审核人员的操作
			function addApproverjs(){
				//获取下拉列表中选中的内容
				var selectvalue = $("#showapproverpeople").val();
				var selectshow = $("#showapproverpeople option:checked").text();//获取选中的显示内容
				if( selectshow == "选择要添加的人员"){
					alert("请选择所要添加的名单哦！！");
				}
				else{
					var ifAddResult = true;  //标识是否进行添加操作
					//判断选择的人员中是否已经添加过了
					$('#approverOrder div').each(function(i , n){
						if($(this).attr("id") == selectvalue){
							alert("该人员已经在审批人员列表中，请不要重复添加");
							ifAddResult = false;
						}
					});
					if(ifAddResult == true){
						//获取在审核人员中，已经有多少个人，这样能够方便进行点击取消操作
						var numberdiv = $("#approverOrder").children().length;
						//将选中的内容添加到审核人员顺序中
						var $addcontent = $('<div style="display:inline-block; border:1px #000000 solid;margin: 10px;" id="'+selectvalue+'"><span>'+selectshow+'</span><button class="btn btn-danger btn-sm" type="button"  onclick="cancelCurrentPeopel(\''+selectvalue+'\');">取消</button></div>');
						//添加到审核人员的td标签中
						$addcontent.appendTo($("#approverOrder"));
						alert("添加成功!");
					}
				}
			}
		
		//审核人员中的取消审核人员的操作,这样等会以后直接通过userid进行搜索判断td中对应的div的id为这个的就删除就可以了
		function cancelCurrentPeopel(userid){		
			//遍历整个审核人列表的td，找到是点击取消的这个userid的div进行移除
			$('#approverOrder div').each(function(i , n){
				  //判断是否是点击的那个内容的ID，如果是就进行删除
				  if($(this).attr("id") == userid ){
					  $(this).remove();
				  }
			  });
		}
		
		//点击添加审核节点中的提交按钮
		function submmitcontent(){
			 //（1）当点击之后，需要要判断其他的必要填的内容是否已经填写了
			 //节点名称
			if($('#node_Name').val() == "" || $('#node_Name').val() == null){
				$("#node_Name").tips({
					side:3,
		            msg:'请输入节点名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_Name").focus();
				return false;
			}
			//通过人数
			if($('#node_PassNumber').val() == "" || $('#node_PassNumber').val() == null){
				$("#node_PassNumber").tips({
					side:3,
		            msg:'请输入最小通过人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_PassNumber").focus();
				return false;
			}
			//最大人数
			if($('#node_TotalNumber').val() == "" || $('#node_TotalNumber').val() == null){
				$("#node_TotalNumber").tips({
					side:3,
		            msg:'请输入节点最多人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_TotalNumber").focus();
				return false;
			}
			//节点描述内容
			if($('#node_Description').val() == "" || $('#node_Description').val() == null){
				$("#node_Description").tips({
					side:3,
		            msg:'请输入节点描述信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_Description").focus();
				return false;
			}
			//判断添加的审核人员列表中的个数是否等于的填入的总的人数大小
			if($("#approverOrder").children().length != $('#node_TotalNumber').val()){
				$("#node_TotalNumber").tips({
					side:3,
		            msg:'输入的总人数不等于审批列表人员个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_TotalNumber").focus();
				return false;
			}
			
			//判断是否填入的总的审批人数小于最小通过的人数
			if($('#node_TotalNumber').val() < $('#node_PassNumber').val()){
				$("#node_PassNumber").tips({
					side:3,
		            msg:'输入的最小通过人员个数大于审批总人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#node_PassNumber").focus();
				return false;
			}
			 
			//（2）把审核人员的真正序号的名单进行提交
			var approverId = "";
			//首先遍历审核人员顺序中的div标签的id，因为之前就已经把userid进行封装了
			  $('#approverOrder div').each(function(i , n){
				  //alert($(this).attr("id"));
				  approverId = approverId +"-"+$(this).attr("id"); //通过"-"来进行分割
			  });
			//将得到的审核人员的userid放到form表单中的一个隐藏控制，方便后面进行提交到后台
			$('#saveapproverid').val(approverId);
			//（3）提交form表单到后台
			$('#submmitapprovnode').attr({action:'asystem_saveapprovernode'});
			$('#submmitapprovnode').submit();	
		}
		
	</script>
</body>
</html>