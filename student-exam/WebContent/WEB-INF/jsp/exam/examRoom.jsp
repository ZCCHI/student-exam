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
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
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
				<h1 style="margin-left: 250px;">全国大学生英语考试笔试 </h1>
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
		                                  <td width="120">试卷结构</td>
		                                  <td width="80">测试内容</td>
		                                  <td width="180">测试题型</td>
		                                  <td width="80">题目数量</td>
		                                  <td width="80">分值比例</td>
		                                  <td width="120">考试时间</td>
		                                </tr>
		                              </thead>
		                              
		                              <tbody>
		                              	
		                                <tr>
		                                  <td style="vertical-align:middle;">写作</td>
		                                  <td style="vertical-align:middle;">写作</td>
		                                  <td style="vertical-align:middle;">短文写作</td>
		                                  <td style="vertical-align:middle;">1</td>
		                                  <td style="vertical-align:middle;">15%</td>
		                                  <td style="vertical-align:middle;">30分钟</td>
		                                </tr>
		                                
		                                <tr>
		                                  <td style="vertical-align:middle;" rowspan="3">听力理解</td>
		                                  <td style="vertical-align:middle;">短篇新闻</td>
		                                  <td style="vertical-align:middle;">选择题(单选题)</td>
		                                  <td style="vertical-align:middle;">7</td>
		                                  <td style="vertical-align:middle;">7%</td>
		                                  <td style="vertical-align:middle;" rowspan="3">25分钟</td>
		                                </tr>
		                                <tr>
		                                	<td style="vertical-align:middle;">长对话</td>
		                                  <td style="vertical-align:middle;">选择题(单选题)</td>
		                                  <td style="vertical-align:middle;">8</td>
		                                  <td style="vertical-align:middle;">8%</td>
		                                </tr>
		                                <tr>
		                                	<td style="vertical-align:middle;">听力篇章</td>
		                                  <td style="vertical-align:middle;">选择题(单选题)</td>
		                                  <td style="vertical-align:middle;">10</td>
		                                  <td style="vertical-align:middle;">20%</td>
		                                </tr>
		                                
		                                <tr>
		                                  <td style="vertical-align:middle;" rowspan="3">阅读理解</td>
		                                  <td style="vertical-align:middle;">词汇理解</td>
		                                  <td style="vertical-align:middle;">选词填空</td>
		                                  <td style="vertical-align:middle;">10</td>
		                                  <td style="vertical-align:middle;">10%</td>
		                                  <td style="vertical-align:middle;" rowspan="3">40分钟</td>
		                                </tr>
		                                <tr>
		                                	<td style="vertical-align:middle;">长篇阅读</td>
		                                  <td style="vertical-align:middle;">匹配</td>
		                                  <td style="vertical-align:middle;">10</td>
		                                  <td style="vertical-align:middle;">10%</td>
		                                </tr>
		                                <tr>
		                                	<td style="vertical-align:middle;">仔细阅读</td>
		                                  <td style="vertical-align:middle;">选择题(单选题)</td>
		                                  <td style="vertical-align:middle;">10</td>
		                                  <td style="vertical-align:middle;">20%</td>
		                                </tr>
		                                <tr>
		                               		<td style="vertical-align:middle;">翻译</td>
		                                  <td style="vertical-align:middle;">汉译英</td>
		                                  <td style="vertical-align:middle;">段落翻译</td>
		                                  <td style="vertical-align:middle;">1</td>
		                                  <td style="vertical-align:middle;">15%</td>
		                                  <td style="vertical-align:middle;">30分钟</td>
		                                </tr>
		                                <tr>
		                                	<th colspan="3">总计</th>
		                                	<td style="vertical-align:middle;">57</td>
		                                  <td style="vertical-align:middle;">100%</td>
		                                  <td style="vertical-align:middle;">125分钟</td>
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
        <div class="container" style="margin-top:20px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer">
                        <div class="footerNav">
                             <a rel="nofollow" href="#">关于我们</a>  <a rel="nofollow" href="#">联系我们</a>
                        </div>
                        <div class="copyRight">
                            Copyright @朱梅 汪朋  版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
    <script src="${APP_PATH }/script/back-to-top.js"></script>
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