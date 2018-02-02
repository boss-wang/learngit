<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
		 <!-- 修改客户信息 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">客户管理</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="clientUpdate" style=" width:970px ;height:350px" >
       
            	<tr  class="tit-mess3">
            		<td class="mess1"  style="width:150px;">客户公司抬头</td>
            		<td class="mess1"  style="width:160px;" >客户公司地址</td>
            		<td class="mess1" style="width:120px;">联系人</td>
            		<td class="mess1" style="width:120px;">联系人操作</td>
            		<td class="mess1" style="width:120px;">操作栏</td>
            	</tr> 
            	<c:forEach var="client" items="${list }">
            	<tr  class="tit-mess3"  style=" height:40px">
            		<td class="mess2">${client.clientName }</td>
            		<td class="mess2">${client.clientAddress }</td>
            		
            		<td class="mess2">
            		<c:forEach var="clientcontact" items="${client.clientContactlist}">
            			<a class="ccName">${clientcontact.clientContactName}</a>
            			<div class="messdiv">
							<p>电话：${clientcontact.clientContactTel}</p>
							<c:if test="${clientcontact.clientContactEmail!=null&&clientcontact.clientContactEmail!='' }">
							<p>邮箱：${clientcontact.clientContactEmail}</p>
							</c:if>
							<c:if test="${clientcontact.clientContactQQ!=null&&clientcontact.clientContactQQ!='' }">
							<p>Q Q：${clientcontact.clientContactQQ}</p>
							</c:if>
						</div>
						
						</c:forEach>
            		</td>
            		<td class="mess2"><a class="addCC" addId="${client.clientId }" addName="${client.clientName }">增加</a></td>
            		<td class="mess2"><a class="updateClient" updateId="${client.clientId }">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            	</tr> 
            	</c:forEach>
            	
            	<tr id="last" style="height:50px;">
            		<td  colspan="5"><a id="firstPage" >首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$("#clientUpdate").on("click",".updateClient",function(){
			var curpage = ${curpage};
			var clientId = $(this).attr("updateId");
			$("#home").load("gotoUpdateClient?currentpage="+curpage+"&clientId="+clientId);
		});
		$("#clientUpdate").on("click",".ccName",function(){
			$(this).next().toggle();
		});
		
		$("#clientUpdate").on("click",".addCC",function(){
			var curpage = ${curpage};
			var clientId = $(this).attr("addId");
			var clientName =$(this).attr("addName");
			$("#home").load("/dtw/admin/addClientContact.jsp?clientId="+clientId+"&clientName="+clientName+"&currentpage="+curpage);
		})
		$("#prePage").click(function(){
			var curpage = ${curpage-1 };
			$("#home").load("/dtw/showClient?currentpage="+curpage);
		})
		$("#nextPage").click(function(){
			var curpage = ${curpage+1 };
			$("#home").load("/dtw/showClient?currentpage="+curpage);
		})
		$("#firstPage").click(function(){
			var curpage = 1;
			$("#home").load("/dtw/showClient?currentpage="+curpage);
		})
		$("#lastPage").click(function(){
			var curpage = ${totalPage};
			$("#home").load("/dtw/showClient?currentpage="+curpage);
		})
	</script>
	</body>