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
	<div class="layui-form" action="">
<!-- 	<form  action=""> -->
		<input type="hidden" id="goodsId" name="goodsId" lay-verify="goodsId" autocomplete="off" value="${goods.goodsId }" >
		<div class="layui-row">
			<div class="layui-col-xs6">商品名称：${goods.fullName}</div>
			<div class="layui-col-xs6">店铺名称：${goods.shopName}</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs6">实际价格：${goods.realPrice}</div>
			<div class="layui-col-xs6">原价：${goods.oriPrice}</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">商品描述：${goods.description}</div>
		</div>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
			<legend>商品图片</legend>
		</fieldset>

		<div class="layui-carousel" id="goodsImgs">
			<div carousel-item="">
				<div><img src="http://i1.zhiaigou.com/uploads/tu/201908/9999/8001f148bb.jpg"></div>
				<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568926939249&di=b4234692f667eb48c3543edcc40991be&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fd428e04bbc8069ae8cd41d9dd0986702e35c469e142cc-ZI4Dwq_fw658"></div>
				<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568926939245&di=3f1fd190b43658304df1aa34ee613617&imgtype=0&src=http%3A%2F%2Fpic11.nipic.com%2F20101211%2F6349502_101424000134_2.jpg"></div>
			</div>
		</div>
	  	<center>
		  	<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-filter="goodsForm" lay-submit="">提交</button>
			    </div>
			</div>
	  	</center>
		
			  	
	</div>
</div>
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

layui.use(['form', 'layedit', 'laydate','jquery','carousel'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  ,carousel = layui.carousel
	  ,$ = layui.$;
	  
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');

	//图片轮播
	carousel.render({
		elem: '#goodsImgs'
		// ,width: '778px'
		// ,height: '440px'
		,interval: 5000
	});
	  
	  
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