<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">

    <%-- 引用 .js  .css  预先加载--%>
    <script src="js/jquery-2.1.0.js"></script>
    <script>
        $(function(){
            //页面提交表单 提交内容  post  get
            /*预加载*/
            //alert(111);//弹窗
            //id选择器  document.getElementById("inputid").value
            //alert($("#inputid").val())  ID选择器
            //alert($(".inputclass").val());  class选择器
            //点击事件
            $("#buttonid").click(function () {
                //alert($("#inputid").val())   servlet
                //url  请求路径  type 提交方式  dataType 返回的数据类型  data 发送到服务器的数据  success 回调函数   json
                //功能  文本框  输入查询的条件  点击按钮  返回条件查询的数据   JSONArray
                $.ajax({
                    url:"servlet/AjaxServlet",//请求路径
                    type:"post",//提交方式
                    dataType:"html",//返回的数据类型
                    data:{'username':$("#inputid").val()},//date 发送到服务器的数据
                    success:function (data)     //如果成功的回调函数
                    {

                        $("table").remove();//移除当前节点
                        var v = eval(data);//字符串转数组
                        //字符串拼接
                        //获取DOM节点    append()拼接  在DOM节点后增加内容
                        // <table> <tr> <td></td> </tr>   </table>   "+value +"
                        $("#divid").append("<table border='1' width='30%'>");
                        $("table").append("<tr>" +
                            "<td><input type='checkbox' id='checkboxall'/>全选</td>" +
                            "<td>序号</td>"+
                            "<td>用户名</td>"+
                            "<td>密码</td>"+
                            " </tr>");
                        //循环数据
                        $.each(v,function (index) {//index 循环下标  v数据源
                            $("table").append("<tr>" +
                                "<td><input type='checkbox'/></td>" +
                                "<td>"+v[index].id+"</td>"+
                                "<td>"+v[index].username+"</td>"+
                                "<td>"+v[index].password+"</td>"+
                                " </tr>");
                        })
                        $("#divid").append("</table>");
                    }
                })

            })

        })
    </script>

</head>


<body>
        静态内容
        <input type="text"  id="inputid" />
        <input type="button" value="ajax" id="buttonid"/>
        <div id="divid"></div>

        <div id="live2d-widget">
            <%--    <canvas id="live2dcanvas" width="400" height="800" style="position: fixed;opacity: 0.7;right: 0px;bottom: -20px;z-index: 99999;pointer-events: none;border: 1px dashed rgb(204, 204, 204);">--%>
            <%--    </canvas>--%>
        </div>

</body>
</html>
