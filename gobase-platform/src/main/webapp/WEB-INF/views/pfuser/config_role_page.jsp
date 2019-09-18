<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/tag_header.inc" %>
<!DOCTYPE html>
<html>
<head>
  <title>用户管理</title>
	<%@include file="/static/head.inc" %>
</head>
<body> 
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>分配角色</legend>
	</fieldset>
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">账号：${user.name}</div>
                    <div class="layui-card-body">
                        	姓名：${user.nickName}
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="roleTable">
  搜索：
  <div class="layui-inline">
    <input class="layui-input" name="search" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
  <a  class="layui-btn layui-btn-normal" data-type="saveRoles">保存选中角色</a>
</div>
 
<table class="layui-hide" id="LAY_table_role" lay-filter="role"></table> 

<!-- <script type="text/html" id="barDemo"> -->
<!--   <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">分配权限</a> -->
<!--   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a> -->
<!-- </script>                -->
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  table =  layui.$.extend(table, {config: {checkName: 'checked'}});
  //方法级渲染
  table.render({
    elem: '#LAY_table_role'
    ,url: '/role/configRoleList?uid=${user.uid}'
    ,cols: [[
//       {checkbox: true, fixed: false}
		{type:'checkbox', fixed: true}
      ,{field:'id', title: 'ID', sort: true, fixed: true}
      ,{field:'roleCode', title: '角色编码' }
      ,{field:'roleName', title: '角色名称',  sort: true}
      ,{field:'createTime', title: '添加时间',  sort: true}
//       ,{fixed: false,title: '操作', toolbar: '#barDemo'}
    ]]
    ,id: 'roleTable'
//     ,page: false
    ,limit: 1000
    ,response: {
        statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
     }
    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
         return {
             "code": res.result, //解析接口状态
             "msg": res.msg, //解析提示文本
             "data": res.data //解析数据列表
           };
     }
    
  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('roleTable', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          search:demoReload.val()
        }
      }, 'data');
    },
    saveRoles: function(){
    	var checkStatus = table.checkStatus('roleTable')
        ,data = checkStatus.data;
        var roleArry = [],roleCodes = '';
        if(data.length>=0){
	        for (var i = 0; i < data.length; i++) {
	        	roleArry.push(data[i].roleCode);
			}
	        roleCodes = roleArry.join(";");
        }
        $.ajax({
			  url: "/pfuser/saveUserRoles", 
			  type:"post",
//			  contentType: "application/json; charset=utf-8",
			  dataType:"json",
//			  data: JSON.stringify(), 
			  data: {uid:'${user.uid}',roleCodes:roleCodes}, 
			  success: function(response){
						  layer.alert(response.msg, {
						      title: '提交结果'
						  })
		  				}
		  });
        
    }
  };
  
  $('.roleTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
});
</script>

</body>
</html>