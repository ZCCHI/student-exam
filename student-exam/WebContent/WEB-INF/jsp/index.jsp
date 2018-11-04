<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/carousel.css">
	<style>
    h3 {
        font-weight:bold;
    }
#footer {
    padding: 15px 0;
    background: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}
#topcontrol {
  color: #fff;
  z-index: 99;
  width: 30px;
  height: 30px;
  font-size: 20px;
  background: #222;
  position: relative;
  right: 14px !important;
  bottom: 11px !important;
  border-radius: 3px !important;
}

#topcontrol:after {
  /*top: -2px;*/
  left: 8.5px;
  content: "\f106";
  position: absolute;
  text-align: center;
  font-family: FontAwesome;
}

#topcontrol:hover {
    color: #fff;
    background: #18ba9b;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}
/* 侧栏导航 */
.sideBox{padding:10px;height:220px;background:#fff;margin-bottom:10px;overflow:hidden;}
.sideBox .hd{height:30px; line-height:30px; background:#f60; padding:0 10px;text-align:center;overflow:hidden;}
.sideBox .hd .more{color:#fff;}
.sideBox .hd h3 span{font-weight:bold; font-size:14px;color:#fff;}
.sideBox .bd{padding:5px 0 0;}

#sideMenu .bd li{margin-bottom:2px; height:30px; line-height:30px;text-align:center; overflow:hidden;}
#sideMenu .bd li a{display:block;background:#EAE6DD;}
#sideMenu .bd li a:hover{background:#D5CFBF;}

/* 列表页 */
#mainBox{margin-bottom:10px;padding:10px;background:#fff;overflow:hidden;}
#mainBox .mHd{border-bottom:2px solid #09c;height:30px;line-height:30px;}
#mainBox .mHd h3{display:initial;*display:inline;zoom:1;padding:0 15px;background:#09c;color:#fff;}
#mainBox .mHd h3 span{color:#fff;font-size:14px;font-weight:bold;}
#mainBox .path{float:right;}

/* 位置导航 */
.path{ height:30px; line-height:30px; padding-left:10px;}
.path a,.path span{ margin:0 5px;}

/* 文章列表 */
.newsList{padding:10px;text-align:left;}
.newsList li{background:url("../images/share/point.png") no-repeat 2px 14px; padding-left:10px;height:30px; line-height:30px;}
.newsList li a{display:inline-block;*display:inline;zoom:1;font-size:14px;}
.newsList li .date{float:right; color:#999;}
.newsList li.split{margin-bottom:10px;padding-bottom:10px;border-bottom:1px dotted #ddd;height:0px;line-height:0px;overflow:hidden;}

/* 通用带图片的信息列表_普通式 */
.picList{padding:10px;text-align:left;}
.picList li{margin:0 5px;height:190px;}

h3.break {
    font-size:16px;
    display: block;
    white-space: nowrap;
    word-wrap: normal;
    overflow: hidden;
    text-overflow: ellipsis;
}
h3.break>a {
    text-decoration:none;
}

	</style>
  </head>
  <body>
  
  	<%@ include file="/WEB-INF/jsp/common/modal2.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal3.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal1.jsp"%> 
 <div class="navbar-wrapper">	
	<jsp:include page="/WEB-INF/jsp/common/myNav.jsp"></jsp:include> 
	   
    </div>

    <div  style="height: 50px;">    
    </div>


    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="${APP_PATH}/img/360.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>最新考试动态</h2> 
          
         <c:forEach items="${examList }" var="exam">
	         <p><a href="${APP_PATH }/exam/examInfo.htm?id=${exam.id}" title="${exam.typename } ${exam.date}">${exam.typename }：${exam.date}<span style="color: red;">【new】</span></a> </p>	         
          </c:forEach>       
          
     
        </div>
        <div class="col-lg-4">
          <img class="img-circle" src="${APP_PATH}/img/lalala.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>报名流程</h2>
          <p>等级考试报名前，请仔细阅读报名流程。</p>
          <p><a class="btn btn-default" href="${APP_PATH }/enroll/enrollProcess.htm" role="button">查看报名流程 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="${APP_PATH}/img/solo.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>考试资讯</h2>
          <p>报名未开始前，考生可进行注册及学籍信息验证操作，具体报名时间以各学校通知为准。</p>
          <p><a class="btn btn-default" href="${APP_PATH }/news/mynews.htm" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
      
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="box ui-draggable" id="mainBox">
				<div class="mHd" style="">
					<div class="path">
						<a href="#">拒绝舞弊.诚信考试</a>
					</div>
					<h3>
						考试 <small style="color:#FFF;">进入报名</small>
					</h3>
				</div>
				<div class="mBd" style="padding-top:10px;">
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail english">
						<img alt="300x200" src="${APP_PATH}/img/yingyu.jpg" />
						<div class="caption">
							<h3 class="break">
								<a href="${APP_PATH }/enroll/knowNote.htm?id=1">英语等级考试报名入口</a>
							</h3>              
                <p>
                   <div><span style="float:right;"><i class="glyphicon glyphicon-star-empty" ></i></span>  <span ><i class="glyphicon glyphicon-user" title="已报名人数"></i>已报名人数： 125</span> </div>
						 		</p>
						</div>
					</div>
				</div>
			
			
			<div class="col-md-4">
					<div class="thumbnail computer">
						<img alt="300x200" width="300px" height="300px" src="${APP_PATH}/img/jisuanji.jpg" />
						<div class="caption">
							<h3 class="break">
								<a href="${APP_PATH }/enroll/knowNote.htm?id=6">计算机等级考试报名入口</a>
							</h3>              
                <p>
                   <div><span style="float:right;"><i class="glyphicon glyphicon-star-empty" ></i></span>  <span ><i class="glyphicon glyphicon-user" title="已报名人数"></i>已报名人数： 69</span> </div>
						 		</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="thumbnail putonghua">
						<img alt="300x200" src="${APP_PATH}/img/putonghu.jpg" />
						<div class="caption">
							<h3 class="break">
								<a href="${APP_PATH }/enroll/knowNote.htm?id=16">普通话等级考试报名入口</a>
							</h3>              
                <p>
                   <div><span style="float:right;"><i class="glyphicon glyphicon-star-empty" ></i></span>  <span ><i class="glyphicon glyphicon-user" title="已报名人数"></i>已报名人数： 45</span> </div>
						 		</p>
						</div>
					</div>
				</div>
	
	</div>
</div>
      
 <!-- ============================================================================== -->
      
      <!-- FOOTER -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div id="footer">
				<div class="footerNav">
					 <a rel="nofollow" href="#">关于我们</a> | <a rel="nofollow" href="#">联系我们</a>
				</div>
				<div class="copyRight">
					Copyright @ 朱梅 汪朋 版权所有
				</div>
			</div>
			
		</div>
	</div>
</div>

    </div><!-- /.container -->
    
    <!-- ======================================================================================================================= -->
    <!-- 考生须知模态框 -->
        
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog "  style="width:960px;height:400px;" role="document">
        <div class="modal-content" data-spy="scroll" data-target="#myScrollspy">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">考试须知</h4>
          </div>
          <div class="modal-body">
<div class="container-fluid">
	<div class="row clearfix">
      <div class="panel-body" style="height:400px;overflow-y:auto;padding:10px;">	
				<div class="test-box">
					<h4>一.开考科目及时间:</h4>
					<p> 2018 年下半年全国大学英语四、六级考试（以下简称“CET”）笔试时间为 12 月 15 日。</p>
					<p> 2018 年下半年笔试开考科目为英语四级(以下简称为“CET4”)，英语六级(以下简称为“CET6”)。</p>
					<h5> 各科目时间安排：</h5>			
					<p>英语四级考试(CET4):9:00~11:30</p>
					<p>英语六级考试(CET6):15:00~17:25</p>
					<h4>二.报名资格相关事项</h4>
					<p>考生报考前须按本系统要求进行注册和登录，登录成功后，提供正确的姓名和身份证号进行资格验证。</p>
					<p>如对资格验证后个人信息、学籍信息及可报考科目有异议，可联系所在学校相关部门核实。</p>
					<p> 报考 CET6 考生的 CET4 成绩须在 425 分及以上，符合报考条件的考生没有获得 CET6 报考资格时，考
							生可在系统中提交 CET4 成绩在 425 分及以上考试的准考证号进行再次审核，如审核通过，系统将会通过邮
							件通知考生再次进行报考。如 CET4 成绩为 2005 年以前，则须联系所在学校相关部门。
					</p>
					<h4>二.报名缴费相关事项</h4>
					<p>考生须在所在学校规定时间内通过全国大学英语四、六级考试报名网站（cet.etest.net.cn）完成报
							考，其中包括信息核对、资格审核及网上缴费等操作。报名网站支持银联和支付宝两种支付方式。其
							中银联支持以下银行卡：
					</p>
					<p>中国工商银行、中国农业银行、中国建设银行、中国银行、招商银行、中信银行、民生银行、兴业银
						行、广发银行、华夏银行、中国光大银行、平安银行、中国邮政储蓄银行、上海银行、北京银行、北
						京农商银行、上海农商银行
					</p>
					<p>考生须对照片、学校及院系信息进行核对，如有错误须立即联系所在学校相关部门进行更正，确认以上信息后则不得修改。</p>
					<p>考生不可同时报考同一时间段内的两门及以上科目，不同时间段的科目能否同时报考，须符合所在学校的规定。</p>
					<p>
						报名成功的考生须于 2018 年 12 月 3 日 9 时后登录全国大学英语四、六级考试报名网站（cet.etest.net.cn）下载并打印准考证，或按学校相关规定领取准考证。
					</p>
					<p>
						报名及打印准考证过程中出现系统问题，考生可拨打 CET 报名咨询电话：010-62987880。
					</p>
				</div>
			</div>
			<div class="panel-footer" style="text-align:center;">
				<button type="button" class="btn  btn-warning btn-lg" id="closeModal">阅读并同意协议</button>
			</div>
	</div>
</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ================================================================================== -->
    <!-- 常见问题模态框 -->
    <!-- ================================================================================== -->
		<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog "  style="width:960px;height:400px;" role="document">
        <div class="modal-content" data-spy="scroll" data-target="#myScrollspy">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">常见问题</h4>
          </div>
          <div class="modal-body">
<div class="container-fluid">
	<div class="row clearfix">
      <div class="panel-body" style="height:400px;overflow-y:auto;padding:10px;">	
				<div class="test-box">
								<h4>一.CET（含口语CET-SET）网上报名流程</h4>
								<p>1.考生登录报名网站点击“进入报名”按钮后进行登录，如首次登录请先进行注册。</p>
								<p>2.登录成功后，考生输入姓名、身份证件号验证个人、学籍及可报科目信息。</p>
								<p>3.考生确认个人、学籍及可报科目信息无误后，点击确认进入到科目报考阶段。如对以上信息有异议，请联系学校有关部门。</p>
								<p>4.考生进行笔试科目的报考与缴费，笔试科目考点为考生所在学校，无须选择。</p>
								<p>5.完成笔试科目报考后，考生可以进行口试科目的报考，缴费时需先支付完成笔试科目，再支付口试科目，口语考点可由学生在本省内开考的考点内选择。</p>
								<p>6.考生确认自己所选科目后，须在24小时之内完成缴费，否则报考失效。</p>
								<p>7.报考完成后，考生可返回查看报考情况。</p>
								<p>8.请报考口语考试的考生按各省级承办机构通知时间登录网站打印准考证。</p>
								<p>9.请报考笔试考生按规定时间登录网站打印准考证或按学校要求领取准考证。</p>
								<h5> 各科目时间安排：</h5>			
								<p>英语四级考试(CET4):9:00~11:30</p>
								<p>英语六级考试(CET6):15:00~17:25</p>
								<h4>二、CET笔试及口试报考资格</h4>
								<p> 1.报考笔试各科目须符合考生所在学校规定的报考资格，报考CET6考生CET4成绩须在425分及以上。</p>
								<p> 2.报考口试各科目，须完成当次对应级别笔试科目的报考及缴费。例如，报考2017年下半年CET-SET4，须完成2017年下半年CET4的报考及缴费。</p>
								<h4>三、有关资格验证的问题</h4>
								<p> 1.资格验证无法通过</p>
								<p>（1）首先请检查姓名、证件类型、证件号码是否正确。</p>
								<p>（2）确保正确后仍无法验证通过，请联系您所在学校的相关部门。</p>
								<p>2.个人信息、学籍信息及报考科目不正确</p>
								<p> 学籍验证通过后，如发现照片、院系、所属学校等信息不正确时请及时联系您所在学校的相关部门进行更改。</p>
								<h4>四、用户注册相关问题</h4>
								<p>1.用户注册信息中姓名、身份证号与学籍信息不一致导致无法进行报考。</p>
								<p>（1）如果是学籍信息错误，请联系您所在学校相关部门进行修改。</p>
								<p style="color: red;">（2）如果是注册信息有误，请通过网站咨询电话申请修改。</p>
								<p>2.姓名中有生僻字怎么注册</p>
								<p>请按照学籍信息中姓名中生僻字的方式进行注册</p>
								<p>3.注册页面没有“提交”按钮或验证码不显示怎么办？</p>
								<p> 建议您使用火狐浏览器、谷歌浏览器、IE9+、360浏览器（选择极速模式）进行操作。</p>
								<p>4.登录账号后页面只显示通行证信息，如何报名？</p>
								<p>请您再次输入CET报名网址cet.etest.net.cn/cet.etest.edu.cn，点击“进入报名”。</p>
								<p>5.密码忘记了怎么办？</p>
								<p>请您点击“找回密码”，通过原注册邮箱进行密码找回。</p>
								<p> 6.注册邮箱忘记了怎么办？</p>
								<p>请拨打客服电话。</p>
								<p>7.怎样更改注册邮箱？</p>
								<p>请考生自行登录通行证网站，点击“修改信息”进行更改邮箱。</p>
								<h4>五、科目选择中遇到的问题</h4>
								<p>1.科目选择界面中没有可报考的科目</p>
								<p>请联系您所在学校相关部门，确定报考资格。</p>
								<p>2.报考科目中没有CET6科目</p>
								<p> 如在科目选择界面允许“申请CET6资格审核”，考生可点击进入，并输入任何一次2005年及cet4在425分及以上考生的
               准考证,进行再次审核。如考生CET4成绩为2005年之前，则需要联系所在学校有关部门。</p>
		   					<p>3.口语科目的报考。</p>
		   					<p>（1）选择CET笔试科目，方可进行CET口试科目的报考。</p>
		   					<p>（2）口试非必考科目。</p>
		   					<p>（3）由于目前开考口语考点相对较少，因此考生可在省内选择口语考点。</p>
		   					<p>（4）口语考试为机考，可提供考位有限。</p>
		   					<p style="color: red;">  4.	报考后是否可取消报考
		
		  如已缴费则无法取消。</p>
							<h4>五.本次考试成绩发布与成绩报告单的领取</h4>
							<p>1.本次考试（含口语）成绩于2019年2月发布，具体发布的时间和方式以全国大学英语四、六级考试网站(www.cet.edu.cn)发布的公告为准。</p>
							<p>2.本次成绩报告单同时报道笔试和口试成绩，口语考试不再单独颁发成绩报告单。考生在同一考次获得CET笔试成绩在 220分及以上或口试成绩在C等级及以上，将对其发放成绩报告单。</p>
								<p>3.考试成绩在220分以下，且无有效口语成绩的，则不发成绩单；口语成绩为D的，不在成绩报告单中显示口语成绩。</p>
								<p>4.CET成绩报告单遗失或损毁后不予补发，参加2005年6月及以后各次考试考生可登录教育部考试中心综合查询网(chaxun.neea.edu.cn)自行办理成绩证明。成绩证明与CET成绩报告单有同等效力。</p>
							</div>
            </div>
            <div class="panel-footer" style="text-align:center;">
                <button type="button" class="btn  btn-warning btn-lg" id="closeModal-2">我已阅读</button>
            </div>
			</div>
	</div>
</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ================================================================================== -->
    <!-- 考试简介模态框 -->
    <!-- ================================================================================== -->
		<div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog "  style="width:960px;height:400px;" role="document">
        <div class="modal-content" data-spy="scroll" data-target="#myScrollspy">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">考试简介</h4>
          </div>
          <div class="modal-body">
<div class="container-fluid">
	<div class="row clearfix">
      <div class="panel-body" style="height:400px;overflow-y:auto;padding:10px;">	
				<div class="test-box">
					<h4>CET考试简介</h4>
					<p>全国大学英语四、六级考试(CET)系教育部主办、教育部考试中心主持和实施的一项大规模标准化考试。自1987年开始实施以来，四、六级考试已走过了近三十年的历程。为顺应我国高等教育发展的形势，深化大学英语的教学改革，四、六级考试经历了多次改革和完善，目前考试内容涵盖听、说、读、写、译等语言技能。</p>
					<p>CET笔试考试时间为每年6月和12月，CET口试考试时间为每年5月和11月。自2016年12月起，报考同一年度笔试的考生则具备报考同一级别口语考试资格。相关信息详见www.cet.edu.cn.</p>
					<p>CET同时设有非英语考试科目，包括日语四级(CJT4)、日语六级(CJT6)、俄语四级(CRT4)、俄语六级(CRT6)、德语四级(CGT4)、德语六级(CGT6)和法语四级(CFT4)，非英语考试科目每年6月开考一次，且不含口语考核环节。</p>
				</div>
      </div>
	    <div class="panel-footer" style="text-align:center;">
	        <button type="button" class="btn  btn-warning btn-lg" id="closeModal-3">我已阅读</button>
	    </div>
		</div>
	</div>
</div>
          </div>
        </div>
      </div>
    </div>

		<!-- ======================================================================================== -->
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
    <script src="${APP_PATH}/script/back-to-top.js"></script>
    <script>
    $(".thumbnail img").css("cursor", "pointer");
    $(".english img").click(function(){
        window.location.href = "${APP_PATH }/enroll/knowNote.htm?id=1";
    });
    $(".computer img").click(function(){
        window.location.href = "${APP_PATH }/enroll/knowNote.htm?id=6";
    });
    $(".putonghua img").click(function(){
        window.location.href = "${APP_PATH }/enroll/knowNote.htm?id=16";
    });
     
    
    
    
    $("#kaoshen").click(function(){
    	
    	$("#myModal").modal("show")
    	
    })
    
    $("#closeModal").click(function(){
    	$("#myModal").modal("hide")
    	
    })
    
    $("#question").click(function(){
    	$("#myModal-1").modal("show")
    })
    
    $("#closeModal-2").click(function(){
    	$("#myModal-1").modal("hide")
    })
    
    $("#jieshao").click(function(){
    	$("#myModal-2").modal("show")
    })
    
    $("#closeModal-3").click(function(){
    	$("#myModal-2").modal("hide")
    })
    
    </script>
  </body>
</html>