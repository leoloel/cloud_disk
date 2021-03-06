<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>BRILLIANT Free Bootstrap Admin Template</title>
<base
	href="<%=(request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + request.getContextPath() + "/")%>" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='assets/css/googleapis.css' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
<!-- 阿里巴巴图标素材库 -->
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<!-- 带表情输入框插件 -->
<link rel="shortcut icon" href="favicon.png">
<link href="emoji_picker/css/emoji.css" rel="stylesheet">
<!-- checkbox -->
<link href="square/orange.css" rel="stylesheet">
<!-- 自定义样式 -->
<link rel="stylesheet" type="text/css" href="css/template.css">
<link rel="stylesheet" type="text/css" href="css/share.css">
</head>
<body>
	<input type="hidden" value="<%=request.getContextPath()%>"
		id="contextPath" />
	<div id="wrapper">

		<jsp:include page="template.jsp" flush="true"></jsp:include>

		<div id="page-wrapper" align="center">
			<!-- 空白区域从此开始 -->
			<div class="box">
				<div class="leftBox">
					<table class="leftTable" cellspacing="0" cellpadding="0">
						<tr>
							<td class="navTd">
								<ul class="nav nav-tabs nav-justified">
									<li class="active"><a href="#session" id="sessionBtn"
										data-toggle="tab">会话</a></li>
									<li class=""><a href="#friends" id="friendBtn"
										data-toggle="tab">好友</a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td valign="top" class="tabContentTd">
								<div class="tab-content  tabContent">
								<!-- 会话面板 -->
									<div class="tab-pane fade active in" id="session">
										<ul class="sessionUl">
											<c:forEach begin="1" end="10" step="1" var="index">
												<li class="sessionLi">
													<div class="sessionInfo" align="left">
														<img class="sessionHead" src="imgs/user_head/default.jpg"
															index="${index }"> <span class="sessionCenterInfo">
															<div>用户名1111</div>
															<div class="latelyRecord">分享文件java笔试面试</div>
														</span> <span class="sessionTime">08-05&nbsp;12:12</span>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<!-- 好友面板 -->
									<div class="tab-pane fade" id="friends">
										<ul class="friendUl">
											<c:forEach items="${relationshipList }" var="relate">
												<li class="friendLi"  relationshipid="${relate.relationshipId }" userid="${relate.friendUser.userId }">
													<div class="friendInfo" align="left">
														<img class="friendHeadInPane"
														 src="imgs/user_head/${relate.friendUser.headImg }" 
														 nickname="${relate.friendUser.nickname }" 
														 remark="${relate.remark }" relationshipid="${relate.relationshipId }" >
														<span class="friendCenterInfo" relationshipid="${relate.relationshipId }" > 
															${(empty relate.remark)?relate.friendUser.nickname:relate.remark} 
														</span>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<!-- 好友详情悬浮框 -->
								<div class="userTipBox">
									<img class="triangle" src="imgs/triangle.png"></img> <img
										src="imgs/user_head/default.jpg" class="userHeadInTip">
									<div class="infoInTip">
										<div class="remarkInTip">
											<span></span><i class="iconfont icon-combinedshape" relationshipid=""></i>
										</div>
										<div class="nicknameInTip">昵称：<span></span></div>
										<div class="accountInTip">百度账号：<span></span></div>
									</div>
									<div class="btnsInTip" align="right">
										<button type="button" class="btn btn-default">分享给Ta文件</button>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												好友 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="#">删除好友</a></li>
												<li><a href="#">加入黑名单</a></li>
											</ul>
										</div>
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<td class="footTd">
								<div class="footDiv">
									<div class="btn-group btn-group-justified" role="group"
										aria-label="...">
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default createGroupBtn">创建群组</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default addFriendBtn">添加好友</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default">设置</button>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="rightBox">
					<%-- <jsp:include page="friend_main.jsp"></jsp:include> --%>
					<%-- <jsp:include page="chat.jsp"></jsp:include> --%>
					<jsp:include page="right_index.jsp"></jsp:include>
				</div>
			</div>
			<!-- 空白区域从此结束 -->
		</div>
	</div>
	<!-- 创建群组Modal -->
	<div class="modal fade" id="createGroupModal" tabindex="-1"
		role="dialog" aria-labelledby="createGroupModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="createGroupModalLabel">创建群组</h4>
				</div>
				<div class="modal-body" align="center">
					<table class="createGroupTable" border="0" cellspacing="0"
						cellspadding="0">
						<tbody>
							<tr class="createGroupHead">
								<td>我的好友</td>
								<td>已选择的好友</td>
							</tr>
							<tr class="createGroupBody">
								<td>
								<!-- 创建群组----我的好友 -->
									<div class="createGroupDiv">
										<ul class="friendUl">
											<c:forEach  items="${relationshipList }" var="relate">
												<li class="friendLi createGroupLi">
													<div class="friendInfo" align="left">
														<img class="friendHead" src="imgs/user_head/${relate.friendUser.headImg }">
														<span class="friendCenterInfo" relationshipid="${relate.relationshipId }" > 
															${(empty relate.remark)?relate.friendUser.nickname:relate.remark} 
														</span>
														<input
															type="checkbox" class="createGroupCheckbox"
															userid="${relate.friendUser.userId }">
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</td>
								<td>
								<!-- 创建群组----被选择的好友 -->
									<div class="createGroupDiv">
										<ul class="friendUl selectedUl">
											<c:forEach items="${relationshipList }" var="relate">
												<li class="friendLi unselectedfriend" relationshipid="${relate.relationshipId }" userid="${relate.friendUser.userId }">
													<div class="friendInfo" align="left">
														<img class="friendHead" src="imgs/user_head/${relate.friendUser.headImg }">
														<span class="friendCenterInfo" relationshipid="${relate.relationshipId }" > 
															${(empty relate.remark)?relate.friendUser.nickname:relate.remark} 
														</span>
														<i
															class="iconfont icon-shanchu" userid="${relate.friendUser.userId }"></i>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="custombtn">立即创建</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加好友Modal  -->
	<div class="modal fade" id="addFriendModal" tabindex="-1" role="dialog"
		aria-labelledby="addFriendModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addFriendModalLabel">添加好友</h4>
				</div>
				<div class="modal-body searchFriendBody" align="center">
					<div align="left" class="inputSearchKeyTip">输入百度帐号添加好友：</div>
					<div class="input-group addFirendInputGroup">
						<input type="text" class="form-control searchFriendInput" placeholder="输入百度账号">
						<span class="input-group-btn">
							<button class="btn btn-default searchFriend" type="button">查找</button>
						</span>
					</div>
					<!-- /input-group -->
					<div class="copyPersonLinkBox">
						<input type="hidden" value="这是需要复制的文本" id="personalLink" /> <span
							class="copyTit">个人链接：复制你的个人链接发给朋友，点击后可以直接发送文件和消息</span> <input
							type="text" id="readyCopy" value="这是需要复制的内容" />
						<button class="custombtn" id="copyPersonalLinkBtn"
							data-clipboard-target="#readyCopy">复制个人连接</button>
					</div>
					<div class="searchResult">
						<div align="left">搜索结果：</div>
						<div class="searchResultContent" align="left">
							<div class="noResult">没有找到你搜索的用户，检查下输入的帐号吧</div>
							<div class="haveResult">
								<img alt="" class="resultHead" src="imgs/user_head/default.jpg">
								百度账号：<span class="resultNickname"></span>
								<hr class="resultHr" />
								<div align="center">
									<button type="button" class="btn btn-default launchSession" userid="">发起会话</button>
									<button type="button" class="custombtn addFriendBtnInModel" userid="">添加好友</button>
								</div>
							</div>
							
						</div>
					</div>
					<img alt="" src="imgs/loading.gif" class="loading">
				</div>
			</div>
		</div>
	</div>
	<!-- 添加备注的Modal -->
	<div class="modal fade" id="addRemarkModal" tabindex="-1" role="dialog"
		aria-labelledby="addRemarkModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addRemarkModalLabel">设置备注</h4>
				</div>
				<div class="modal-body">
					<div class="remarkTextTip">为好友设置备注(0-10个字符)</div>
					<input type="text" class="form-control remarkInput"
						placeholder="输入备注名" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="custombtn saveRemarkBtn" relationshipid="">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="tips"></div>

	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>


	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>

	<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

	<script src="js/jquery.mCustomScrollbar.js"></script>
	<script src="emoji_picker/js/config.js"></script>
	<script src="emoji_picker/js/util.js"></script>
	<script src="emoji_picker/js/jquery.emojiarea.js"></script>
	<script src="emoji_picker/js/emoji-picker.js"></script>
	<script src="js/icheck.js"></script>
	<script type="text/javascript" src="js/clipboard.min.js"></script>

	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>
	<script src="js/share.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.createGroupCheckbox').iCheck({
				checkboxClass : 'icheckbox_square-orange',
				radioClass : 'iradio_square-red',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>