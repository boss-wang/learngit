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
					<h1>奢侈品代收转运|香港包税清关转运内地</h1>
					<h4>2015年12月12日</h4>
					<div class="cont">
						天津大田集团物流有限公司长期代理国外奢侈品中转香港包税进口清关运输到内地！<br /> 　　近年来，国外奢侈品电商相继推出了中国促销计划，国内很少打折的路易威登、葆蝶家等品牌亦是赫然在列。不少消费者发现，通过现代发达的物流业，在国内即可购买到海外电商平台所售奢侈品，虽然这些消费者确实享受到与国外消费者同等的价格待遇，但通过海淘所购买的奢侈品也为其带来了很多消费风险。
						<br /> 　　虽然不少奢侈品集团在近期发布的财报中称，在华销售增速有明显放缓趋势，但来自贝恩公司与意大利Altagamma基金会的调查数据却显示，在当前的全球奢侈品市场中，中国消费者的市场份额已从25%增长至约30%。
						<br /> 　　显然，奢侈品集团虽然在华销售一时遇阻，却从未失去中国消费者的青睐，华人在海外购买奢侈品的支出弥补了其在华所失去的销售额。
						<br /> 　　在调查中发现，对于多数国内消费者而言，其青睐海外购买奢侈品的最主要原因是价格便宜。
						<br /> 　　对于奢侈品来说，物流转运非常重要。奢侈品国外网站下单，直邮走EMS、DHL、Fedex等，能保证货物安全~，不过价格确实是高，并且基本都是要缴税的。现在海淘的一些转运公司，都不发1000美金以上的，而且风险很大。
						<br /> 　　最近，警方查获一起奢侈品偷税漏税进关的事件，高大上的门店，他们却采取水客人肉带货，最终被查处。
						<br /> 　　香港进口报关是通过快件和拼柜进口的形式向海关递交报关资料！合法清关－－安全快捷－－时效稳定－－速度快捷－－&gt;真真正正为您做到中港进口无忧！
						<br /> &nbsp;
						<br /> 香港转运奢侈品优势:
						<br /> 　　香港属于免税港，高昂奢侈品进香港无税进港，不比担心扣的风险
						<br /> 　　1、手续特简：不需要货主专门提供报关单、通关单证、许可证(比如：3C国家强制认证、环保证书、进口配额等都不需要)。
						<br /> 　　2、费用低：根据国家进出境快件监管办法等法规规定，快件进出境可以享有一定的税费减免优惠。再加上天津靠近香港这个国际自由港的地缘优势，操作方便，税率低，运作费用低，成本自然就更低了。
						<br /> 　　3、速度特快：奢侈品一律采取空运清关的方式，不需要等待拼柜的时间。
						<br /> &nbsp;
						<br /> 快件进口的优势所在：
						<br /> 　　1、手续方便:无需提供报关单证,只需提供准确的货物品名机香港提货地址,我们将为代办各种手续
						<br /> 　　2、安全性能高:正规快件报关,享受政策,港车运输。
						<br /> 　　3、价格优惠:包税包费,按公斤或货值计价(每公斤的计价中,包括运费,税费及手续费)
						<br /> 　　4、时效快:当天收货,2~3天货物可到天津(大货,货柜一样可以快速清关,价格实惠)
						<br /> &nbsp;
						<br /> 　　天津大田集团物流有限公司，多年进口清关经验。多年来专业代理香港快件包税进口清关服务！
						<br />

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
	