<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body  style="background-color: rgba(0,0,0,0);">
		<!-- 添加订单 -->
		<div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">修改订单&nbsp;${order.orderNo }</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
		<!-- 表单内容 -->
			<div >
			<form id="frm">
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">客&nbsp;&nbsp;&nbsp;&nbsp;户</span>
						<input id="clientName" class="inpu" placeholder="客户公司抬头" value="${order.client.clientName }"/><p id="clientTip" class="tip"></p>
						<input type="hidden" id="clientId" name="clientId" />
						<div class="findClient"></div>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">起 运 港</span>
						<input  class="inpu" id="loadingPort" name="loadingPort" placeholder="起运港" value="${order.loadingPort }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">系&nbsp;&nbsp;统&nbsp;&nbsp;号</span>
						<input class="inpu" id="systemNo" name="systemNo" placeholder="系统号" value="${order.systemNo }" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">主&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" id="mawbNo" name="mawbNo" placeholder="主单号" value="${order.mawbNo }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">分&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" id="hawbNo" name="hawbNo" placeholder="分单号" value="${order.hawbNo }" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">航&nbsp;&nbsp;班&nbsp;&nbsp;号</span>
						<input  class="inpu" id="flightNo" name="flightNo" placeholder="航班号" value="${order.flightNo }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">航班日期</span>
						<input  class="inpu" id="departDate" name="departDate" type="date" value="${order.departDate }" />
					</div>				
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">到港日期</span>
						<input  class="inpu" id="arriveDate" name="arriveDate" type="date" value="${order.arriveDate }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span>
						<input  class="inpu" id="destination" name="destination" placeholder="目的港" value="${order.destination }" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">货物件数</span>
						<input  class="inpu" id="cargoPieces" name="cargoPieces" placeholder="货物件数" value="${order.cargoPiece }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物重量</span>
						<input class="inpu" id="cargoWeight" name="cargoWeight" placeholder="货物重量" value="${order.cargoWeight }" />
					</div>	
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">计费重量</span>
						<input class="inpu" id="chargeWeight" name="chargeWeight" placeholder="计费重量" value="${order.chargeWeight }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物体积</span>
						<input  class="inpu" id="cargoVolume" name="cargoVolume" placeholder="货物体积" value="${order.cargoVolume }" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">报关单状态</span>
						<select  class="inpu" id="customsStatus" name="customsStatus" style="display: inline-block; position: absolute; left: 854px;top: 23px;">
							<c:forEach var="customsStatus" items="${customsStatusList }">
								<option value="${customsStatus.id }"  <c:if test="${customsStatus.id==order.customsStatus }"> selected="selected" </c:if> > ${customsStatus.description } </option>
							</c:forEach>
						</select><span style="margin-left: 10px;display: inline-block;position: absolute;left: 1095px;top: 30px;">*</span>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">订单状态</span>
						<select  class="inpu" id="orderStatus" name="orderStatus">
							<c:forEach var="status" items="${statusList }">
								<c:if test="${status.statusId!=6&&status.statusId!=7&&status.statusId!=8 }">
									<option value="${status.statusId }" <c:if test="${status.statusId==order.statusId }">selected="selected"</c:if>>${status.statusDescription }</option>
								</c:if>
							</c:forEach>
						</select><span style="margin-left: 10px;">*</span>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">报关单号</span>
						<input class="inpu" id="customsNo" name="customsNo" placeholder="报关单号" value="${order.customsNo }" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line" style="height: 80px;">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">贸易条款</span>
						<select  class="inpu" id="terms" name="terms">
							<c:forEach var="terms" items="${termsList }">
								<option value="${terms.id }" <c:if test="${terms.id==order.termsId }">selected="selected"</c:if>>${terms.code }</option>
							</c:forEach>
						</select>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">备注内容</span>
						<textarea class="remarks" id="remarks" name="remarks" style=" height:30px;">${order.remarks }</textarea>
				</div>
				<div  class="tit-mess"style="position: relative; left: 230px;top: 20px;">
					<input id="addSub" class="mess" type="button" value="确认修改" />
					<input id="addRes" class="mess" type="button" value="放弃修改" />
				</div>
			</form>
			</div>
		<script type="text/javascript">
			
			$("#clientName").keyup(function(){
				$(".findClient").empty();
				var clientName = $(this).val();
				if(clientName!=""&&clientName!=null){
					$.ajax({
						url:"client.do",
						type:"post",
						data:"mn=findClient&clientName="+clientName,
						success:function(res){
							var clientJson = JSON.parse(res);
							for(var i=0;i<clientJson.length;i++){
								var holder = $('<a class="holder">'+clientJson[i].clientName+'</a>');
								$(".findClient").append(holder);
							}
						}
					});
				}
			});
			$(".findClient").on("click",".holder",function(){
				var name = $(this).text();
				$("#clientName").val(name);
				$(".findClient").empty();
			});
			$("#clientName").blur(function(){
				setTimeout(function(){
					$(".findClient").empty();
				},150);
			});
			$("#addRes").click(function() {
				var currentPage = ${currentPage };
				var backdo = "${param.backdo }";
				var backmn = "${param.backmn}";
				$("#home").load(backdo,"mn="+backmn+"&currentPage="+currentPage);
			});
			$("#addSub").click(function() {
				$(".tip").text("");
				var currentPage = ${currentPage };
				var orderId = ${order.orderId };
				var clientName = $("#clientName").val();
				var orderNo = $("#orderNo").val();
				if(clientName==""||clientName==null){
					$(".homeTip").text("请输入客户抬头");
					$(".homeTip").show(200);
					$("#clientName").focus();
					setTimeout(function(){
						$(".homeTip").fadeOut(1000);
					},1000);
				}else{
					$.ajax({
						"url":"client.do",
						"type":"post",
						"data":"mn=checkClient&clientName="+clientName,
						"success":function(res){
							if(res==0){
								$("#clientTip").text("不存在此公司，请先添加");
							}else{
								$("#clientTip").text("");
								$("#clientId").val(res);
								var content = $("#frm").serialize();
								$.ajax({
									"url":"order.do",
									"type":"post",
									"data":"mn=updateOrder&orderId="+orderId+"&"+content,
									"success":function(res){
										if(res==1){
											var backdo = "${param.backdo }";
											var backmn = "${param.backmn}";
											$(".homeTip").text("修改成功！");
											$(".homeTip").show(200);
											$("#home").load(backdo,"mn="+backmn+"&currentPage="+currentPage);
											setTimeout(function(){
												$(".homeTip").fadeOut(1000);
											},1000);
										}else if(res==0){
											alert("添加失败");
										}
									}
								});
							}
						}
					});
				}
			});
		</script>
	</body>