<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/theme.css">
	<style>
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

.label-type, .label-status, .label-order {
    background-color: #fff;
    color: #f60;
    padding : 5px;
    border: 1px #f60 solid;
}
#typeList  :not(:first-child) {
    margin-top:20px;
}
.label-text {
    margin:0 10px;
}
.panel {
    border-radius:0;
}
.progress-bar-default {
    background-color: #ddd;
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


<div style="height: 20px;"></div>
	
    <div class="container theme-showcase" role="main">

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel panel-default" >
                        <div class="panel-heading" style="text-align:center;">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">1. 仔细阅读考生需知</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(92, 184, 92, 1);
                                             border-top-color: rgba(92, 184, 92, 0);
                                             border-bottom-color: rgba(92, 184, 92, 0);
                                             border-right-color: rgba(92, 184, 92, 0);
                                        ">
                                        </div>
                                    </div>
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">2. 选择考试科目类型</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(221, 221, 221, 1);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-bottom-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                        ">
                                        </div>
                                    </div>
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">3. 填写考生信息</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(221, 221, 221, 1);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-bottom-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                        ">
                                        </div>
                                    </div>
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;">
                                          <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">4. 报名完成</div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
    <div class="container theme-showcase" role="main">       
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column" style="padding-right: 50px;">
                    <div class="panel panel-default" >                       
                        <div class="panel-body" style="height:400px;overflow-y:auto;padding:10px;">
				<div class="test-box">
	
				<h4>一.CET考试</h4>
					<p>  &nbsp;&nbsp; &nbsp;&nbsp;全国大学英语四、六级考试(CET)系教育部主办、教育部考试中心主持和实施的一项大规模标准化考试。自1987年开始实施以来，四、六级考试已走过了近三十年的历程。为顺应我国高等教育发展的形势，深化大学英语的教学改革，四、六级考试经历了多次改革和完善，目前考试内容涵盖听、说、读、写、译等语言技能。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;CET笔试考试时间为每年6月和12月，CET口试考试时间为每年5月和11月。自2016年12月起，报考同一年度笔试的考生则具备报考同一级别口语考试资格。相关信息详见www.cet.edu.cn.</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;CET同时设有非英语考试科目，包括日语四级(CJT4)、日语六级(CJT6)、俄语四级(CRT4)、俄语六级(CRT6)、德语四级(CGT4)、德语六级(CGT6)和法语四级(CFT4)，非英语考试科目每年6月开考一次，且不含口语考核环节。</p>
					<h4>二.NCRE考试</h4>
					<p>　全国计算机等级考试（National Computer Rank Examination，简称NCRE），是经原国家教育委员会（现教育部）批准，由教育部考试中心主办，面向社会，用于考查应试人员计算机应用知识与技能的全国性计算机水平考试体系。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;一级：操作技能级。考核计算机基础知识及计算机基本操作能力，包括Office办公软件、图形图像软件、网络安全素质教育。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;二级：程序设计/办公软件高级应用级。考核内容包括计算机语言与基础程序设计能力，要求参试者掌握一门计算机语言，可选类别有高级语言程序设计类、数据库程序设计类等；二级还包括办公软件高级应用能力，要求参试者具有计算机应用知识及MS Office办公软件的高级应用能力，能够在实际办公环境中开展具体应用。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;三级：工程师预备级。三级证书考核面向应用、面向职业的岗位专业技能。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;四级：工程师级。四级证书面向已持有三级相关证书的考生，考核计算机专业课程，是面向应用、面向职业的工程师岗位证书。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;报名者不受年龄、职业、学历等限制，均可根据自己学习情况和实际能力选考相应的级别和科目。考生可按照省级承办机构公布的流程在网上或考点进行报名。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;每次考试具体报名时间由各省级承办机构规定，可登录各省级承办机构网站查询。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;NCRE考试实行百分制计分，但以等第形式通知考生成绩。成绩等第分为“优秀”、“良好”、“及格”、“不及格”四等。100-90分为“优秀”，89-80分为“良好”，79-60分为“及格”，59-0分为“不及格”。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;考试成绩优秀者，在证书上注明“优秀”字样；考试成绩良好者，在证书上注明“良好”字样；考试成绩及格者，在证书上注明“合格”字样。</p>
					<p>　 &nbsp;&nbsp; &nbsp;&nbsp;自1994年开考以来，NCRE适应了市场经济发展的需要，考试持续发展，考生人数逐年递增，至2017年底，累计考生人数超过7600万，累计获证人数近2900万。</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;全国计算机等级考试简介（2018版）</p>
					<h4>三.普通话考试</h4>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;一级（标准级别）话剧、电影、电视剧、广播剧等表演、配音演 员，播音、主持专业和影视表演专业的教师、 学生，普通话水平不低于一级。普通话语音教 师不低于一级；</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;二级（标准级别）报考中小学、幼儿园教师资格的人员（包含各 教育单位在职教师），普通话水平不低于二级； 其中语文教师、对外汉语教师不低于二级甲等； 师范类专业及各级职业学校的与口语表达密切 相关专业的学生，普通话水平不低于二级；公 共服务行业的特定岗位人员（如广播员、解说 员、话务员等），普通话水平不低于二级甲等</p>
					<p> &nbsp;&nbsp; &nbsp;&nbsp;三级（标准级别）
						 &nbsp;&nbsp; &nbsp;&nbsp;国家公务员，普通话水平不低于三级甲等;高等 学校的教师，普通话水平不低于三级甲等</p>
				</div>
            </div>
              <div class="panel-footer" style="text-align:center;">
                            <button type="button" class="btn  btn-warning btn-lg" onclick="window.location.href='${APP_PATH}/enroll/upRealInfo.htm?id=${param.id}'">我已阅读</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="container" style="margin-top:20px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer">
                        <div class="footerNav">
                        </div>
                        <div class="copyRight">
                            Copyright @朱梅 汪朋 版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
      
    </div> <!-- /container -->
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
    <script src="${APP_PATH}/script/back-to-top.js"></script>
	<script src="${APP_PATH}/script/operate-modal.js"></script>
	<script>
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	</script>
  </body>
</html>