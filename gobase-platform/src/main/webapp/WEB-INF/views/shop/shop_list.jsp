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
	  <legend>用户列表</legend>
	</fieldset>
<div class="userTable">
  搜索：
  <div class="layui-inline">
    <input class="layui-input" name="search" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
  <a  class="layui-btn" href="/pfuser/addPage">添加</a>
</div>
 
<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table> 

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">分配角色</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>               
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
    ,url: '/pfuser/list'
    ,cols: [[
      {checkbox: false, fixed: false}
      ,{field:'id', title: 'ID', sort: true, fixed: true}
      ,{field:'name', title: '账户' }
      ,{field:'nickName', title: '姓名', edit: 'text', sort: true}
      ,{field:'registerTime', title: '注册时间',  sort: true}
      ,{fixed: false,title: '操作', toolbar: '#barDemo'}
    ]]
    ,id: 'testReload'
    ,page: true
    ,response: {
        statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
     }
    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
         return {
             "code": res.result, //解析接口状态
             "msg": res.msg, //解析提示文本
             "count": res.data.totalNum, //解析数据长度
             "data": res.data.content //解析数据列表
           };
     }
    ,height: 310
  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          search:demoReload.val()
        }
      }, 'data');
    }
  };
  
  $('.userTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
//监听单元格编辑
  table.on('edit(user)', function(obj){
    var value = obj.value //得到修改后的值
    ,data = obj.data //得到所在行所有键值
    ,field = obj.field; //得到字段
    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
  });
});
</script>

</body>
</html>