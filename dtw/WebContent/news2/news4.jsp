<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container clearfix">
<div class="side">
        
<div class="side-title">服务项目</div>
<div class="side-cate">
<ul>
<li><img src="images/side-cate.png">    <a class="fastAddOrder" title="快速下单">快速下单</a></li>
<li><img src="images/side-cate.png">    <a class="selectorder" title="订单追踪">订单追踪</a></li>
</ul>
</div>
<div class="s-contact-title"><a class="contactUs" title="联系我们" style="color: white;">联系我们</a></div>
<div><img src="images/side-contact.jpg"></div>
    </div>

	<div class="content">		
				<div class="content-title" style="margin-top:0px;">
					当前位置<span>></span>
					<a class="homepage" title="首页">首页</a>
					<span>></span>
					<a class="tradeNews" title="新闻中心">新闻中心</a>
					<span>></span>
					<a class="tradeNews" title="行业新闻">行业新闻</a>
				</div>
				<div class="a-cont">
					<h1>仓储物流功能</h1>
					<h4>2016年08月19日</h4>
					<div class="cont">
						<div>
							概况</div>
						<div>
							随着物流向供应链管理的发展，企业越来越多地强调仓储作为供应链中的一个资源提供者的独特角色。仓库再也不仅是存储货物的库房了。</div>
						<div>
							仓储角色的变化，用一句活概括，就是仓库向配送中心的转化。传统仓库与配送中心的本质区别是：仓库侧重于管理空间，而配送中心更侧重于管理时间（即物品周转速度），所以说，二者的本质区别是配送中心既管理空间又管理时间。</div>
						<div>
							角色</div>
						<div>
							首先，仓储是物流与供应链中的库存控制中心。库存成本是主要的供应链成本之一。在美国，库存成本约占总物流成本的三分之一。因此，管理库存、减少库存、控制库存成本就成为仓储在供应链框架下降低供应链总成本的主要任务。</div>
						<div>
							其次，仓储是物流与供应链中的调度中心。仓储直接与供应链的效率和反应速度相关。人们希望现代仓储处理物品的准确率能达到99%以上，并能够对特殊需求做出快速反应。当日配送已</div>
						<div>
							经成为许多仓库所采用的一种业务方式。客户和仓库管理人员不断提高精确度、及时性、灵活性和对客户需求的反应程度等方面的目标。</div>
						<div>
							再次，仓储是物流与供应链中的增值服务中心。
						<div>
							最后，仓储还是现代物流设备与技术的主要应用中心。供应链一体化管理，是通过现代管理技术和科技手段的应用而实现的，这种应用更多地体现在仓储。流程管理、质量管理、逆向物流管理等管理手段提高了仓储效率，促进了供应链上的一体化运作，而软件技术、互联网技术、自动分拣技术、光导分拣、RFID、声控技术等先进的科技手段和设备的应用，则为提高仓储效率提供了实现的条件。</div>
						<div>
							&nbsp;</div>

					</div>
				</div>
		</div>
		</div>
		</div>
			<script>
		
			$(".homepage").click(function(){
				window.location.href="index.jsp";
			});
			
			$(".tradeNews").click(function(){
				$("#homeDiv").load("tradeNews.jsp");
			});
			
			$(".contactUs").click(function() {
				$("#homeDiv").load("contactUs.jsp");
			});

			$(".selectorder").click(function(){
				var status ='${customer.statusId}';
				if(status=='1'){
					window.location.href="#abstract";
					$("#homeDiv").load("bangdinggongsi.jsp");
				}else if(status=='3'){
					window.location.href="#abstract";
					$("#homeDiv").load("showMyOrder.jsp");
				}else if(status=='2'){
					alert("您绑定的公司正在审核中，通过即可下单");
				}else{
					window.location.href="<%=basePath%>login.jsp";
				}
				
			});

			$(".fastAddOrder").click(function(){
				var status ='${customer.statusId}';
				if(status=='1'){
					window.location.href="#abstract";
					$("#homeDiv").load("bangdinggongsi.jsp");
				}else if(status=='3'){
					window.location.href="#abstract";
					$("#homeDiv").load("custorder.do","mn=goAddCustomerOrder");
				}else if(status=='2'){
					alert("您绑定的公司正在审核中，通过即可下单");
				}else{
					window.location.href="<%=basePath%>login.jsp";
				}
			});
		</script>
