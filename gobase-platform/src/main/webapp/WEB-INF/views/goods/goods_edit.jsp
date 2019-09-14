<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/tag_header.inc" %>
<!DOCTYPE html>
<html>
<head>
  <title>添加用户</title>
	<%@include file="/static/head.inc" %>
</head>
<style>
 .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
</style>
<body> 
<div>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>商品发布</legend>
	</fieldset>
	<form class="layui-form" action="">
<!-- 	<form  action=""> -->
		<input type="hidden" id="goodsId" name="goodsId" lay-verify="goodsId" autocomplete="off" value="${goods.goodsId }" >
		<div class="layui-form-item">
		    <label class="layui-form-label ">商品分类</label>
		    <div class="layui-input-inline">
		      <select name="category1" lay-filter="category1"  >
		        <option value="">请选择一级分类</option>
			      	<c:if test="${not empty categoryList1}">
			      		<c:forEach var="c1" items="${categoryList1}" varStatus="status">
					        <option value="${c1.code }" <c:if test='${goods.category1 == c1.code }'>selected="selected"</c:if>>${c1.name }</option>
			      		</c:forEach>
			      	</c:if>
		      </select>
		    </div>
		    <div class="layui-input-inline">
		      <select id="category2" name="category2" lay-filter="category2">
		        <option value="">请选择二级级分类</option>
		        <c:if test="${not empty categoryList2}">
		      		<c:forEach var="c2" items="${categoryList2}" varStatus="status">
				        <option value="${c2.code }" <c:if test='${goods.category2 == c2.code }'>selected="selected"</c:if>>${c2.name }</option>
		      		</c:forEach>
		      	</c:if>
		      </select>
		    </div>
		    <div class="layui-input-inline">
		      <select id="category3" name="category3" lay-filter="category3">
		        <option value="">请选择三级分类</option>
		        <c:if test="${not empty categoryList3}">
		      		<c:forEach var="c3" items="${categoryList3}" varStatus="status">
				        <option value="${c3.code }" <c:if test='${goods.category3 == c3.code }'>selected="selected"</c:if>>${c3.name }</option>
		      		</c:forEach>
		      	</c:if>
		      </select>
		    </div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品全名称</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="fullName" lay-verify="fullName" autocomplete="off" placeholder="商品长名称" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品简称</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="tinyName" lay-verify="tinyName" autocomplete="off" placeholder="商品短名称" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品原价</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="oriPrice" lay-verify="oriPrice" autocomplete="off" placeholder="" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">实际价格</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="realPrice" lay-verify="realPrice" autocomplete="off" placeholder="" class="layui-input">
	    	</div>
	  	</div>
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">商品描述</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
		    </div>
		</div>
	  	
	  	<div class="layui-upload">
		  <button type="button" class="layui-btn" id="goodsImgBtn">上传图片</button> 
		  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
		    预览图：
		    <div class="layui-upload-list" id="goodsImgList"></div>
		 </blockquote>
		</div>
	  	<center>
		  	<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-filter="goodsForm" lay-submit="">提交</button>
			    </div>
			</div>
	  	</center>
		
			  	
	</form>
</div>
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

