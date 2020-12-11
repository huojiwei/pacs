<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>${mname}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0"> 
<link rel="stylesheet" type="text/css" href="css/emrmodel.css" />
<link rel="stylesheet" type="text/css" href="css/dhtmlxcalendar.css"/>
<link rel="stylesheet" type="text/css" href="css/dhtmlxcalendar_dhx_skyblue.css"/>	
<link rel="stylesheet" type="text/css" href="dhtmlxGrid/codebase/dhtmlxgrid.css" />
<link rel="stylesheet" type="text/css" href="css/dhtmlxgrid_dhx_custom.css" />
<link rel="stylesheet" type="text/css" href="dhtmlxCombo/codebase/dhtmlxcombo.css" />
<script>window.dhx_globalImgPath = "dhtmlxCombo/codebase/imgs/";</script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/LodopFuncs.js"></script>
<script type="text/javascript" src="js/emr/jquery.ui.position.js"></script>
<script type="text/javascript" src="js/emr/jquery.contextMenu.js"></script>
<script type="text/javascript" src="dhtmlxCombo/codebase/dhtmlxcommon.js"></script>
<script type="text/javascript" src="dhtmlxCombo/codebase/dhtmlxcombo.js"></script>
<script type="text/javascript" src="js/dhtmlxgrid.js"></script>
<script type="text/javascript" src="js/dhtmlxgridcell.js"></script>
<script type="text/javascript" src="dhtmlxGrid/sources/ext/dhtmlxgrid_srnd.js"></script>
<script type="text/javascript" src="js/dhtmlxcalendar.js"></script>
<script type="text/javascript" src="js/emr/common.js"></script>
<script type="text/javascript" src="js/emr/utils.js"></script>
<script type="text/javascript" src="js/emr/jquery.cookie.js"></script>
<script type="text/javascript" src="js/emr/jquery.hoverIntent.min.js"></script>
<script type="text/javascript" src="js/emr/jqmath-etc-0.4.0.min.js"></script>
<style type="text/css">		
<c:choose> 
  <c:when test="${param.canEdit=='true'}"> 
