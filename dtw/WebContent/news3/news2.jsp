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
            当前位置<span>></span>                <a class="homepage" title="首页">首页</a>
					<span>></span>
					<a class="tradeNews" title="新闻中心">新闻中心</a>
					<span>></span>
					<a class="tradeNews" title="行业新闻">行业新闻</a>
        </div>
        <div class="a-cont">
            <h1>美容护肤品进口清关报关|化妆品大田快件进口代理</h1>
            <h4>2015年12月12日</h4>
            <div class="cont">
                　　随着社会的发展，国人越来越向往国外美容护肤产品，那么对于国外的美容护肤品如何运输到内地呢？下面给大家介绍下美容护肤品进入中国大陆的运输方式：<br />
&nbsp;<br />
1、一般贸易进口美容护肤产品需要的证件及税费：<br />
　　（一）检验申请表；&nbsp;<br />
　　（二）检验受理通知书；&nbsp;<br />
　　（三）产品说明书；&nbsp;<br />
　　（四）检验报告；&nbsp;<br />
　　（五）产品原包装（含产品标签）。拟专为中国市场设计包装上市的，需同时提供产品设计包（含产品标签）；&nbsp;<br />
　　（六）产品在生产国（地区）或原产国（地区）允许生产销售的证明文件；&nbsp;<br />
　　（七）来自发生&ldquo;疯牛病&rdquo;国家或地区的进口化妆品，应按要求提供官方检疫证书；&nbsp;<br />
　　（八）代理申报的，应提供委托代理证明；&nbsp;<br />
　　（九）可能有助于评审的其它资料。<br />
&nbsp;<br />
　　美容护肤品产品一般贸易的关税主要有1.关税：14%；2.&nbsp;增值税：17%；3.&nbsp;消费税：0，不同的品名有不同的关税，所以走一般贸易进口美容护肤品是需要很大的实力及资金。<br />
&nbsp;<br />
2、直邮美容护肤品到内地：<br />
　　有很多在国外采用国际快递直邮到内地的客户相信都知道，直邮的数量不能过多，直邮到内地风险性是很大，是很容易被海关扣货，被扣之后处理起来也是很繁琐的，而且时间也久，还需要缴纳关税。也有被退回及没收销毁都是很正常。所以直邮相对来说被扣的概率大，只能寄少量，被扣之后办理也非常麻烦。<br />
&nbsp;<br />
3、天津大田集团物流包税进口护肤品：<br />
　　1&gt;、手续简：无须证，只需提供准确的货物品名及大田提货地址，我们将为你代办&nbsp;各种手续。<br />
　　2&gt;、安全高：正规快件报关，中港车运输。<br />
　　3&gt;、费用优：包税包费，公斤或按货值计价。（每公斤的计价中，包括运费、税费及手续费）<br />
　　4&gt;、速度快：当天收货，3-5工作日货物可到天津。(大货、柜货一样可以快速清关，价格优惠低廉)。<br />
　　5&gt;、通关能力：&nbsp;公司报关人员熟知海关法律法规，与海关、检验检疫局等政府部门关系良好，能灵活处理货物，使货物能顺利、快速、安全通关<br />
&nbsp;<br />
　　少量，散货，整柜，都是可以正常安排清关过来，而且是包税清关，国外只需要把货物发到大田我司指定地址，然后剩下的就交给我们就行，国内只要有人收货就可以了。<br />
　　所以说化妆品进口想避免被海关扣货，又想避免繁杂的进口手续又想合理避税的，最佳的方法就是从大田中转进口&nbsp;<br />
　　国外-大田中转-大陆的进口报关清关，安全高效，给到您想要的价格与服务<br />
　　易达中港国际物流有限公司专业为您解决一切进口难题，降低进口成本!<br />

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
  