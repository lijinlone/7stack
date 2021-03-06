$(function(){
  $(".btn-login").bind("click",function(){
    return genLoginBox();
  });
  
  /*$("#user-control-link,.menu-account").mouseover(function(){
    $(this).parent().addClass("open");
  }).mouseout(function(){
    $(this).parent().removeClass("open");
  })*/
  $(".menu-account").parent().mouseout(function(){
	    $(this).parent().removeClass("open");
	  });
  $("#user-control-link").click(function(){
	  $(this).parent().toggleClass("open");
  });
  
  // 图片宽边
  broadside();
  fitSearch();
  $(window).resize(function(){
	  broadside();
	  fitSearch();
  });
});

function isEmail(email) {
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(email)) {
		return true;
	}
	return false;
}



/** 登录遮罩 * */
function genLoginBox(){
  var panel = $("<div>");
  var dialog = panel.clone().addClass("login-dialog");
  var content = panel.clone().addClass("login-content");
  var form = $("<form>").attr({action:$(this).attr("href")});
  var legend = $("<legend>Login 7stack</legend>");
  var controls = panel.clone().addClass("controls");
  var text = $("<input type='text'>").addClass("span4").attr({placeholder:"Username"});
  var password = $("<input type='password'>").addClass("span4").attr({placeholder:"Password"});
  var checkbox = $("<input type='checkbox'>");
  var submit = $("<input type='submit'>").addClass("btn btn-primary btn-samll").val("登录");
  var left = panel.clone().css({float:"left"});
  var right = panel.clone().css({float:"right"});
  var forgot = $("<li>").addClass("icon-question-sign");
  var close = $("<span>").addClass("close-btn");
  dialog.append(content);
  content.append(form);
  content.append(close);
  form.append(legend);
  form.append(controls.clone().append(text));
  form.append(controls.clone().append(password));
  form.append(controls.clone().append(left).append(right));
  left.append($("<label>").addClass("checkbox").append(checkbox).append("记住我"));
  right.append($("<a href='#'>").addClass("btn btn-link padding-zero").append(forgot).append("忘记密码"));
  form.append(controls.clone().css({clear:"both"}).append(submit));
  $("body").append("<div class='veil-div'>");
  $("body").append(dialog);
  var dw = dialog.width();
  var dh = dialog.height();
  dialog.css({"margin-left":-1*dw/2,"margin-top":-1*dh/2});
  close.bind("click",function(){
    $(".veil-div").remove();
    $(this).parents(".login-dialog").remove();
  });
  return false;
}
function broadside(){
	if($(".doc").size()){
		$(".doc .broad-side").width($(".doc:first").width()+61);
		$(".doc .broad-side").css({"max-width": "none","margin-left": "-30px"});
	}
}
function fitSearch(){
	var h = $(".search-box").width()-($(".search-box .btn").width()+36);
	$(".search-box :text").width(h);
}