.selectionArea{background-color:#FEFF66;}
.insShow{background-color:#BBFFAA;text-decoration:underline;}
.insHide{background-color:#F0FCD3;text-decoration:none;}
.delHide{display:none;}
INS{background-color: #BBFFAA;}
DEL{color: red;background-color: #FFC8C8;}
.xcombo{background-color:#FEFF66}
.xdivedit{background-color:#F0FCD3}
.xinput{background-color:#E3FDD0}
.xinputsuggest{background-color:#FEDF66}
.xtextarea{}
  </c:when> 
  <c:otherwise> 
INS{text-decoration:none;}
DEL{display:none;}
  </c:otherwise> 
</c:choose> 
.dszl_11a {width: 650px;padding-top:10px;border:1px solid #000;background-color: #fff;padding:50px;min-height:170px;}
.dszl_12a {width: 245px;text-align:right;background-color:#fff;position:fixed;border:1px solid #bac2cd;padding:2px;right:20px;top:2px;}
.btn_over2{background:url(img/emr/bt02.jpg) no-repeat; width:58px; height:24px; margin:0px 10px;text-align: center; border:none;line-height:24px; font-size:14px; font-family:Microsoft YaHei,Lucida Grande,Helvetica,Tahoma,Arial,sans-serif;cursor:pointer;}
.btn_over12{background:url(img/emr/bt02.jpg) no-repeat; width:130px; height:24px; margin:0px 10px;text-align: center; border:none;line-height:24px; font-size:14px; font-family:Microsoft YaHei,Lucida Grande,Helvetica,Tahoma,Arial,sans-serif;cursor:pointer;}
#editdiv{background-color:#FFFFFF;border:1px solid #000;margin-top:10px;display:none;height:500px;width: 750px;margin-left:59px;}
#readdiv{overflow:auto;}
#formtime{clear: both;float:left;height:25px;margin-top:2px;}
#formcontent{clear: both;overflow-y:auto;overflow-x:hidden;height:407px;border:1px solid #abcdd9;margin-top:2px;padding:5px 0px 5px 58px;}
.hdc_jc3{height:275px; background-color:#fff;  padding:7px;line-height:22px;}
.hdc_jc4{background-color:#fff;  padding:7px;line-height:22px;}
.datetime1{width:150px; height:18px;vertical-align:middle;line-height:18px;border:1px solid red;background:#ffffff url("img/datePicker.gif") 135px 0px no-repeat;}
div.gridbox_dhx_custom table.hdr td {
	font-family: 微软雅黑;
	font-size: 12px;
	font-weight: bold;
	vertical-align: top;
}

div.gridbox_dhx_custom table.obj.row20px tr.rowselected td {
	background-repeat: repeat-x;
	background-position: 0px 0px;
	background-image: url(imgs/grid_rowselected.png);
	background-color: #ffe3a8;
}
.scrollbardiv{	
	scrollbar-face-color: #E3EBF8;
	scrollbar-shadow-color: #c6d8f0;
	scrollbar-highlight-color: #FFFFFF;
	scrollbar-3dlight-color: #E3EBF8;
	scrollbar-darkshadow-color:#d8e4f3;
	scrollbar-track-color: #F6FBFD;
	scrollbar-arrow-color: #9bb8de;
}
.infoborder{background-color:#f0e68c;}
.horizontalborder{border:1px solid red;}
.printdiv{
cursor:default;
text-align:left;
font-size:12px;
color:#000;
font-family:"微软雅黑";
font-weight:bold;
}
.span02{cursor:pointer;font-weight:bold;}
div.container{
cursor:default;
display: none;
text-align:left;
font-size:12px;
color:#000;
font-family:"微软雅黑";
font-weight:bold;
z-index:13;
padding:2;
border: 1px solid rgb(221, 221, 170);
position:relative;
top:8px;
height:240px;
width:300px;
background-color:transparent;
*border:1px solid #666;
}
s{
position:absolute;
top:-20px;
*top:-22px;
display:block;
height:0;
width:0;
font-size: 0;
line-height: 0;
border-color:transparent transparent #666 transparent;
border-style:dashed dashed solid dashed;
border-width:10px;
}
i{position:absolute;
top:-9px;
*top:-9px;
left:-10px;
display:block;
height:0;
width:0;
font-size: 0;
line-height: 0;
border-color:transparent transparent #fff transparent;
border-style:dashed dashed solid dashed;
border-width:10px;
}
.content{
display: none;
border:1px solid #666;
-moz-border-radius:3px;
-webkit-border-radius:3px;
position:absolute;
background-color:#fff;
width:100%;
height:100%;
*top:-2px;
*border-top:1px solid #666;
*border-top:1px solid #666;
*border-left:none;
*border-right:none;
*height:242px;
box-shadow: 3px 3px 4px #999;
-moz-box-shadow: 3px 3px 4px #999;
-webkit-box-shadow: 3px 3px 4px #999;
/* For IE 5.5 - 7 */
filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#999999');
/* For IE 8 */
-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#999999')";
}

#coursegrid.hovering div {display: block;}
</style>		
	</head>
	<body>	
<div class="TopBottomMenu"></div>
<button class="btn_over12" id="openEdit2" onclick="javascript:doPackageMake_bc()">生成模板套餐</button>
<button class="btn_over12"  id="fullPrint2" onclick="javascript:doPackageSelect_bc()">模板套餐调用</button>
<c:if test="${param.canEdit=='true'}"> 	
<div class="dszl_12a"><div><button class="btn_over2" id="openEdit" onclick="javascript:openEdit()">新 增</button><button class="btn_over2"  id="fullPrint" onclick="javascript:doFullPrint()">全 打</button><button class="btn_over2"  <c:if test="${hasprint==false}">disabled="disabled"</c:if>	 id="continuePrint" onclick="javascript:doContinuePrint()">续 打</button></div><div class="printdiv"><input type="text" style="width:1px;height:1px;border:none;margin:0;padding:0;" tabIndex="-1" id="cursorbug"/>打印：<input type="checkbox" checked="checked" id="isShowPagerNum" onclick="javascript:changeNumLabel('pagerNumLabel','numLabel')"/><label for="isShowPagerNum">显示页码</label><label id="pagerNumLabel">(<input type="checkbox" checked="checked" id="isShowPagerNo" onclick="javascript:changeNumLabel('pagerStartNumLabel','startNumLabel')"/><label for="isShowPagerNo">页号</label><label id="pagerStartNumLabel">：起始页号<input type="text" id="pagerStartNum" style="width:20px;height:12px;font-size:11px;line-height:12px;border:1px solid #93AFBA;" value="1"/></label>)</label></div></div>
</c:if>
<c:if test="${param.canEdit!=true && emrroles.emrgl==true}">
<div class="dszl_12a"><div><button class="btn_over2"  id="fullPrint" onclick="javascript:doFullPrint()">全 打</button></div><div class="printdiv"><input type="text" style="width:1px;height:1px;border:none;margin:0;padding:0;" tabIndex="-1" id="cursorbug"/>打印：<input type="checkbox" checked="checked" id="isShowPagerNum" onclick="javascript:changeNumLabel('pagerNumLabel','numLabel')"/><label for="isShowPagerNum">显示页码</label><label id="pagerNumLabel">(<input type="checkbox" checked="checked" id="isShowPagerNo" onclick="javascript:changeNumLabel('pagerStartNumLabel','startNumLabel')"/><label for="isShowPagerNo">页号</label><label id="pagerStartNumLabel">：起始页号<input type="text" id="pagerStartNum" style="width:20px;height:12px;font-size:11px;line-height:12px;border:1px solid #93AFBA;" value="1"/></label>)</label></div></div>
</c:if>
	<div class="dszl_10" id="readdiv" class="scrollbardiv">
	<div class="dszl_11a"><div id="headerhtml">
	<div class="box2">${BZZYJGMC}</div>
    <div class="box11">${mname}</div>
	<div class="border1">
	  <table width="650" border="0" cellspacing="0" cellpadding="0"  style="font-size:18px;">
	    <tr align="center">
	      <td>姓名：${patinfo.patname}</td>
	      <td>${mname}区：${patinfo.cwardname}</td>
	      <td>床号：${patinfo.cbedno}</td>
	      <td>住院号：${patinfo.inpno}</td>
        </tr>
      </table>
  </div></div>
  <div id="modelContent">${modelContent}</div>
	</div>
	</div> 	
		<div id="editdiv">
  			<table width="100%"  border="0" cellspacing="0" cellpadding="3">
              <tr>
				<td>
	                <div class="hdc_jc3"><div id="mtypediv" style="width: 250px;float:left;"></div><div style="float:left;height:24px;">&nbsp;&nbsp;<button class="btn_over2" id="saveCourse" onclick="javascript:doSave()" >保 存</button>&nbsp;<button class="btn_over2" id="deleteCourse" onclick="javascript:doDelete()" >删 除</button>&nbsp;<button class="btn_over2" id="clearEdit" onclick="javascript:if(confirmDirty()){$('#lastObjId').val('');clearEdit();}">清 空</button>&nbsp;<button class="btn_over2" onclick="javascript:closeEdit()">关 闭</button>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span02"  id="coursegrid">${mname}程记录▼
	          		<div class="container"  style="left:180px;">
						<div class="content">
							<div class="hdc_jc4" id="griddiv">
							<div id="gridbox" style="width:100%;height:425px;"></div>
						</div>
					</div>
					<s style="left:255px;">
					<i></i>
					</s>
					</div></span></div>
					<form id="courseContentForm" style="margin:0px;"><div id="formtime">时间：<input name="m_ttime" id="m_ttime" type="text" class="datetime1" value="<fmt:formatDate value="${nowtime}" pattern="yyyy-MM-dd HH:mm"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="m_isnewpage" name="m_isnewpage" value="Y"/><label for="m_isnewpage">另起一页 </label></div>
						<div id="error" style="margin-left:10px; font-family: 宋体; height: 24px; line-height: 24px; font-size: 13px; font-weight: bold;color:red;float: left;"></div>
						<div  id="formcontent" class="scrollbardiv"></div>
						<input type="hidden" name="m_modelid" id="m_modelid"/>
						<input type="hidden" name="m_infoid" id="m_infoid"/>
						<input type="hidden" name="m_emrid" id="m_emrid" value="${param.emrid}"/>
						<input type="hidden" id="canEdit" value="${param.canEdit}"/>
						<input type="hidden" id="lastObjId"/>
					</form></div>
				</td>
              </tr>
            </table>		
		</div>	
		
<div id="tipGuide"></div>		
<div class="edui-popup  edui-bubble  edui-anchor-topleft" style="display:none;" id="popupdiv"> 
  <div class="edui-popup-body"  style="width: 270px; height: 30px;"> 
  <div class="edui-shadow"></div> 
  <div class="edui-popup-content">
  属性: 
  <span class="edui-clickable"  cssname="alignnone">默认</span>&nbsp;
  <span class="edui-clickable"  cssname="alignleft">左对齐</span>&nbsp;
  <span class="edui-clickable"  cssname="alignright">右对齐</span>&nbsp;
  <span class="edui-clickable"  cssname="aligncenter">居中</span>&nbsp;
  <span class="edui-clickable" cssname="">删除</span>
  </div> 
  </div></div>
<div class="edui-popup  edui-bubble  edui-anchor-topleft" style="display:none;" id="popupdiv2"> 
  <div class="edui-popup-body"  style="width: 35px; height: 30px;"> 
  <div class="edui-shadow"></div> 
  <div class="edui-popup-content">
  <span class="edui-clickable">删除</span>
  </div> 
  </div></div>  	
  
  
<div style="display:none;" id="hiddendiv">   
	<div style="width:350px;height:155px;background-color:#d9eaee;padding:8px;box-sizing:content-box;"  id="packageMackeDiv_bc">
		<div style="height:20px;padding-bottom:5px;font-size:13px; color:#6ba3b6; font-family:微软雅黑; font-weight:bold;text-align:left">
		   <span style="float:left;">生成模版套餐</span>
		         <span style="float:right;"><img id="close_iframe_img_p" src="img/close.gif" align="absmiddle" style="cursor: pointer;"/></span>
		       	</div><div style="background-color:#fff;padding:10px;border:1px solid #b6cfd6">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td width="10" valign="top"><img src="img/new_yuan1.jpg" /></td>
							<td width="*" style="background-image: url(img/new_yuan2.jpg); text-align: left;" valign="top">
							</td>
							<td width="10" valign="top"><img src="img/new_yuan3.jpg" /></td>
						</tr>
						<tr>
							<td style="background-image: url(img/new_yuan4.jpg)">&nbsp;</td>
							<td>
						<table width="96%"  border="0" cellspacing="0" cellpadding="2">
					               <tr>
					                 <td   height="20" align="left">病程套餐名称：</td>
					                 <td align="left">
					                     <input type="text" id="packageName_bc"  style="width:200px; height:18px;border:1px solid #93AFBA;line-height:18px;" /> 
					                     <input type="hidden" id="mrids"/><input type="hidden" id="modelnames"/>
					                 </td>
					               </tr> 
					             </table>
							</td>
							<td background="img/new_yuan5.jpg">&nbsp;</td>
						</tr>
						<tr>
							<td><img src="img/new_yuan60.jpg" /></td>
							<td background="img/new_yuan70.jpg"></td>
							<td><img src="img/new_yuan80.jpg" /></td>
						</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:3px;">	
					<tr>
				       <td height="20" align="right" width="50%">
				       <span id="ctError_p" style="font-family:宋体;height:18px;line-height:18px;font-size:12px;font-weight:bold;color:red;"></span> 
				       <input id='confirmButton_pp' class='btn01' type='button' value='保 存'/>&nbsp;</td>
				       <td align="left" width="50%">&nbsp;<input id='abolishButton_pp' class='btn01' type='button' value='取 消'/></td>
				   </tr> 
				</table>
		</div>
	</div>
</div>
	
<script type="text/javascript">
var gridbox;
var mtype_combo;
var myCalendar;
var stack,lastDoId = inputTime =-1,isBlur=true;
var w,x,$selectionParent,intable ,intd ,intr,$trigger;
var option1,option2;
var needRecordTrace = false;//暂时这样吧
function getMtypes()
{
	var combo=mtype_combo;
	$.ajax({
		url:"emr/getMtypes.htm",
		type:"get",
		async : false,
		cache: false,
		error:function() {
			showIdError("获取${mname}程类型失败");
		},
		success:function(reply) {
			if(reply=="fail") {
				showIdError("获取${mname}程类型失败");
			}else{
				var jsons=$.parseJSON(reply);
				for(var i=0;i<jsons.length;i++){
					combo.addOption(jsons[i].id+"|"+jsons[i].linkadd,jsons[i].mname);
				}
			}
		}
	});
}

function getFormcontent(modelid,link,infoid)
{
	$("#m_modelid").val(modelid);
	$("#m_infoid").val(infoid);
	$.ajax({
		url:"emr/getFormcontent.htm?link="+link+"&infoid="+infoid+"&inpno=${patinfo.inpno}&patientid=${patientid}",
		type:"get",
		cache: false,
		async : false,
		error:function() {
			showIdError("获取${mname}程表单失败");
		},
		success:function(reply) {
			if(reply=="fail") {
				showIdError("获取${mname}程表单失败");
			}else{
				$("#formcontent").html(reply);
				$("#formcontent div.rich_editor_div").contextmenu(option1);
			}
		}
	});
}

function getCoursecontent(inputdate,link,infoid)
{
	$.ajax({
		url:"emr/getCoursecontent.htm?link="+link+"&infoid="+infoid,
		type:"get",
		cache: false,
		async : false,
		error:function() {
			showIdError("获取${mname}程内容失败");
		},
		success:function(reply) {
			if(reply=="fail") {
				showIdError("获取${mname}程内容失败");
			}else{
				if($("#"+infoid).length>0){
					$("#"+infoid).replaceWith(reply);
				}else{
					$("#modelContent").append(reply);
				}
				$("#"+infoid+" div[contenteditable='true']").contextmenu(option2);
				sortCourse();
				$("#"+infoid).focus();
			}
		}
	});
}

function showIdError(error,id)
{
	if(typeof id == "undefined")id="error";
	var $id = $("#"+id);
	if (!window.errorids){
        window.errorids=new Array();
	}
	var idexist = false;
    for (var i=0,elen = errorids.length; i<elen; i+=1){
	   if(id == errorids[i].attr("id")){
		   idexist = true;
	   }else{
    	   errorids[i].html("");
	   }
   }
    if(!idexist)errorids.push($id);	
	$id.stop().html(error).show(0).delay(5000).hide(0);  

}

function openEdit(id){		
	//$("#openEdit").attr("disabled",true);
	//$("#saveCourse").attr("disabled",true);
	if(!gridbox){
		myCalendar = new dhtmlXCalendarObject(["m_ttime"]);
		myCalendar.setDateFormat("%Y-%m-%d %H:%i");
		myCalendar.setSensitiveRange("<fmt:formatDate value="${patinfo.admiss_date}" pattern="yyyy-MM-dd HH:ss"/>","<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd HH:ss"/>");
		mtype_combo = new dhtmlXCombo("mtypediv","mtype",250);
		mtype_combo.readonly(true,false);
		mtype_combo.attachEvent("onSelectionChange", function(){
			$("#lastObjId").val("");
			if($("#m_infoid").val()!="")return true;
			clearDirty();
			//$("#saveCourse").attr("disabled",true);
			//$("#deleteCourse").attr("disabled",true);
			mtype_combo.confirmValue();
			var arry  = mtype_combo.getActualValue().split("|");
			getFormcontent(arry[0],arry[1],"");
			$("#saveCourse").attr("disabled",false);
		}); 
		getMtypes();
		gridbox = new dhtmlXGridObject("gridbox");
    	gridbox.enableAutoWidth(true);
		gridbox.setImagePath("imgs/");
		gridbox.setSkin("dhx_custom");
		gridbox.setInitWidths("0,0,95,*,60,0,0,0,0");
		gridbox.setHeader("打印,新页,时间（'<font style=\"color:red;\">|</font>'另页）,类型,医生,路径,创建人id,modelid,isnewpage");
		gridbox.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
		gridbox.setColAlign("center,center,center,left,center,center,center,center,center");
		gridbox.setColumnHidden(0,true);
		gridbox.setColumnHidden(1,true);
		gridbox.setColumnHidden(5,true);
		gridbox.setColumnHidden(6,true);
		gridbox.setColumnHidden(7,true);
		gridbox.setColumnHidden(8,true);
		gridbox.attachEvent("onRowDblClicked", doLook);
		gridbox.init();
		freshGrid(id);
	}
	$("#m_ttime").val(getNowTime());

	var tempheight = $(window).height();
	$("#readdiv").height(tempheight-385);
	$("#editdiv").css("display","block");

}
function closeEdit()
{
	if(confirmDirty()){
		$("#editdiv").css("display","none");
		$("#readdiv").height("100%");
		clearEdit();
		$("#openEdit").attr("disabled",false);
	}
}


function clearEdit()
{
	mtype_combo.disable(false);
	mtype_combo.closeAll();
	mtype_combo.setComboText("");
	mtype_combo.setComboValue("");
	$("#m_modelid").val("");
	$("#m_infoid").val("");
	$("#m_ttime").val(getNowTime());
	$("#m_isnewpage").attr("checked", false);
	$("#formcontent").html("");
	gridbox.clearSelection();
	//$("#saveCourse").attr("disabled",true);
	//$("#deleteCourse").attr("disabled",true);
}

function freshGrid(id)
{
	gridbox.clearAndLoad("emr/get_course_list.htm?emrid=${param.emrid}",function(){
		//if(typeof id != "undefined")gridbox.selectRowById(id);//have enter bug
	});
}

function doSave()
{
	var m_ttime_v = $("#m_ttime").val();
	if($.trim(m_ttime_v)==""){
		showIdError("时间不能为空");
		return false;
	}
	if(m_ttime_v.match(/^(\d{1,4})\-(\d{1,2})\-(\d{1,2}) (\d{1,2}):(\d{1,2})$/)==null){
	   alert("时间格式有误");
	   return false;
	}
	var iframeformContentArray = new Array();
	var iframeformContent = $("#courseContentForm").serialize();
	if(iframeformContent!=null && iframeformContent.length > 0){
		iframeformContentArray.push("&",iframeformContent);
	}
	var divedit = $("#formcontent div.rich_editor_div");
	for(var k=0,dlen = divedit.length;k<dlen;k+=1){
		iframeformContentArray.push("&",$(divedit[k]).attr("name"),"=",encodeURIComponent($(divedit[k]).html().replace("\u200B","").replace(/\r\n/g,"\n")));
	}
	$.ajax({
		 url:"emr/saveCourse.htm",
  		 type:"post",
 		 async:true,
 		 cache:false,
 		 data:iframeformContentArray.join(""),
  		 success:function(reply){
  			var data=$.parseJSON(reply);
  			//if(data[0].excCount > 0){
  				if($("#m_infoid").val()==""){
  	  				$("#m_infoid").val(data[0].infoid);
  				}
  				$("#deleteCourse").attr("disabled",false);
  				var arry  = mtype_combo.getActualValue().split("|");
  				getCoursecontent($("#m_ttime").val(),arry[1],data[0].infoid)
  				freshGrid(data[0].infoid);
  				clearDirty();
  				mtype_combo.disable(true);
  				$("#continuePrint").attr("disabled", false);
  				showIdError("保存成功");
			//}else{
			//	showIdError("保存失败");
			//}
 	   	 },
	 	 error:function() {
			showIdError("服务器请求连接失败");
		 }
   	});
}

function doDelete()
{
	if(window.confirm("确定要删除？")){
		$("#clearEdit").attr("disabled",true);
		$("#deleteCourse").attr("disabled",true);
		var infoid = $("#m_infoid").val();
		$.ajax({
			type:"get",
			async : false,   
			cache: false,
			url:"emr/deleteCourse.htm",
			data: "infoid="+infoid,
			success: function(reply){
				var data=$.parseJSON(reply);
				if(data[0].excCount > 0){
					gridbox.deleteRow(infoid);
					clearEdit();
					$("#"+infoid).remove();
					clearDirty();
					$("#lastObjId").val("");
					showIdError("删除成功");
				}else{
					showIdError("删除失败");
					$("#deleteCourse").attr("disabled",false);
				}
				$("#clearEdit").attr("disabled",false);
			},
			error:function(){
				showIdError("系统错误");
				$("#clearEdit").attr("disabled",false);
				$("#deleteCourse").attr("disabled",false);
				return false;
			}
		});
	}
}

function doLook(rowId,colIndex)
{
	if(confirmDirty()){
		$("#m_infoid").val(rowId);
		if(gridbox.cells(rowId,6).getValue()=="${user.id}" || ${emrroles.kzr}){
			$("#saveCourse").attr("disabled",false);
			$("#deleteCourse").attr("disabled",false);
		}else {
			//$("#saveCourse").attr("disabled",true);
			//$("#deleteCourse").attr("disabled",true);
		}
		mtype_combo.closeAll();
		mtype_combo.selectOption(mtype_combo.getIndexByValue(gridbox.cells(rowId,7).getValue()+"|"+gridbox.cells(rowId,5).getValue()),true,true);
		mtype_combo.disable(true);
		$("#m_ttime").val(gridbox.cells(rowId, 2).getAttribute("title"));
		if(gridbox.cells(rowId,8).getValue()=="Y"){
			$("#m_isnewpage").attr("checked", true);
		}else{
			$("#m_isnewpage").attr("checked", false);
		}
		$("#m_modelid").val(gridbox.cells(rowId,7).getValue());
		getFormcontent(gridbox.cells(rowId,7).getValue(),gridbox.cells(rowId,5).getValue(),rowId);
	}
}


function doFullPrint()
{
	$("#fullPrint").attr("disabled", true);
	var printids = new Array();
	$("input[type='checkbox'][name='isprint']").each(function(j){
		this.checked = true;
		printids.push(",",this.value);
	});	
	var a = $("#headerhtml").height();
	var url = "model_course_preview.htm?full=Y&emrPageType=${emrPageType}&emrid="+$("#m_emrid").val()+"&time="+new Date().valueOf();
	LODOP.PRINT_INIT("${mname}程记录打印");
	<c:if test="${emrPageType=='A4'}">LODOP.SET_PRINT_PAGESIZE(1,0,0, "A4");</c:if>	
	<c:if test="${emrPageType=='16K'}">LODOP.SET_PRINT_PAGESIZE(1,0,0, "");</c:if>	
	if($("#isShowPagerNum").attr("checked")){
		var pagestr = "第   页";
		var isShowPagerNoChecked=$("#isShowPagerNo").attr("checked");
		var itemType = 1;
		if(isShowPagerNoChecked){
			 pagestr = "第#页";
			 itemType = 2;
		}
		<c:if test="${emrPageType=='A4'}">LODOP.ADD_PRINT_TEXT("280mm","94.5mm","16mm","2mm",pagestr);</c:if>
		<c:if test="${emrPageType=='16K'}">LODOP.ADD_PRINT_TEXT("253mm","98mm","16mm","2mm",pagestr);	</c:if>
		if(isShowPagerNoChecked) LODOP.SET_PRINT_STYLEA(0,"StartNumberValue",$("#pagerStartNum").val()==""?"1":$("#pagerStartNum").val());
		LODOP.SET_PRINT_STYLEA(0,"FontSize",10);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",itemType);
	}
	<c:if test="${emrPageType=='A4'}">
	LODOP.ADD_PRINT_URL(60+a,50,"210mm",990-a,url);
	LODOP.ADD_PRINT_HTM(60,50,"210mm",a,"<link rel=\"stylesheet\" type=\"text/css\" href=\"<%=basePath%>/css/emrmodel.css\"><style type=\"text/css\">*{ margin:0 auto;} .divbg01{width: 650px;}</style><body style=\"background-color: #fff;\"><div class=\"divbg01\">"+$("#headerhtml").html()+"</div></body>");
	</c:if>
	<c:if test="${emrPageType=='16K'}">	
	LODOP.ADD_PRINT_URL(30+a,60,"195mm",900-a,url);
	LODOP.ADD_PRINT_HTM(30,60,"195mm",a,"<link rel=\"stylesheet\" type=\"text/css\" href=\"<%=basePath%>/css/emrmodel.css\"><style type=\"text/css\">*{ margin:0 auto;} .divbg01{width: 650px;}</style><body style=\"background-color: #fff;\"><div class=\"divbg01\">"+$("#headerhtml").html()+"</div></body>");					
	</c:if>
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	var succode = LODOP.PREVIEW();
	if(succode>0){
		markPrint(printids.join(""))
	}
	$("#fullPrint").attr("disabled", false);
	//LODOP.PRINT();
}


function doContinuePrint()
{
	if(window.confirm("请确认打印机已正确放入此病程记录上次打印最末纸张？")){
		$("#continuePrint").attr("disabled", true);
		var a = $("#headerhtml").height();
		var divedit = $("#modelContent div.rich_editor_div");
		var checkprint = $("input[type='checkbox'][name='isprint']");
		var pagenum = 0,tempheight=0;
		var printids = new Array();
		for(var k=0,dlen = divedit.length;k<dlen;k+=1){
			if(checkprint[k].checked==false)break;
			if($(divedit[k]).attr("isnewpage")!="Y"){
				tempheight = tempheight+ $(divedit[k]).height();
			}else{
				<c:if test="${emrPageType=='A4'}">
				pagenum = pagenum +((tempheight/(990-a)|0)+1);
				tempheight = $(divedit[k]).height();
				</c:if>
				<c:if test="${emrPageType=='16K'}">	
				pagenum = pagenum +((tempheight/(900-a)|0)+1);
				tempheight = $(divedit[k]).height();
				</c:if>
			}
			printids.push(",",checkprint[k].value);
		}
		<c:if test="${emrPageType=='A4'}">
		pagenum = pagenum +((tempheight/(990-a)|0)+1);
		</c:if>
		<c:if test="${emrPageType=='16K'}">	
		pagenum = pagenum +((tempheight/(900-a)|0)+1);
		</c:if>
		var pageUnIndex="1";
		for(var m=2;m<=pagenum;m++){
			pageUnIndex+=","+m;
		}
		var url = "model_course_preview.htm?full=N&emrPageType=${emrPageType}&emrid="+$("#m_emrid").val()+"&printids="+printids.join("")+"&time="+new Date().valueOf();
		LODOP.PRINT_INIT("${mname}程记录打印");
		LODOP.SET_PRINT_MODE ("PRINT_START_PAGE",pagenum);
		<c:if test="${emrPageType=='A4'}">LODOP.SET_PRINT_PAGESIZE(1,0,0, "A4");</c:if>	
		<c:if test="${emrPageType=='16K'}">LODOP.SET_PRINT_PAGESIZE(1,0,0, "");</c:if>	
		
		if($("#isShowPagerNum").attr("checked")){
			<c:if test="${emrPageType=='A4'}">LODOP.ADD_PRINT_TEXT("280mm","94.5mm","4mm","2mm","第#页");</c:if>
			<c:if test="${emrPageType=='16K'}">LODOP.ADD_PRINT_TEXT("253mm","98mm","4mm","2mm","第#页");	</c:if>
			LODOP.SET_PRINT_STYLEA(0,"StartNumberValue",$("#pagerStartNum").val()==""?"1":$("#pagerStartNum").val());
			LODOP.SET_PRINT_STYLEA(0,"FontSize",10);
			LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
			LODOP.SET_PRINT_STYLEA(0,"PageUnIndex",pageUnIndex);
		}

		<c:if test="${emrPageType=='A4'}">
			LODOP.ADD_PRINT_URL(60+a,50,"210mm",990-a,url);
			LODOP.ADD_PRINT_HTM(60,50,"210mm",a,"<link rel=\"stylesheet\" type=\"text/css\" href=\"<%=basePath%>/css/emrmodel.css\"><style type=\"text/css\">*{ margin:0 auto;} .divbg01{width: 650px;}</style><body style=\"background-color: #fff;\"><div class=\"divbg01\">"+$("#headerhtml").html()+"</div></body>");
		</c:if>
		<c:if test="${emrPageType=='16K'}">	
			LODOP.ADD_PRINT_URL(30+a,60,"195mm",900-a,url);
			LODOP.ADD_PRINT_HTM(30,60,"195mm",a,"<link rel=\"stylesheet\" type=\"text/css\" href=\"<%=basePath%>/css/emrmodel.css\"><style type=\"text/css\">*{ margin:0 auto;} .divbg01{width: 650px;}</style><body style=\"background-color: #fff;\"><div class=\"divbg01\">"+$("#headerhtml").html()+"</div></body>");					
		</c:if>
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"PageUnIndex",pageUnIndex);
		var succode = LODOP.PREVIEW();
		if(succode>0){
			var allprintids = new Array();
			checkprint.each(function(j){
				this.checked = true;
				allprintids.push(",",this.value);
			});	
			markPrint(allprintids.join(""))
		}
		$("#continuePrint").attr("disabled", false);
	}
}

function markPrint(printids)
{
	if(printids=="")return;
	$.ajax({
		url:"emr/markPrint.htm?printids="+printids,
		type:"post",
		cache: false,
		async : true,
		error:function() {
			alert("打印标记请求失败");
		},
		success: function(reply){
			var data=$.parseJSON(reply);
			if(data[0].excCount <= 0)alert("打印标记失败");
		}
	});
}

function sortCourse()
{
	var orderdates = [];
	var divedit = $("#modelContent div.rich_editor_div");
	for(var k=0,dlen = divedit.length;k<dlen;k+=1){
		orderdates.push([$(divedit[k]).attr("orderdate"), $(divedit[k]).attr("id")]);
	}
	orderdates.sort(sortABC);
	for (var t=0; t < orderdates.length; t++){
		$("#modelContent").append($("#"+orderdates[t][1]));
	}
}

function sortABC(a, b){			
	return a[0] - b[0];
}

function getNowTime()
{
	var nowtime = new Date();
	var monthn = nowtime.getMonth()+1<10?"0"+(nowtime.getMonth()+1):nowtime.getMonth()+1;
	var daten = nowtime.getDate()<10?"0"+nowtime.getDate():nowtime.getDate();
	var hoursn = nowtime.getHours()<10?"0"+nowtime.getHours():nowtime.getHours();
	var minutesn = nowtime.getMinutes()<10?"0"+nowtime.getMinutes():nowtime.getMinutes();
	//console.log(nowtime.getMilliseconds());
	return nowtime.getFullYear()+"-"+monthn+"-"+daten+" "+hoursn+":"+minutesn;

}

function confirmDirty()
{
	if(stack.dirty()){
		if(window.confirm("当前修改信息尚未保存，是否继续？")){
			stack["save"]();
			parent.removeMarkModified();
			return true;
		}else{
			return false;
		}
	}	
	return true;
}

function clearDirty()
{
	stack["save"]();
	parent.removeMarkModified();
}

function changeNumLabel(a,b)
{
	$("#"+a).toggle(0, function() {
		 $.cookie(b, $(this).css("display"));
	 });
}
<c:if test="${param.canEdit=='true'}">
$(function(){
	$("#cursorbug").focus();
	$("#modelContent").on("mouseover", "div[class*='rich_editor_div']", function(e){
		$(this).addClass("infoborder");
	}).on("mouseout", "div[class*='rich_editor_div']",  function(e){
		$(this).removeClass("infoborder");
	}).on("dblclick","div[class*='rich_editor_div']", function(e){
		if($("#m_infoid").val()!="" && $("#m_infoid").val()==$(this).attr("id")) return false;
		if(confirmDirty()){
			$("#m_infoid").val($(this).attr("id"));
			if($("#editdiv").css("display")=="none"){
				openEdit($(this).attr("id"));
			}else{
				//gridbox.selectRowById($(this).attr("id"));//have enter bug
			}
			if($(this).attr("manid")=="${user.id}" || ${emrroles.kzr}){
				$("#saveCourse").attr("disabled",false);
				$("#deleteCourse").attr("disabled",false);
			}else {
				//$("#saveCourse").attr("disabled",true);
				//$("#deleteCourse").attr("disabled",true);
			}
			mtype_combo.closeAll();
			mtype_combo.selectOption(mtype_combo.getIndexByValue($(this).attr("modelid")+"|"+$(this).attr("linkadd")),true,true);
			mtype_combo.disable(true);
			$("#m_ttime").val($(this).attr("inputdate"));
			if($(this).attr("isnewpage")=="Y"){
				$("#m_isnewpage").attr("checked", true);
			}else{
				$("#m_isnewpage").attr("checked", false);
			}
			$("#m_modelid").val($(this).attr("modelid"));
			getFormcontent($(this).attr("modelid"),$(this).attr("linkadd"),$(this).attr("id"));
			$(this).focus();
		}
	});

	$("#modelContent").on("click", "input[type='checkbox'][name='isprint']", function(e){
		var id = this.value;
		if(this.checked){
			$("input[type='checkbox'][name='isprint']").each(function(j){
				if(this.value==id)return false;
				this.checked = true;
			});		
		}else{
			var os = $("input[type='checkbox'][name='isprint']");
			var osl = os.length;
			for(var m =osl-1;m>=0;m--){
				if(os[m].value==id)break;
				os[m].checked = false;
			}
		}
		if($("input:checked[name='isprint']").length==0){
			$("#continuePrint").attr("disabled", true);
		}else{
			$("#continuePrint").attr("disabled", false);
		}
	});
	
	$("#formcontent").on("focusin",function(e){
  		var $target = $(e.target); 
  		if (!$target.is("div") || ($target.is("div") && $target.attr("contenteditable")!="true")) {
  			clearLastObjInfo();
  		}
 	}).on("mousedown.undo", "input[type=text]", function(e){
		var $that = $(this);
		if(e.which=="1" || e.which=="2" || e.which=="3" || e.which=="4" || e.which=="5" || e.which=="6" || e.which=="7" || e.which=="9"){
			if($that.attr("id") != lastDoId)$("body").data($that.attr("id"), $that.val());
			if((!stack.canRedo() || (!stack.canUndo() && stack.canRedo())) && lastDoId!=-1){
				editRecord($("#"+lastDoId));
			}
			lastDoId = $that.attr("id");
		}
		//return false; 
	}).on("keyup.undo mouseup.undo", "input[type=text]", function(e){
		if(e.which=="1" || e.which=="2" || e.which=="3" || e.which=="4" || e.which=="5" || e.which=="6" || e.which=="7" || e.which=="9" || (e.metaKey && (e.keyCode == 90 || e.keyCode == 89))){
			return false; 
		}
		window.clearTimeout(inputTime);
		var $that = $(this);
		inputTime = window.setTimeout(function(){
			editRecord($that);
		},250);
		//return false;
	});	
  	
  	if ($.browser.mozilla){
		document.execCommand('enableObjectResizing', false, false);
		document.execCommand('enableInlineTableEditing', false, false);			
	}else if($.browser.msie &&($.browser.version=="7.0")){
  		document.execCommand("RespectVisibilityInDesign", false, true);
	}
  	$("#modelContentForm").on("focusin",function(e){
  		var $target = $(e.target); 
  		if (!$target.is("div") || ($target.is("div") && $target.attr("contenteditable")!="true")) {
  			clearLastObjInfo();
  			//$("#menuair").hide();
  		}
 	}).on("mousedown.undo", "input[type=text]", function(e){
		var $that = $(this);
		if(e.which=="1" || e.which=="2" || e.which=="3" || e.which=="4" || e.which=="5" || e.which=="6" || e.which=="7" || e.which=="9"){
			if($that.attr("id") != lastDoId)$("body").data($that.attr("id"), $that.val());
			if((!stack.canRedo() || (!stack.canUndo() && stack.canRedo())) && lastDoId!=-1){
				editRecord($("#"+lastDoId));
			}
			lastDoId = $that.attr("id");
		}
		inactiveAllButtons($("#rich_editor_fix"));
		//return false; 
	}).on("keyup.undo mouseup.undo", "input[type=text]", function(e){
		if(e.which=="1" || e.which=="2" || e.which=="3" || e.which=="4" || e.which=="5" || e.which=="6" || e.which=="7" || e.which=="9" || (e.metaKey && (e.keyCode == 90 || e.keyCode == 89))){
			return false; 
		}
		window.clearTimeout(inputTime);
		var $that = $(this);
		inputTime = window.setTimeout(function(){
			editRecord($that);
		},250);
		//return false;
	});		
  	
/*  $("#menuair").on("click","a",function(e){
  		try{
  			document.execCommand($(this).attr("exec"), false, $(this).attr("key"));
  		}catch (e) {}
  		$("#menuair").hide();
  	});*/
  	
  	$("#menufix").on("click","a",function(e){
		try{
			if($(this).attr("key")!=null) document.execCommand($(this).attr("exec"), false, $(this).attr("key"));
			alert(dddd)
		}catch (e) {}
		return false;
	});
  	
  	if ($.browser.mozilla){
		document.execCommand('enableObjectResizing', false, false);
		document.execCommand('enableInlineTableEditing', false, false);			
	}else if($.browser.msie &&($.browser.version=="7.0")){
  		document.execCommand("RespectVisibilityInDesign", false, true);
	}

var option = { width: 120, items: [
       { text: "加入常用语", icon: "img/emr/page_white_add.png", alias: "addWords", action: menuAction },
       /*
       { type: "splitLine" },
       { text: "剪切（Ctrl+X）", icon: "img/emr/cut01.png", alias: "cut", action: menuAction },
       { text: "复制（Ctrl+C）", icon: "img/emr/copy01.png", alias: "copy", action: menuAction },
       { text: "粘贴（Ctrl+V）", icon: "img/emr/stick01.png", alias: "stick", action: menuAction },
       { type: "splitLine" },
       */
       { text: "插入特殊字符", icon: "img/emr/spechars.png", alias: "addSpechars", action: menuAction },
       { text: "常用表达式", icon: "img/emr/jme.png", alias: "insertmath", type: "group", width: 140, items: [
	        { text: "月经史", icon: "img/emr/math1.png", alias: "insertmath1", action: menuAction },
	        { text: "上标", icon: "img/emr/math2.png", alias: "insertmath2", action: menuAction },
	        { text: "下标", icon: "img/emr/math2.png", alias: "insertmath3", action: menuAction },
	        { text: "9次方", icon: "img/emr/math2.png", alias: "insertmath4", action: menuAction },
	        { text: "12次方", icon: "img/emr/math2.png", alias: "insertmath5", action: menuAction },
	        { text: "G1P2", icon: "img/emr/math2.png", alias: "insertmath6", action: menuAction }
       ]},
       { text: "插入图片", icon: "img/emr/insertimage.png", alias: "insertimage", action: menuAction },
       { text: "插入表格", icon: "img/emr/inserttable.png", alias: "insertTable1", action: menuAction },
       { text: "表格属性", icon: "img/emr/inserttable.png", alias: "insertTable2", action: menuAction },
       { text: "单元格属性", icon: "img/emr/td.png", alias: "tdproperty", action: menuAction },
       { text: "表格操作", icon: "img/emr/dealtable.png", alias: "dealtable", type: "group", width: 120, items: [
          { text: "删除表格", icon: "img/emr/deletetable.png", alias: "deletetable", action: menuAction },
          { text: "表格前插入行", icon: "img/emr/insertparagraphbeforetable.png", alias: "insertparagraphbeforetable", action: menuAction },
          { text: "删除行", icon: "img/emr/deleterow.png", alias: "deleterow", action: menuAction },
          { text: "删除列", icon: "img/emr/deletecol.png", alias: "deletecol", action: menuAction },
          { text: "插入行", icon: "img/emr/insertrow.png", alias: "insertrow", action: menuAction },
          { text: "插入列", icon: "img/emr/insertcol.png", alias: "insertcol", action: menuAction },
          
          { text: "向右合并", icon: "img/emr/mergeright.png", alias: "mergeright", action: menuAction },
          { text: "合并单元格", icon: "img/emr/mergecells.png", alias: "mergecells", action: menuAction },
          { text: "向下合并", icon: "img/emr/mergedown.png", alias: "mergedown", action: menuAction },
          { text: "完全拆分单元格", icon: "img/emr/splittocells.png", alias: "splittocells", action: menuAction },
          { text: "拆分成行", icon: "img/emr/splittorows.png", alias: "splittorows", action: menuAction },
          { text: "拆分成列", icon: "img/emr/splittocols.png", alias: "splittocols", action: menuAction }
       ]}
       ], onShow: applyrule
                                 
};
	function menuAction() {
		var action = this.data.alias;
		       	if(action=="addWords"){
		               parent.wordsEdit(w.replace(/<del[^>]*>(.*?)<\/del>/gi,"").replace(/<ins[^>]*>/gi,"").replace(/<\/ins>/gi,""));
		       	}else if(action=="addSpechars"){
					if(!parent.specharsLoad)parent.createTab();
					parent.bindSpanClick(2);
					parent.$("#specharsDiv").css({left:parent.getLeftPos(640), top:parent.getTopPos(520)}).fadeIn("fast",function(){
						parent.$("#specialbug2").focus().css("display","none");
						parent.$("#fullbodybg").css("display","block");
					});
				}else if(action=="insertimage"){
					parent.insertImg(2);
				}else if(action=="splittocols"){
					splittocols(intd[0] || currentSelectedArr[0],$trigger);
				}else if(action=="splittorows"){
					splittorows(intd[0] || currentSelectedArr[0],$trigger);			            					
				}else if(action=="splittocells"){
					splittocells(intd[0]);						
				}else if(action=="mergedown"){
					mergedown(intd[0] || currentSelectedArr[0],$trigger);							
				}else if(action=="mergecells"){
					mergecells($trigger);
				}else if(action=="mergeright"){
					mergeright(intd[0] || currentSelectedArr[0],$trigger);
				}else if(action=="deletetable"){
					   if(intable){
						    removeNode( $selectionParent[0]);
			            	resetTable();
					   }
				}else if(action=="deleterow"){
					deleterow(intd[0],$trigger);
				}else if(action=="deletecol"){
					deletecol(intd[0],$trigger);
				}else if(action=="insertrow"){
					insertrow(intr[0] || currentSelectedArr[0].parentNode,$trigger);
				}else if(action=="insertcol"){
					insertcol(intd[0] || currentSelectedArr[0],$selectionParent[0],$trigger);		
				}else if(action=="insertparagraphbeforetable"){
					   if(intable){
						   insertparagraphbeforetable($selectionParent[0] ,$trigger);
					   }
				}else if(action=="insertTable1" ||action=="insertTable2"){
					parent.insertOrEditTable(2,intable,$selectionParent[0]);
				}else if(action=="tdproperty"){
					parent.tdproperty(2,intd[0]);
				}else if(action=="cut"){
					TextareaUtils.restoreSelection();
					document.execCommand("Cut",false,null);
					editRecord($trigger);
				}else if(action=="copy"){
					setClipboard(x);
				}else if(action=="stick"){
					var lastid =$("#lastObjId").val();
		 			if(lastid.length == 0)return false;
		 			var str = getClipboard();
					TextareaUtils.insertText(document.getElementById(lastid),str==null?"":str,true,false,null,parent.needRecordTrace,parent.needUpdateUndo);
					editRecord($trigger);
				}else if(action=="insertmath1" ){
					parent.insertmath(action,1);
				}else if(action=="insertmath2"){
		       		parent.insertmath2(action,1);
		       	}else if(action=="insertmath3"){
		       		parent.insertmath2(action,2);
		       	}else if(action=="insertmath4"){
		       		parent.insertmath2(action,3);
		       	}else if(action=="insertmath5"){
		       		parent.insertmath2(action,4);
		       	}else if(action=="insertmath6"){
		       		parent.insertmath2(action,5);
		       	}else{
		       		return false;
		       	}
	}
 function applyrule(menu) { 
     		if (document.selection){
         		if (document.selection.type.toLowerCase() === "control"){
         			return false;
         		}
         	}
     		$trigger = $("#"+this.id);
     		intable = false;
     		intd = false;
     		intr = false;
         	w = TextareaUtils.getSelectedHtml();
         	x = TextareaUtils.getSelectedText();
         	$selectionParent = $(TextareaUtils.getRangeParentNode());
 			if($selectionParent.is("body") || ($selectionParent.is("a") && ($selectionParent.hasClass("selectionArea")|| $selectionParent.hasClass("elementArea")))) return false;
 			if($selectionParent.parents("a[class='selectionArea'],a[class='elementArea']").length>0)return false;
 			
 			while (!($selectionParent.is("div") && $selectionParent.attr("contenteditable")=="true")) {
 				if($selectionParent.is("td") || $selectionParent.is("th")){
 					intd = $selectionParent;
 				}else if($selectionParent.is("tr")){
 					intr = $selectionParent;
 				}
 				$selectionParent = $selectionParent.parent();
 				if($selectionParent.is("table")){
 					intable = true;
 					break;
 				}
 			} 
 			var items=[],combiea="";
 			if(intable){
 				combiea="a";
 				items.push( {alias: "insertTable1", hidden: true});
 			}else{
 				combiea="b";
 				items.push( {alias: "insertTable2", hidden: true});
 			}
         	if(intd){
 				if(!canMergeright(intd[0])){
 					combiea+="c";
 					items.push( {alias: "mergeright", hidden: true});
 				}
 				if(!canMergecells()){
 					combiea+="d";
 					items.push( {alias: "mergecells", hidden: true});
 				}
 				if(!canMergedown(intd[0])){
 					combiea+="e";
 					items.push( {alias: "mergedown", hidden: true});
 				}
 				if(!canSplittocells(intd[0])){
 					combiea+="f";
 					items.push( {alias: "splittocells", hidden: true});
 				}
 				if(!canSplittorows(intd[0] && !currentSelectedArr[0])){
 					combiea+="g";
 					items.push( {alias: "splittorows", hidden: true});
 				}
 				if(!canSplittocols(intd[0] && !currentSelectedArr[0])){
 					combiea+="h";
 					items.push( {alias: "splittocols", hidden: true});
 				}
 			}else{
 				combiea+="i";
 				items.push( {alias: "tdproperty", hidden: true},{alias: "dealtable", hidden: true});
 			}
    		   if(x.length==0){
    			  items.push({alias: "addWords", hidden: false},
                         {alias: "cut", hidden: false},
                         {alias: "copy", hidden: false});
    			   menu.applyrule({ name: "noselectsome"+combiea,
                       disable: true,
                       items:items
                   }); 
    		   }else{
    			  items.push({alias: "addSpechars", hidden: false},
                         {alias: "insertmath", hidden: false},
                         {alias: "insertimage", hidden: false});
    			  if(!intable)items.push({alias: "insertTable1", hidden: false});
    			  menu.applyrule({ name: "selectsome"+combiea,
                     disable: true,
                     items:items
                 }); 
    		   }
        }
    $("div[contenteditable='true']").contextmenu(option);   
    
    $(document).dwseeTopBottomMenu();
	doChangeLook($("ins"),$("del"));
	username = "${user.name}";
	stack = new Undo.Stack(),
	EditCommand = Undo.Command.extend({
		constructor: function(textarea, oldValue, newValue,doType,showChange) {
			this.textarea = textarea;
			this.oldValue = oldValue;
			this.newValue = newValue;
			this.doType = doType;
			this.showChange = showChange;
		},
		execute: function() {
		},
		undo: function() {
			if(this.doType=="1"){
				this.textarea.html(this.oldValue);
				lastDoId = this.textarea.attr("id");
				$("body").data(this.textarea.attr("id"), this.oldValue);
				//this.textarea.focus();
			}else if(this.doType=="3"){
				this.textarea.val(this.oldValue);
				lastDoId = this.textarea.attr("id");
				$("body").data(this.textarea.attr("id"), this.oldValue);
				//this.textarea.focus();
			}else if(this.doType=="4"){
				var a = this.textarea;
				var b = this.oldValue;
				$("input[type='checkbox'][name='"+a+"']").each(function(index){
					$(this).attr("checked",b[index]);
				});
				dealChecked(a);
			}else if(this.doType=="5"){
				if(this.oldValue==""){
					$("input[type='radio'][name='"+this.textarea+"']").attr("checked",false);
				}else{
					$("input[type='radio'][name='"+this.textarea+"'][value='"+this.oldValue+"']").attr("checked",true);	
				}
			}else if(this.doType=="6"){//注意不同浏览器性能
				this.textarea.html(this.oldValue);
				$("#manageTableShowTr").on("mouseover.manageTable","td",function(e){
					return on_event($(this));
				});
			}
			if(this.showChange){
				$("#lookHistory").removeClass("act");
				$("#lookHistory").attr("title","显示审计修改");
			    isShow = false;
				delClass="delHide";
				insClass="insHide";
				doChangeLook($("ins"),$("del"));
		  	}
		},
		redo: function() {
			if(this.doType=="1"){
				this.textarea.html(this.newValue);
				lastDoId = this.textarea.attr("id");
				$("body").data(this.textarea.attr("id"), this.newValue);
				//this.textarea.focus();
			}else if(this.doType=="3"){
				this.textarea.val(this.newValue);
				lastDoId = this.textarea.attr("id");
				$("body").data(this.textarea.attr("id"), this.newValue);
				//this.textarea.focus();
			}else if(this.doType=="4"){
				var a = this.textarea;
				var b = this.newValue;
				$("input[type='checkbox'][name='"+a+"']").each(function(index){
					$(this).attr("checked",b[index]);
				});
				dealChecked(a);
			}else if(this.doType=="5"){
				if(this.newValue==""){
					$("input[type='radio'][name='"+this.textarea+"']").attr("checked",false);
				}else{
					$("input[type='radio'][name='"+this.textarea+"'][value='"+this.newValue+"']").attr("checked",true);	
				}
			}else if(this.doType=="6"){//注意不同浏览器性能
				this.textarea.html(this.newValue);
				$("#manageTableShowTr").on("mouseover.manageTable","td",function(e){
					return on_event($(this));
				});
			}	
			if(this.showChange){
				$("#lookHistory").removeClass("act");
				$("#lookHistory").attr("title","显示审计修改");
			    isShow = false;
				delClass="delHide";
				insClass="insHide";
				doChangeLook($("ins"),$("del"));
		  	}
		}
	});
	stack.changed = function() {
		stackUI();
	};
	function stackUI() {
		if(stack.canUndo()){
			$("#tundo").removeClass("rich_editor_fix_btn_cancel0").addClass("rich_editor_fix_btn_cancel1");
		}else{
			$("#tundo").removeClass("rich_editor_fix_btn_cancel1").addClass("rich_editor_fix_btn_cancel0");
		}
		if(stack.canRedo()){
			$("#tredo").removeClass("rich_editor_fix_btn_restore0").addClass("rich_editor_fix_btn_restore1");
		}else{
			$("#tredo").removeClass("rich_editor_fix_btn_restore1").addClass("rich_editor_fix_btn_restore0");
		}
		if(stack.dirty()){
			parent.markModified();
		}else{
			parent.removeMarkModified();
		}
	}
	$("#tundo,#tredo").on("click",function(e){
		if($(this).hasClass("rich_editor_fix_btn_cancel0") || $(this).hasClass("rich_editor_fix_btn_restore0"))return false;
		var what = $(this).attr("id").slice(1);
		stack[what]();
		return false;
 	});
	$("body").on("keydown.ctrlundo",function(e) {
		if (!e.metaKey || (e.keyCode != 90 && e.keyCode != 89)) {
			return;
		}
		e.preventDefault();
		$("#"+lastDoId).blur();
		if (e.keyCode==89){
			stack.canRedo() && stack.redo();	
		}else if (e.keyCode==90){
			stack.canUndo() && stack.undo(); 
		}
	}).on("click.common",function(e){
		$("#tipGuide").hide();
		$("#popupdiv").hide();
		$("#popupdiv2").hide();
		$("#popupdiv3").hide();
	});
                              
      $(document).dwseeTopBottomMenu();

     	username = "${user.name}";
     	stack = new Undo.Stack(),
     	EditCommand = Undo.Command.extend({
     		constructor: function(textarea, oldValue, newValue,doType,showChange) {
     			this.textarea = textarea;
     			this.oldValue = oldValue;
     			this.newValue = newValue;
     			this.doType = doType;
     			this.showChange = showChange;
     		},
     		execute: function() {
     		},
     		undo: function() {
     			if(this.doType=="1"){
     				this.textarea.html(this.oldValue);
     				lastDoId = this.textarea.attr("id");
     				$("body").data(this.textarea.attr("id"), this.oldValue);
     				//this.textarea.focus();
     			}else if(this.doType=="3"){
     				this.textarea.val(this.oldValue);
     				lastDoId = this.textarea.attr("id");
     				$("body").data(this.textarea.attr("id"), this.oldValue);
     				//this.textarea.focus();
     			}else if(this.doType=="4"){
     				var a = this.textarea;
     				var b = this.oldValue;
     				$("input[type='checkbox'][name='"+a+"']").each(function(index){
     					$(this).attr("checked",b[index]);
     				});
     				dealChecked(a);
     			}else if(this.doType=="5"){
     				if(this.oldValue==""){
     					$("input[type='radio'][name='"+this.textarea+"']").attr("checked",false);
     				}else{
     					$("input[type='radio'][name='"+this.textarea+"'][value='"+this.oldValue+"']").attr("checked",true);	
     				}
     			}else if(this.doType=="6"){//注意不同浏览器性能
     				this.textarea.html(this.oldValue);
     				$("#manageTableShowTr").on("mouseover.manageTable","td",function(e){
     					return on_event($(this));
     				});
     			}
     			if(this.showChange){
     				$("#lookHistory").removeClass("act");
     				$("#lookHistory").attr("title","显示审计修改");
     			    isShow = false;
     				delClass="delHide";
     				insClass="insHide";
     				doChangeLook($("ins"),$("del"));
     		  	}
     		},
     		redo: function() {
     			if(this.doType=="1"){
     				this.textarea.html(this.newValue);
     				lastDoId = this.textarea.attr("id");
     				$("body").data(this.textarea.attr("id"), this.newValue);
     				//this.textarea.focus();
     			}else if(this.doType=="3"){
     				this.textarea.val(this.newValue);
     				lastDoId = this.textarea.attr("id");
     				$("body").data(this.textarea.attr("id"), this.newValue);
     				//this.textarea.focus();
     			}else if(this.doType=="4"){
     				var a = this.textarea;
     				var b = this.newValue;
     				$("input[type='checkbox'][name='"+a+"']").each(function(index){
     					$(this).attr("checked",b[index]);
     				});
     				dealChecked(a);
     			}else if(this.doType=="5"){
     				if(this.newValue==""){
     					$("input[type='radio'][name='"+this.textarea+"']").attr("checked",false);
     				}else{
     					$("input[type='radio'][name='"+this.textarea+"'][value='"+this.newValue+"']").attr("checked",true);	
     				}
     			}else if(this.doType=="6"){//注意不同浏览器性能
     				this.textarea.html(this.newValue);
     				$("#manageTableShowTr").on("mouseover.manageTable","td",function(e){
     					return on_event($(this));
     				});
     			}	
     			if(this.showChange){
     				$("#lookHistory").removeClass("act");
     				$("#lookHistory").attr("title","显示审计修改");
     			    isShow = false;
     				delClass="delHide";
     				insClass="insHide";
     				doChangeLook($("ins"),$("del"));
     		  	}
     		}
     	});
     	stack.changed = function() {
     		stackUI();
     	};
     	function stackUI() {
     		if(stack.dirty()){
     			parent.markModified();
     		}else{
     			parent.removeMarkModified();
     		}
     	}

     	$("body").on("keydown.ctrlundo",function(e) {
     		if (!e.metaKey || (e.keyCode != 90 && e.keyCode != 89)) {
     			return;
     		}
     		e.preventDefault();
     		$("#"+lastDoId).blur();
     		if (e.keyCode==89){
     			stack.canRedo() && stack.redo();	
     		}else if (e.keyCode==90){
     			stack.canUndo() && stack.undo(); 
     		}
     	}).on("click.common",function(e){
     		$("#tipGuide").hide();
     		$("#popupdiv").hide();
     		$("#popupdiv2").hide();
     	});                           

  	$("#modelContent div[contenteditable='true']").contextmenu(option2);
  	
      var megaConfig = {
           interval: 100,
           sensitivity: 4,
           over: function(){$(this).addClass("hovering");},
           timeout: 500,
           out: function(){$(this).removeClass("hovering");}
};
      $("#coursegrid").hoverIntent(megaConfig);
      
  	var aa = $.cookie("numLabel");
  	var ab = $.cookie("startNumLabel");
  	if(aa=="none"){
  		$("#isShowPagerNum").attr("checked",false);
  		$("#pagerNumLabel").css("display","none");
  	}
  	if(ab=="none"){
  		$("#isShowPagerNo").attr("checked",false);
  		$("#pagerStartNumLabel").css("display","none");
  	}
});</c:if>

var printids = new Array();
function doPackageMake_bc(){	
	var divedit = $("#modelContent div.rich_editor_div");
	var checkprint = $("input[type='checkbox'][name='isprint']");
	var dd = 0;
	for(var k=0;k<divedit.length;k+=1){
		if(checkprint[k].checked!=false){
			printids.push(",",checkprint[k].value);
			dd++;
		}
	}
	if(dd==0){
		alert("请勾选需要生成模版套餐的文书！");
		return false;
	}
	parent.$.blockUI({
		message:$("#packageMackeDiv_bc"),
		css:{width:"365px",height:"170px",border:"1px solid #b6cfd6",padding:"1px",top:parent.getTopPos(170),left:parent.getLeftPos(365)}
	});
}

function doPackageSelect_bc(){
	setTimeout(function(){	
		parent.$.blockUI({
			message:"<iframe height='100%' width='100%' frameborder='0' src='emr_new/emr_modeldir_package_select.htm'></iframe>",
			css:{width:"816px",height:"506px",border:"1px solid #b6cfd6",padding:"1px",left:parent.getLeftPos(816),top:parent.getTopPos(506)}
		});
	},0);
}

$("#confirmButton_pp").click(function(){
	var packageName = parent.$("#packageName_bc").val();
	if(packageName == "" || packageName == "undefined"){
		showIdError("套餐名称不能空",'ctError_p');
		return false;
	}
	$.ajax({
		type:"post",
		url:"emr_new/add_model_package.htm",
		async : false,   
		cache: false,
		data: "packageName="+packageName+"&mrids="+printids+"&modelnames="+$("#modelnames").val()+"&t=i",
		success: function(reply){
			var data=$.parseJSON(reply);
			if(data[0] && data[0].excCount ==0){
				showIdError("保存失败",'ctError_p');
				$packageName.focus();
			}else{
				ajaxPass = true;
			}
			if(ajaxPass){
				parent.clearPackageMackeDiv();
				alert("保存成功！");
				parent.$.unblockUI();
			}

		},
		error:function(){
			showIdError("系统错误",'ctError_p');
			return false;
		}
	});
});


$("#abolishButton_pp").click(function(){
	parent.$.unblockUI();
});

</script>
</body>
</html>
