<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/tag_header.inc" %>
<!DOCTYPE html>
<html>
<head>
  <title>商品管理</title>
	<%@include file="/static/head.inc" %>
</head>
<body> 
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>商品列表</legend>
	</fieldset>
<div class="goodsTable">
  商品id：
  <div class="layui-inline">
    <input class="layui-input" name="goodsId" id="goodsId" autocomplete="off">
  </div>
  商品名称：
  <div class="layui-inline">
    <input class="layui-input" name="search" id="search" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 
<table class="layui-hide" id="LAY_table_goods" lay-filter="goods"></table> 

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" href="/goods/detail?goodsId={{d.goodsId}}">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
<%--  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下架</a>--%>
</script>               
          
<script src="${ctx }/static/ui/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use('table', function(){
            var table = layui.table;

            //方法级渲染
            table.render({
                elem: '#LAY_table_goods'
                ,url: '/goods/list'
                ,cols: [[
                    {checkbox: false, fixed: false}
                    ,{field:'goodsId', title: '商品id', sort: true, fixed: true}
                    ,{field:'tinyName', title: '商品名称' }
                    ,{field:'realPrice', title: '价格', sort: true}
                    ,{field:'totalNum', title: '库存', sort: true}
                    ,{field:'auditStatus', title: '审核状态', sort: true,
                        templet: function(d){
                            if(d.auditStatus == 0){
                                return '审核中';
                            } else if (d.auditStatus == 1) {
                                return '审核通过';
                            } else if (d.auditStatus == -1) {
                                return '审核拒绝';
                            } else { return '--';}
                        }
                    }
                    ,{field:'createTime', title: '创建时间',  sort: true}
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

            });

            var $ = layui.$, active = {
                reload: function(){

                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            search:$('#search').val(),
                            goodsId:$('#goodsId').val()
                        }
                    }, 'data');
                }
            };

            $('.goodsTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

        });
    </script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

</body>
</html>