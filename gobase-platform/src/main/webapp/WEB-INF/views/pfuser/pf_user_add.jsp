<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/tag_header.inc" %>
<!DOCTYPE html>
<html>
<head>
  <title>添加用户</title>
	<%@include file="/static/head.inc" %>
</head>
<body> 
 
<div>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>添加用户</legend>
	</fieldset>
	<form class="layui-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">账户</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="name" lay-verify="account" autocomplete="off" placeholder="账户" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="nickName" lay-verify="name" autocomplete="off" placeholder="姓名" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">店铺id</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="shopId" lay-verify="shopId" autocomplete="off" placeholder="店铺id" class="layui-input">
	    	</div>
	  	</div>
	  	
	  	<div class="layui-form-item">
		    <div class="layui-input-block">
<!-- 		      <button class="layui-btn layui-btn-normal" id="LAY-component-form-setval" type="button">赋值</button> -->
<!-- 		      <button class="layui-btn layui-btn-normal" id="LAY-component-form-getval" type="button">取值</button> -->
		      <button class="layui-btn" lay-filter="userForm" lay-submit="">提交</button>
		    </div>
		</div>
			  	
	</form>
</div>
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

layui.use(['form', 'layedit', 'laydate','jquery'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  ,$ = layui.$;
	  
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    name: function(value){
	      if(value.length < 1){
	        return '名字不可为空';
	      }
	    }
	    ,account: [
	      /^[\S]{1,12}$/
	      ,'用户名必须1到12位，且不能出现空格'
	    ]
	    ,content: function(value){
	      layedit.sync(editIndex);
	    }
	  });
	  
	  
	  //监听提交
	  form.on('submit(userForm)', function(data){
// 		  alert(JSON.stringify(data.field));
		  $.ajax({
			  url: "/pfuser/add", 
			  type:"post",
// 			  contentType: "application/json; charset=utf-8",
			  dataType:"json",
// 			  data: JSON.stringify(), 
			  data: data.field, 
			  success: function(response){
						  layer.alert(JSON.stringify(response), {
						      title: '提交结果'
						  })
		  				}
		  });
		  return false;
	  });
	  
	});
</script>

</body>
</html>