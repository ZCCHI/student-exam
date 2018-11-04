<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
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

	</style>
  </head>
  <body>
  <%@ include file="/WEB-INF/jsp/common/modal2.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal3.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal1.jsp"%>
  	<div class="navbar-wrapper">
      <jsp:include page="/WEB-INF/jsp/common/myNav.jsp"></jsp:include>  
    </div>
<div class="container" style=" margin-left: 270px;">
	<div>
		<h3 style="color: red;">提示:全国大学生英语考场地点为：${examInfo.address }   考试日期为：${examInfo.date}</h3>
	</div>
	<hr />
	<div class="row clearfix">
			<div>
				<h1 style="margin-left: 250px;">全国普通话等级考试</h1>
			</div>
			<hr />
	</div>
		<div class="col-sm-9 col-md-9 column">
		  <div id="myTabContent" class="tab-content" style="margin-top:10px;">
		  <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">		        
		        <div id="myTab1" class="tab-content" style="margin-top:10px;">
		            <div role="tabpanel" class="tab-pane fade active in" id="support" aria-labelledby="home-tab">
		                <div class="container-fluid">
		                    <div class="row clearfix">
		                        <div class="col-md-12 column" style="margin-top:10px;padding:0;">
		                            <table class="table table-bordered" style="text-align:center;">
		                            	
		                              <thead>
		                                <tr style="background-color:#ddd;">
		                                  <td width="100">级别</td>
		                                  <td width="100">等级</td>
		                                  <td width="180">标准</td>
		                                  <td width="300">从业类型</td>
		                                </tr>
		                              </thead>
		                              
		                              <tbody>
		                              	
		                                <tr>
		                                  <td style="vertical-align:middle;" rowspan="2">一级</td>
		                                  <td style="vertical-align:middle;">甲等</td>
		                                  <td style="vertical-align:middle;">97~100分</td>
		                                  <td style="vertical-align:middle;" rowspan="2">话剧、电影、电视剧、广播剧等表演、配音演 员，播音、主持专业和影视表演专业的教师、 学生，普通话水平不低于一级。普通话语音教 师不低于一级；</td>
		                                </tr>
		                                <tr>
		                                  <td style="vertical-align:middle;">乙等</td>
		                                  <td style="vertical-align:middle;">92~96.99分</td>
		                                </tr>
		                                 <tr>
		                                  <td style="vertical-align:middle;" rowspan="2">二级</td>
		                                  <td style="vertical-align:middle;">甲等</td>
		                                  <td style="vertical-align:middle;">87~91.99分</td>
		                                  <td style="vertical-align:middle;" rowspan="2">报考中小学、幼儿园教师资格的人员（包含各 教育单位在职教师），普通话水平不低于二级； 其中语文教师、对外汉语教师不低于二级甲等； 师范类专业及各级职业学校的与口语表达密切 相关专业的学生，普通话水平不低于二级；公 共服务行业的特定岗位人员（如广播员、解说 员、话务员等），普通话水平不低于二级甲等

</td>
		                                </tr>
		                                <tr>
		                                  <td style="vertical-align:middle;">乙等</td>
		                                  <td style="vertical-align:middle;">80~86.99分</td>
		                                </tr>
		                                 <tr>
		                                  <td style="vertical-align:middle;" rowspan="2">三级</td>
		                                  <td style="vertical-align:middle;">甲等</td>
		                                  <td style="vertical-align:middle;">70~79.99分</td>
		                                  <td style="vertical-align:middle;" rowspan="2">国家公务员，普通话水平不低于三级甲等;高等 学校的教师，普通话水平不低于三级甲等</td>
		                                </tr>
		                                <tr>
		                                  <td style="vertical-align:middle;">乙等</td>
		                                  <td style="vertical-align:middle;">60~69.99分</td>
		                                </tr>
		                                
		                              </tbody>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		            </div>
                                                    
                </div>
                  
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                  众筹资产
                  </div>
            </div>
		</div>
	</div>
</div>
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
$('#myTab1 a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	</script>
  </body>
</html>