layui.use(['form', 'layedit', 'laydate','jquery','upload'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  ,upload = layui.upload
	  ,$ = layui.$;
	  
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
// 	  form.verify({
// 	    name: function(value){
// 	      if(value.length < 1){
// 	        return '名字不可为空';
// 	      }
// 	    }
// 	    ,account: [
// 	      /^[\S]{1,12}$/
// 	      ,'用户名必须1到12位，且不能出现空格'
// 	    ]
// 	    ,content: function(value){
// 	      layedit.sync(editIndex);
// 	    }
// 	  });
	  
	  
	  //监听提交
	  form.on('submit(goodsForm)', function(data){
		  var jsonData = {},
		  formData = data.field;
// 		  alert(JSON.stringify(formData));
		  jsonData.goodsId = formData.goodsId;
		  jsonData.tinyName = formData.tinyName;
		  jsonData.fullName = formData.fullName;
		  jsonData.oriPrice = formData.oriPrice;
		  jsonData.realPrice = formData.realPrice;
		  var imgs = [];
		  
		  $("#goodsImgList img").each(function(i,o){
// 			  alert($(this).attr("dataUrl"));
			  imgs.push($(this).attr("dataUrl"));
	  	});
		 jsonData.imgs = imgs;
		  alert( JSON.stringify(jsonData));
// 		  return false;
		  $.ajax({
			  url: "/goods/save", 
			  type:"post",
			  dataType:"json",
			  data: {jsonData:JSON.stringify(jsonData)}, 
			  success: function(response){
				  			if(response.result == 200){
				  				$("#goodsId").val(response.data);
							  	layer.alert(response.msg, {
							    	title: '提交结果'
							 	});
				  			}else{
							  	layer.alert(response.msg, {
							    	title: '提交结果'
							  	});
				  			}
		  				}
		  });
		  return false;
	  });
	  //监听select
	  form.on('select(category1)', function(data){
// 		  alert(JSON.stringify(data.value));
		  $.ajax({
			  url: "/category/get", 
			  type:"get",
// 			  contentType: "application/json; charset=utf-8",
			  dataType:"json",
// 			  data: JSON.stringify(), 
			  data: {pCode:data.value}, 
			  success: function(response){
						  if(response.result==200){
							  	initSelect("category2","请选择二级分类");
				  				var select = document.getElementById("category2"); //server为select定义的id
			  		      		var list = response.data;
				  				for(var p in response.data){
				  		            var option = document.createElement("option");  // 创建添加option属性
				  		            option.setAttribute("value",list[p].code); // 给option的value添加值
				  		            option.innerText=list[p].name;     // 打印option对应的纯文本 
				  		          	select.appendChild(option);           //给select添加option子标签
				  				}		
				  		        form.render("select");            // 刷性select，显示出数据
				  			}
		  				}
		  });
		  return false;
	  });
	  //监听select
	  form.on('select(category2)', function(data){
		  $.ajax({
			  url: "/category/get", 
			  type:"get",
// 			  contentType: "application/json; charset=utf-8",
			  dataType:"json",
// 			  data: JSON.stringify(), 
			  data: {pCode:data.value}, 
			  success: function(response){
// 						  layer.alert(JSON.stringify(response), {
// 						      title: '提交结果'
// 						  })
						  if(response.result==200){
							  	initSelect("category3","请选择三级分类");
			  		      		var list = response.data;
			  		      		var select = document.getElementById("category3");
				  				for(var p in response.data){
				  		            var option = document.createElement("option");  // 创建添加option属性
				  		            option.setAttribute("value",list[p].code); // 给option的value添加值
				  		            option.innerText=list[p].name;     // 打印option对应的纯文本 
				  		          	select.appendChild(option);           //给select添加option子标签
				  				}	
				  				form.render("select");            // 刷性select，显示出数据
				  			}
		  				}
		  });
		  return false;
	  });
	  
	  function initSelect(category,title){
			$("#"+category).html("");
			var select = document.getElementById(category); //server为select定义的id
          var option = document.createElement("option");  // 创建添加option属性
          option.setAttribute("value",""); // 给option的value添加值
          option.innerText=title;     // 打印option对应的纯文本 
        	select.appendChild(option);           //给select添加option子标签
	  }
	  
	//多图片上传
	  upload.render({
	    elem: '#goodsImgBtn'
	    ,url: '/upload/img'
	    ,multiple: false
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
// 	    	  alert(index);
	        $('#goodsImgList').append('<img id="goodsImgList_'+index+'" index="'+index+'" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
	      });
	    }
	    ,done: function(response,index,upload){
// 	    	alert(upload);
	      if(response.result==200){
	    	  $("#goodsImgList_"+index).attr('dataUrl',response.data.url);
	      }
	    }
	  });
	  
	});
	  
</script>

</body>
</html>