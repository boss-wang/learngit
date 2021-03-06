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
<li><img src="images/side-cate.png">    <a id="fastAddOrder" title="快速下单">快速下单</a></li>
<li><img src="images/side-cate.png">    <a class="selectorder" title="订单追踪">订单追踪</a></li>
</ul>
</div>
<div class="s-contact-title"><a class="contactUs" title="联系我们" style="color: white;">联系我们</a></div>
<div><img src="images/side-contact.jpg"></div>
    </div>

	<div class="content">
		<div class="content-title">
			当前位置<span>></span> <a class="homepage" title="首页">首页</a> <span>></span>
			<a class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a
				class="serviceTerms" title="帮助支持">帮助支持</a>
		</div>
		<div class="a-cont">
			<h1>大田进口如何节省成本</h1>
			<h4>2015年12月12日</h4>
			<div class="cont">
				<strong>进口分为两种方式：</strong><br />
				正常的打税一般贸易缴税进口，一般是增值税17%+关税+中港拖车费+报关费等，这种方式进口费用高额，手续繁杂需要客户提供各种单证票据才能正常报关回来，一旦某个环节有问题，将会影响整个货物的操作。<br />
				另外一种方式：从大田中转进口，台湾小小额贸易报关（简称：小三通），快件，商务车、空运、水客带货清关等等&nbsp;的方式进行申报，通过这些绿色通道申报来降低关税，降低成本，快速进口，。我们主要重点介绍这种快捷的、低成本的、简单的，进口操作模式<br />
				&nbsp;<br /> <strong>第一，操作的一个流程</strong><br /> 操作流程：国外-大田-国内<br />
				A.货物在国外的客户：英国/日本/美国/法国/新西兰/澳洲等国外客户，通过空运，海运或是快递，把货物发到我大田公司或航空公司或船公司码头，我司即可安排大田换单，提货，办理大田当地手续等.&nbsp;我大田公司收到货以后以，根据货物的实际情况来安排清关方式，免除了一般贸易进口的复杂手续，不需要客户提供任何的单证票据合同，只需要装箱单即可，客户只需大田交货，天津接货即可，货到广东再支付运费，整个过程手续简单、安全快捷！<br />
				B.货物在大田的客户：您可以送货到我大田公司，也可以通知我们上门提货，我大田公司收到货以后，做单申报安排进口。<br />
				我们负责货物到港后的全部手续，费用按重量计算，大大降低进口成本，简化进口手续，进物口货一般两至三个工作日可送达客户手中，保证绝对安全、快捷、价优。解决进口难题!<br />
				&nbsp;<br /> <strong>第二、我们能接的货物</strong><br />
				我们所能接收的货物，形形色色的货物都可以，各种高低货值的产品、百家货，没办法检疫商检的，没有什么单证票据的，等等！都可以通过我们这样的渠道进行申报！进一步解决一些因各方面原因不能进口的产品的难题！为工厂公司企业解决了后顾之忧！<br />
				&nbsp;<br /> <strong>第三、如何保证货物安全？</strong><br />
				您若安排发货到我司大田仓库，我们将会把实际收到货物的箱数与包装一一反馈给客户，如有需求，我们可以提供大田货物的包装照片给客户，我们收到货后再安排进口手续，货进口到天津后再为您核查相对应批次的产品件数与包装等问题是否与您交货给我司时相符，如相符，即通知客户付款，来我司提货。整个操作完成。整个操作流程有人员对货物进行全程跟踪！<br />
				&nbsp;<br /> <strong>第四：优势</strong><br />
				我们帮你选择合适的进口通道,合理的为你免除进口货物所需的文件和费用.专业协助客户处理疑难货物的进口清关,&nbsp;快速大量的帮你处理进口货物.可处理他人不能处理之业务!&nbsp;为您省时，省力，省钱，省心！进口安全性高：进口方式采用合法的邮政快件进口和一般贸易进口，没有罚没风险。<br />
				进口手续全免：海关监管条件简单,不用进口相关证件，不用检验证明。<br />
				进口速度特快：根据你的货物信息和货物缓急安排渠道.高效低成本。<br />
				进口费用特低：根据国家进出境快件监管办法等法规规定，快件进出境可以享有税费减免优惠<br />

			</div>
		</div>
	</div>
</div>
<script>
$(".homepage").click(function() {
	window.location.href="index.jsp";
});

$(".tradeNews").click(function() {
	$("#homeDiv").load("tradeNews.html");
});

$(".serviceTerms").click(function() {
	$("#homeDiv").load("serviceTerms.html");
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

$("#fastAddOrder,#cost").click(function(){
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
