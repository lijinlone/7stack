<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/pages/include/home-resource.jsp" %>
<title>注册</title>
<script type="text/javascript">
$(function(){
	var eReg = /[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}/;
	var uReg = /^[a-zA-Z0-9_-]{3,16}$/;
	var flag = false;
	$("#sign-form").submit(function(){
		flag = true;
		$(this).find(":text,:password").each(function(){
			var id = this.id;
			if(id == "user-name"){
				if($.trim(this.value) == ""){
					error(this,"请输入用户名");
				}else if(this.value.length < 3){
					error(this,"用户名长度不得少于3位");
				}else if(!uReg.test(this.value)){
					error(this,"只能包含数字字母下(中)划线");
				}
			}else if(id == "email"){
				if($.trim(this.value) == ""){
					error(this,"请输入邮箱");
				}else if(!eReg.test(this.value)){
					error(this,"邮箱格式有误");
				}
			}else if(id == "password"){
				if(this.value == ""){
					error(this,"请输入密码");
				}else if(this.value.length < 6){
					error(this,"密码长度不得少于六位");
				}
			}else if(id == "password-repeat"){
				if(this.value == ""){
					error(this,"请输入确认密码");
				}else if(this.value != $("#password").val()){
					error(this,"两次密码不一致");
				}
			}
			
		}).bind("focus",function(){
			$(this).closest(".control-group").removeClass("error");
			$(this).next().html("");
		});
		//ajax 验证
		if(flag){
			ajaxCheck(this);
			flag = false;
		}
		return flag;
	});
	
	function ajaxCheck(obj){
		// obj == null 失去焦点验证 暂时不启用
		if(obj && $.trim($("#user-name").val()) == "" && $.trim($("#user-name").val()) == ""){
			return;
		}
        $.post("<s:url action='ajax-check-user'/>",
                {"user.userName":$("#user-name").val(),
                 "user.email":$("#email").val()
            },
        function(json){
            if(json.userName || json.email){
            	if(json.userName){
            		error($("#user-name").get(0),json.userName);
            	}else{
            		clearError("#user-name");
            	}
            	if(json.email){
            		error($("#email").get(0),json.email);
            	}else{
            		clearError("#email");
            	}
            }else{
            	clearError("#user-name,#email");
            	if(obj){
            		obj.submit();
            	}
            }
        });
	}
	$("#user-name,#email").bind("blur",function(){
		this.value = $.trim(this.value);
        //ajaxCheck();
    });
	function error(obj,msg){
		$(obj).next().html(msg);
		$(obj).closest(".control-group").addClass("error");
		flag = false;
	}
	function clearError(param){
		$(param).closest(".control-group").removeClass("error");
		$(param).next().html("");
	}
})


</script>
<style type="text/css">
.sign-box{
  width: 50%;
  margin: 50px auto 30px;
  background-color: #F9F9F9;
  border-radius: 3px;
  box-shadow: 0 1px 3px rgba(34, 25, 25, 0.5);
  -moz-box-shadow: 0 1px 3px rgba(34,25,25,0.5);
  -webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.5);
  padding: 45px 35px 45px;
  
}
.login-form {
  padding-right: 39px;
  border-right: 1px solid gainsboro;
}
.other-login{
  padding-left: 39px;
}
.other-login h4{
  border-bottom: 1px solid gainsboro;
}
.btn-signup{
  display: inline-block !important;
  padding-left: 36px;
  position: relative;
  text-align: center;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  width: 131px;
  font-size: 12px;
  font-weight: bold;
  height: 23px;
  line-height: 23px;
  border-radius:3px;
  display: inline-block;
}
.btn-fb-signup{
  background: linear-gradient(#6478B1, #4760A0) repeat scroll 0 0 transparent;
  border-color: #2F426F;
}
#footer{
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    min-width: 833px;
}
</style>
</head>
<body>
  	<div class="navbar navbar-inverse navbar-header">
	  <div class="navbar-inner">
	    <div class="container">
	      <a class="brand btn btn-link" href="<s:url value='/'/>">7STACK</a>
	      <ul class="nav pull-right">
	        <li>
	          <a href="<s:url value='/account/sign-in'/>" class="btn btn-link color-white">登录</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</div>
  <div class="container">
    <div class="sign-box c-fix" id="ctx-sign-up">
    	<s:form action="sign-up" cssClass="form-horizontal" name="signUp" namespace="/account" id="sign-form" theme="simple">
    		<legend>新用户注册</legend>
    		<div class="control-group ">
				<label class="control-label" for="user-name">用户名</label>
				<div class="controls">
					<input type="text"id="user-name" class="span2.5" name="user.userName" maxlength="30">
					<span class="text-error help-inline"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">邮箱</label>
				<div class="controls">
					<input type="text" id="email" class="span2.5" name="user.email">
					<span class="help-inline"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">密码</label>
				<div class="controls">
					<input type="password" id="password" class="span2.5" name="user.password" maxlength="30">
					<span class="help-inline"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password-repeat">确认密码</label>
				<div class="controls">
					<input type="password" id="password-repeat" class="span2.5" name="passwordRepeat" maxlength="30">
					<span class="help-inline"></span>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="submit" class="btn btn-primary" value="注册">
					<!--input type="reset" class="btn" value="重置"-->
				</div>
			</div>
		
    	</s:form>
    </div>
  </div>
  <%-- jsp:include page="/WEB-INF/pages/include/home-foot.jsp" / --%>
</body>
</html>