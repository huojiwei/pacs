/*Qian Guoyuan,checkbox*/
function initCheckbox(a,b,c,d)
{
	var values = b.split("#");
	if(values.length<=0 && !c) return;
	$("input[type='checkbox'][name='"+a+"']").each(function(index){
		for(var j=0,vlen = values.length;j<vlen;j+=1){
			if($(this).val()==values[j]){
				 $(this).attr("checked",true);
			}
		}	
		if(c){
			$(this).attr("onclick","checked=defaultChecked;");
		}else{
			if(d!=null && d == false){
				$(this).on("click",function(){checkedThis(this,a);checkboxRecord(a);});
			}else{
				$(this).on("click",function(){dealChecked(a);checkboxRecord(a);});
			}
		}
	});
	window.setTimeout(function(){
		var checkbox_array = new Array();
		$("input[type='checkbox'][name='"+a+"']").each(function(){ 
			checkbox_array.push(this.checked);
		}); 
		$("body").data(a, checkbox_array);
	},0);
}

function checkboxRecord(a){
	var checkbox_array = new Array();
	$("input[type='checkbox'][name='"+a+"']").each(function(){ 
		checkbox_array.push(this.checked);
	}); 
	stack.execute(new EditCommand(a,$("body").data(a),checkbox_array, "4",isShow));
	$("body").data(a, checkbox_array);
}

function checkedThis(obj,cname)
{
	$("input[type='checkbox'][name='"+cname+"']").each(function(){
		if(this==obj && obj.checked){ 
            this.checked = true; 
         }else{ 
        	if(this==obj && !obj.checked)dealChecked(cname);
        	this.checked = false; 
         } 
	});
} 

function dealChecked(cname)
{
	if($("input:checked[name='"+cname+"']").length==0){
		$("#modelContentForm").append("<input type=\"hidden\" value=\"\" id=\""+cname+"\" name=\""+cname+"\"/>");
	}else{
		if($("#"+cname).length > 0){
			$("#"+cname).remove();
		}
	}
}

/*Qian Guoyuan,radio*/
function initRadio(a,b,c)
{
	$("input[type='radio'][name='"+a+"'][value='"+b+"']").attr("checked",true);
	if(c){
		$("input[type='radio'][name='"+a+"']").each(function(){
			$(this).attr("onclick","checked=defaultChecked;");
		});
	}else{
		$("input[type='radio'][name='"+a+"']").each(function(){
			$(this).on("click",function(){
				radioRecord(a,this.value);
			});
		});
	}
	window.setTimeout(function(){ 
		$("body").data(a, b);
	},0);

}

function radioRecord(a,b){
	stack.execute(new EditCommand(a,$("body").data(a),b, "5",isShow));
	$("body").data(a, b);
}

/*Qian Guoyuan,shortcut*/
function setLastObjInfo(o)
{
	$("#lastObjId").val($(o).attr("id"));
	TextareaUtils.saveSelection();
}

function clearLastObjInfo()
{
	$("#lastObjId").val("");
}

function editRecord($that){
	var newValue;
	if($that.is("div")){
		newValue = $that.html();
		var oldValue = $("body").data($that.attr("id"));
		if(typeof oldValue != "undefined" ){
			oldValue = oldValue.replace(/<\/?a[^>]*>/gi,"");
		}
		if (newValue.replace(/<\/?a[^>]*>/gi,"") != oldValue) {
			stack.execute(new EditCommand($that, $("body").data($that.attr("id")), newValue, "1",isShow));
			$("body").data($that.attr("id"), newValue,isShow);
		}
	}else if($that.is("input")){
		if($that.attr("type")=="text"){
			newValue = $that.val();
			if (newValue != $("body").data($that.attr("id"))) {
				stack.execute(new EditCommand($that, $("body").data($that.attr("id")), newValue, "3",isShow));
				$("body").data($that.attr("id"), newValue,isShow);
			}
		}
	}
}

(function($) {
	var tt=ajaxTime=-1,searched,searchedm,flag=0,me,at={},opts={tip:"atTip",tipOver:"over"};
 	$.fn.shortcut = function(){
		if($('#'+opts.tip).length==0)$('body').append('<div id=\"'+opts.tip+'\"></div>');
		return init(this.get(0));
	};
	function init(o){		
		$(o).on('keyup.shortcut mouseup.shortcut',function(event){check(o,event)});
//		$(o).on('keydown.enter',function(e){
//			dealEnter(e);
//		});
		if(parent.needRecordTrace){
			$(o).on('keydown.delete',function(event){//only for ie,haha
				if(event.which=="8" ){
					if (document.selection){
						if (document.selection.type === "Control"){
							return true;
						}
					}
					back_keydown();
					return false;
				}else if(event.which=="46" ){
					if (document.selection){
						if (document.selection.type === "Control"){
							return true;
						}
					}
					del_keydown();
					return false;
				}else if(event.ctrlKey && event.which=="88" ){
					var t = TextareaUtils.getSelectedText();
					if (t){       
				        txtdel(document.selection.createRange());  
				        window.clipboardData.setData("Text",t);
				    }
			        return false;
				}else if(event.which=="229" ){
					return inputtxt();
				}	
			});
		}
		$(o).on("drag","a[class='selectionArea']", function(e){
			return false;
		});
				
		$(o).on("paste", function(e){
			if(parent.needRecordTrace && !inputtxt(e)) return false; 
			if(!forbidEnter())return false;
			TextareaUtils.insertText(this,getClipboard(),true,false);
			return false;
		});
		
		$(o).on("keypress.forbidEnter", function(e){
			if (parent.needRecordTrace && !inputtxt(e)) return false; 
			return forbidEnter();
		});
		
//		$(o).on("textselect",function(e){
//			showMenuAir($("#menuair"),e);
//			toolButtonFormatting("rich_editor_air",o);
//			window.setTimeout(function(){
//	            if(TextareaUtils.getSelectedText()=='')$("#menuair").hide();
//			},10);
//		}).on("textunselect",function(){
//			$("#menuair").hide();
//		});
		
		inittableindiv($(o));
		$(o).on("mouseup.imgedit","img",function(e){
	    	var offset = $(this).offset(),$that = $(this);
			$("#popupdiv").css({"top":offset.top+$(this).height()+1,"left":offset.left}).show();
			$("#popupdiv span").off("click").on("click",function(e){
				if($(this).attr("cssname")!=""){
					$that.attr("class",$(this).attr("cssname"));
				}else{
					$that.remove();
				}
				$("#popupdiv").hide();
			});
			return false;
		});
		$(o).on("mouseup.pagedel","span.horizontalrule",function(e){
	    	var offset = $(this).offset(),$that = $(this);
			$("#popupdiv2").css({"top":offset.top+$(this).height()+1,"left":offset.left}).show();
			$("#popupdiv2 span").off("click").on("click",function(e){
				$that.remove();
				$("#popupdiv2").hide();
			});
			return false;
		});
		$(o).on("click", "a[class='selectionArea'],a[class='selectionArea'] > *", function(event){
			var obj;
			if(!$(this).is("a")){
				obj = findParentByTagName( this, 'a' );
			}else{
				obj =this;
			}
			var input_id = $(obj).attr("id"); 
			if(typeof input_id == "undefined" || $("#"+input_id+"_div").length==0){
				input_id = uid();
				$(obj).attr("id",input_id);
				xCombo(input_id,null,$(obj).attr("datas"),$(obj).attr("multiselect"));
			}
			toggleDiv(input_id);
			return false;
		});
		$(o).on("mousedown.undo", function(event){
	  		if(isBlur){
	  			isBlur=false;
	  			//$("#cursorbug").focus();
	  			TextareaUtils.restoreSelection();
	  		}
			if(event.which=="1" || event.which=="2" || event.which=="3" || event.which=="4" || event.which=="5" || event.which=="6" || event.which=="7" || event.which=="9"){
				if($(this).attr("id") != lastDoId) $("body").data($(this).attr("id"), $(this).html());
				if((!stack.canRedo() || (!stack.canUndo() && stack.canRedo())) && lastDoId!=-1){
					editRecord($("#"+lastDoId));
				}
				lastDoId = $(this).attr("id");
			}
			//return false; 
		});
	};
	function check(o,event){
		setLastObjInfo(o);
		if(event.which=="2" || event.which=="3" || event.which=="4" || event.which=="5" || event.which=="6" || event.which=="7" || event.which=="9"){
			return false; 
		}
		//$("#menuair").hide();
		me=o;
		window.clearTimeout(ajaxTime);
		ajaxTime = window.setTimeout(function(){
			toolButtonFormatting($("#rich_editor_fix"),me);
			if(event.which!="1" && (!event.metaKey && event.keyCode != 90 && event.keyCode != 89)){
				editRecord($(me));
			}
			generalinput();
			if($.browser.msie){
				var range = document.selection.createRange();
				if (range.item && range.text!="")return false;
				var selectionParent  =range.parentElement();
				if(selectionParent.tagName=="BODY" || (selectionParent.tagName=="A" && $(selectionParent).hasClass("selectionArea"))) return false;
				if($(selectionParent).parents("a[class='selectionArea']").length>0)return false;
				if(selectionParent.innerText.indexOf("/") >= 0){
					var txtrng=document.body.createTextRange();
					var sel = txtrng.duplicate();
					sel.setEndPoint("EndToEnd", range);	
					var rangecopy1 = range.duplicate();
					var oldSelectionParent = rangecopy1.parentElement();
					var movei=0;
					//console.log(oldSelectionParent.tagName);
					while (rangecopy1.parentElement() == oldSelectionParent ) {
						//console.log(rangecopy.parentElement().tagName);
						rangecopy1.moveEnd( 'character', -1);
						movei++;
					}
					//console.log(movei);
					if(movei==1) return false;
					var selHtmlstr = sel.htmlText;
					//console.log("selHtmlstr:"+selHtmlstr+"|");
					if(selHtmlstr=="")return false;
					var m1 = selHtmlstr.match(/((<\/([^>]+)>){1,})/gi);
					var lastm1 = m1[m1.length-1];
					selHtmlstr = selHtmlstr.slice(0,-lastm1.length);
					var m2 = selHtmlstr.match(/((<([^>]+)>){1,})/gi);
					var lastm2 =  m2[m2.length-1];
					//console.log("lastm1:"+lastm1+"===lastm2:"+lastm2);
					var lastm2index = selHtmlstr.lastIndexOf(lastm2);
					selHtmlstr = selHtmlstr.slice(lastm2index+lastm2.length-1);
					var movecharnum = selHtmlstr.length>20?20:selHtmlstr.length;
					sel.collapse(false);		
					sel.moveStart("character", -movecharnum);
					if(sel.text.replace(/(\r\n|\r)/g,"")=="")return false;;
					//console.log(encodeURIComponent(sel.text)+":"+sel.text);
					var rangecopy2 = range.duplicate(),xyh;
					if(sel.text.slice(-1)=="/"){
						rangecopy2.moveEnd( 'character', -1);
						xyh = TextareaUtils.getSelectionPosition(rangecopy2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请先输入数字编号（默认常用语）：<br/>1—常用语；<br/>2—ICD-10诊断；<br/>3—医嘱；<br/>4—损伤原因；");
					}else if(sel.text.slice(-2)=="/1"){
						rangecopy2.moveEnd( 'character', -2);
						xyh = TextareaUtils.getSelectionPosition(rangecopy2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入常用语代码或名称检索");
					}else if(sel.text.slice(-2)=="/2"){
						rangecopy2.moveEnd( 'character', -2);
						xyh = TextareaUtils.getSelectionPosition(rangecopy2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入诊断拼音代码或名称检索");
					}else if(sel.text.slice(-2)=="/3"){
						rangecopy2.moveEnd( 'character', -2);
						xyh = TextareaUtils.getSelectionPosition(rangecopy2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入医嘱拼音代码检索");
					}else{
						var m;
						if((m = sel.text.match(/\/[1234][^\/\s]{1,21}$/g)) && (m = m[0]) && /^\/[a-zA-Z0-9\u4e00-\u9fa5_]+$/.test(m) && !/\s/.test(m)){
							at['len']=m.length;
							rangecopy2.moveEnd( 'character', -at['len']);
							xyh = TextareaUtils.getSelectionPosition(rangecopy2);
							at['x'] = xyh.x;
							at['y'] = xyh.y;
							at['h'] = xyh.h;
							m = m.slice(1);
							at['m'] = m.slice(1);
							at['mark'] = m.slice(0,1);
							tipShow();
						}else if((m = sel.text.match(/\/[^\/\s]{1,20}$/g)) && (m = m[0]) && /^\/[a-zA-Z0-9\u4e00-\u9fa5_]+$/.test(m) && !/\s/.test(m)){
							at['len']=m.length;
							rangecopy2.moveEnd( 'character', -at['len']);
							xyh = TextareaUtils.getSelectionPosition(rangecopy2);
							at['x'] = xyh.x;
							at['y'] = xyh.y;
							at['h'] = xyh.h;
							at['m'] = m.slice(1);
							at['mark'] = "1";
							tipShow();
						}
					}
				}
			}else{
				var selection = window.getSelection();
				if(selection.anchorNode.nodeType!=3)return false;
				var range = selection.getRangeAt(0);
				if(range.endOffset==0)return false;
				var selectionParent  = range.commonAncestorContainer.parentNode;
				if(selectionParent.tagName=="BODY" || (selectionParent.tagName=="A" && $(selectionParent).hasClass("selectionArea"))) return false;
				if($(selectionParent).parents("a[class='selectionArea']").length>0)return false;
				var range = selection.getRangeAt(0);
				var range2 = range.cloneRange();
				var range3 = range.cloneRange();
				range2.setStart(range2.startContainer,range2.endOffset-20>0?range2.endOffset-20:0);
				var text = range2.toString();
				if(text.indexOf("/") >= 0){
					if(text.slice(-1)=="/"){
						range2.setStart(range2.startContainer,range2.endOffset-1);
						xyh = TextareaUtils.getSelectionPosition(range2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请先输入数字编号（默认常用语）：<br/>1—常用语；<br/>2—ICD-10诊断；<br/>3—医嘱；<br/>4—损伤原因；");
					}else if(text.slice(-2)=="/1"){
						range2.setStart(range2.startContainer,range2.endOffset-2);
						xyh = TextareaUtils.getSelectionPosition(range2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入常用语代码或名称检索");
					}else if(text.slice(-2)=="/2"){
						range2.setStart(range2.startContainer,range2.endOffset-2);
						xyh = TextareaUtils.getSelectionPosition(range2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入诊断拼音代码或名称检索");
					}else if(text.slice(-2)=="/3"){
						range2.setStart(range2.startContainer,range2.endOffset-2);
						xyh = TextareaUtils.getSelectionPosition(range2);
						at['x'] = xyh.x;
						at['y'] = xyh.y;
						at['h'] = xyh.h;
						showTipGuide("请输入医嘱拼音代码检索");
					}else{
						var m;
						if((m = text.match(/\/[1234][^\/\s]{1,21}$/g)) && (m = m[0]) && /^\/[a-zA-Z0-9\u4e00-\u9fa5_]+$/.test(m) && !/\s/.test(m)){
							at['len']=m.length;
							range2.setStart(range2.startContainer,range2.endOffset-at['len']);
							xyh = TextareaUtils.getSelectionPosition(range2);
							at['x'] = xyh.x;
							at['y'] = xyh.y;
							at['h'] = xyh.h;
							m = m.slice(1);
							at['m'] = m.slice(1);
							at['mark'] = m.slice(0,1);
							tipShow();
						}else if((m = sel.text.match(/\/[^\/\s]{1,20}$/g)) && (m = m[0]) && /^\/[a-zA-Z0-9\u4e00-\u9fa5_]+$/.test(m) && !/\s/.test(m)){
							at['len']=m.length;
							rangecopy2.moveEnd( 'character', -at['len']);
							xyh = TextareaUtils.getSelectionPosition(rangecopy2);
							at['x'] = xyh.x;
							at['y'] = xyh.y;
							at['h'] = xyh.h;
							at['m'] = m.slice(1);
							at['mark'] = "1";
							tipShow();
						}
					}
				}
			}
		},250);
	}
	function tipShow(){
		if(searchedm ==at['mark'] && searched == at['m']){tipBuild();}
		else{
			var jsonurl;
			if(at['mark']=="1"){
				jsonurl = "emr/get_words.htm";
			}else if(at['mark']=="2"){
				jsonurl = "emr/get_icd10.htm";
			}else if(at['mark']=="3"){
				jsonurl = "inhosadvice/getMedList.htm";
			}else if(at['mark']=="4"){
				jsonurl = "emr/get_icd_ss.htm";//损伤原因
			}else{
				return false;
			}
			if((at['mark']=="2" || at['mark']=="3") && $('#'+opts.tip).data(at['mark']+at['m'])!=null){
				generateHtml($('#'+opts.tip).data(at['mark']+at['m']));
			}else{
				$.ajax({
					type:"get",
					cache: false,
					async: false,
					dataType:"json",
					url:jsonurl,
					data: {code:encodeURI(at['m'])},
					success: function(data){
						if((at['mark']=="2" || at['mark']=="3" || at['mark']=="4"))$('#'+opts.tip).data(at['mark']+at['m'],data);
						generateHtml(data);
					},
					error:function(){
						alert("系统错误");
					}
				});
			}
		}
	}
	
	function generateHtml(data){
		var str =[],i=0,data_length = data.length;
		if(at['mark']=="1"){
			for (; i<data_length; i+=1) {
				str.push("<tr wordid=\"",data[i].wordid,"\"><td align=\"left\" class=\"td1\">",data[i].wordname,"</td><td align=\"right\" class=\"td2\">（<b>/</b>",highlight(data[i].wordcode,at['m']),"-",data[i].permission,"）</td></tr>");
			}
		}else if(at['mark']=="2"){
			for (; i<data_length; i+=1) {
				str.push("<tr icd=\"",data[i].contents,"（",data[i].option01,"）\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else if(at['mark']=="3"){
			for (; i<data_length; i+=1) {
				str.push("<tr med=\"",data[i].medname,data[i].spec!=null?" "+data[i].spec:"","\"><td align=\"left\" class=\"td1\">",data[i].medname,"</td><td align=\"right\" class=\"td2\">",data[i].spec!=null?data[i].spec:"","</td></tr>");
			}
		}else if(at['mark']=="4"){
			for (; i<data_length; i+=1) {
				str.push("<tr icd=\"",data[i].contents,"（",data[i].option01,"）\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else{
			return false;
		}

		if(data_length>0){
			$('#'+opts.tip).html("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tipcontent_border\" id=\""+opts.tip+"_table"+"\">"+str.join("")+"</table>");
			if(i>6){//super 7 row scroll
				$("#"+opts.tip+"_table").removeClass("tipcontent_border");
				if ($.browser.msie){
					$("#"+opts.tip).css("display","block").height(150).width($("#"+opts.tip+"_table").width()+17).addClass("tipcontent_border").css("display","none");
				}else{
					$("#"+opts.tip).css("display","block").height(150).width($("#"+opts.tip+"_table").width()+34).addClass("tipcontent_border").css("display","none");
				}
			}else{
				$("#"+opts.tip).removeClass("tipcontent_border");
				$("#"+opts.tip).css("display","block").css("height","").width($("#"+opts.tip+"_table").width()+4).css("display","none");	
			}
			searched=at['m'];
			searchedm=at['mark'];
			tipBuild();
		}
	
	}
	
    function highlight(txt, search) {
        return txt.replace(search, '<b>' + search + '</b>');
    }
	function tipHidd(){
		$('#'+opts.tip).hide();
		setTimeout(function(){
			$(me).off('keydown.shortcut').on('keyup.shortcut mouseup.shortcut',function(event){check(me,event)});
		}, 400);
		flag=0;
	}
	function generalinput(){
		if($('#'+opts.tip).css("display")=="block"){
			window.clearTimeout(tt);
			tt = window.setTimeout(tipHidd,10);
		}else{
			$('#tipGuide').hide();
		}
	}
	function tipBuild(){
		window.clearTimeout(tt);
		flag=0;
		var left = at['x'];
		var leftedge = $(document).width()-left;
		var optswidth = $('#'+opts.tip).width();
		if (leftedge < optswidth)
			left = $(document).scrollLeft() + left-(optswidth-leftedge+1);
		else				
			left = $(document).scrollLeft() + left;	
		$('#'+opts.tip).css({'top':at['y']+at['h']+$(document).scrollTop(),'left':left}).show();
		//$("#menuair").hide();
		$('#'+opts.tip+' tr').off().mouseover(function(){
			$(this).addClass(opts.tipOver).siblings().removeClass();
			flag=$('#'+opts.tip+' tr').index(this);
		}).click(function(){
			if(at['mark']=="1"){
				$.ajax({
					type:"post",
					cache: false,
					url:"emr/get_word_content.htm",
					data: "wordid="+$(this).attr("wordid")+"&inpno="+parent.$("#inpno").val()+"&dtmainid="+parent.$("#dtmainid").val()+"&t="+parent.$("#emrmode").val(),
					success: function(msg){
						TextareaUtils.insertHtml(me,msg,true,null,-at['len']);
						tipHidd();
					},
					error:function(){
						alert("系统错误");
					}
				});
			}else if(at['mark']=="2"){
				TextareaUtils.insertHtml(me,$(this).attr("icd"),true,null,-at['len']);
				tipHidd();
			}else if(at['mark']=="3"){
				TextareaUtils.insertHtml(me,$(this).attr("med"),true,null,-at['len']);
				tipHidd();
			}else{
				return false;
			}
		});
		keyMoveTo(0);
		$(me).off('keyup.shortcut mouseup.shortcut').on('keydown.shortcut',function(e){return keyMove(e);});
	}
	
	function showTipGuide(tip){
		$("#tipGuide").html(tip).css({'top':at['y']+at['h']+$(document).scrollTop(),'left':$(document).scrollLeft()+at['x']}).show();
	}	
	function keyMove(e){
		var dllength = $('#'+opts.tip+' tr').length;
		if(e.which=="38"){
			flag -= 1;
			if(flag < 0) flag=dllength-1;
			keyMoveTo(flag,dllength);
			return false;
		}
		if(e.which=="40"){
			flag += 1;
			if(flag >= dllength) flag=0;
			keyMoveTo(flag,dllength);
			return false;
		}
		if(e.which=="13"){
			if(at['mark']=="1"){
				var ajaxPass = true,txt="";
				$.ajax({
					type:"post",
					cache: false,
					async : false,  
					url:"emr/get_word_content.htm",
					data: "wordid="+$('#'+opts.tip+' tr').eq(flag).attr("wordid")+"&inpno="+parent.$("#inpno").val()+"&dtmainid="+parent.$("#dtmainid").val()+"&t="+parent.$("#emrmode").val(),
					success: function(msg){
						txt = msg;
					},
					error:function(){
						alert("系统错误");
						ajaxPass = false;
					}
				});
				if(ajaxPass){
					TextareaUtils.insertHtml(me,txt,null,null,-at['len']);
					tipHidd();
				}
			}else if(at['mark']=="2"){	
				TextareaUtils.insertHtml(me,$('#'+opts.tip+' tr').eq(flag).attr("icd"),null,null,-at['len']);
				tipHidd();
			}else if(at['mark']=="3"){	
				TextareaUtils.insertHtml(me,$('#'+opts.tip+' tr').eq(flag).attr("med"),null,null,-at['len']);
				tipHidd();
			}
			return false;
		}
		if(e.which!="3" && e.which!="40" && e.which!="13"){
			generalinput();
		}
		return true;
	}
	function keyMoveTo(i,length){
		$('#'+opts.tip+' tr').removeClass().eq(i).addClass(opts.tipOver);
		if(i>5 || ((length-5)>i+1 ||(i==length-1))){
			$('#'+opts.tip).scrollTop(25*(i-5));//3 center to scroll, dl height 25px
		}else if(i==0){
			$('#'+opts.tip).scrollTop(0);
		}
	}
})(jQuery);


(function($) {
	var tt=ajaxTime=-1,searched,searchedm,flag=0,me,at={},opts={tip:"inputTip",tipOver:"over"};
 	$.fn.inputSuggest = function(a,b){
		if($('#'+opts.tip).length==0)$('body').append('<div id=\"'+opts.tip+'\"></div>');
		return init(this.get(0),a,b);
	};
	function init(o,a,b){
		$(o).on('keyup.inputSuggest mouseup.inputSuggest',function(event){check(o,event,a,b)});
	};	
	function check(o,event,a,b){
		if((event.which=="1" || event.which=="2" || event.which=="3" || event.which=="4" || event.which=="9") && $(o).val()!="")return false;
		me=o;
		opts.a=a;
		opts.b=b;
		window.clearTimeout(ajaxTime);
		ajaxTime = window.setTimeout(function(){
			generalinput();
			var left = getLeft(me),
			top = getTop(me)+me.offsetHeight+1;
			at['x'] = left;
			at['y'] = top;
			if($(me).val()==""){
				if(opts.a=="1"){
					showTipGuide("请输入诊断拼音代码或名称后敲回车（Enter）检索");
				}if(opts.a=="2"){
					showTipGuide("请输入手术拼音代码或名称后敲回车（Enter）检索");
				}if(opts.a=="3"){
					showTipGuide("请输入医师拼音代码或名称后敲回车（Enter）检索");
				}if(opts.a=="4"){
					showTipGuide("请输入损伤中毒原因拼音代码后敲回车（Enter）检索");
				}else{
					return false;
				}
			}else{
				if(event.which=="13"){
					at['m'] = $(me).val();
					if(opts.a=="1"){
						at['mark'] = "1";
						tipShow();
					}if(opts.a=="2"){
						at['mark'] = "2";
						tipShow();
					}if(opts.a=="3"){
						at['mark'] = "3";
						tipShow();
					}if(opts.a=="4"){
						at['mark'] = "4";
						tipShow();
					}else{
						return false;
					}
				}
			}
		},250);
	}
	function tipShow(){
		if(searchedm ==at['mark'] && searched == at['m']){tipBuild();}
		else{
			var jsonurl;
			if(at['mark']=="1"){
				jsonurl = "emr/get_icd10.htm";
			}else if(at['mark']=="2"){
				jsonurl = "emr/get_icd9.htm";
			}else if(at['mark']=="3"){
				jsonurl = "emr/get_doctor.htm";
			}else if(at['mark']=="4"){
				jsonurl = "emr/get_icd_ss.htm";
			}else{
				return false;
			}
			if((at['mark']=="1") && $('#'+opts.tip).data(at['mark']+at['m'])!=null){
				generateHtml($('#'+opts.tip).data(at['mark']+at['m']));
			}
			if((at['mark']=="2") && $('#'+opts.tip).data(at['mark']+at['m'])!=null){
				generateHtml($('#'+opts.tip).data(at['mark']+at['m']));
			}
			if((at['mark']=="4") && $('#'+opts.tip).data(at['mark']+at['m'])!=null){
				generateHtml($('#'+opts.tip).data(at['mark']+at['m']));
			}
			if((at['mark']=="3") && $('#'+opts.tip).data(at['mark']+at['m'])!=null){
				generateHtml($('#'+opts.tip).data(at['mark']+at['m']));
			}else{
				$.ajax({
					type:"get",
					cache: false,
					async: false,
					dataType:"json",
					url:jsonurl,
					data: {code:encodeURI(at['m'])},
					success: function(data){
						if(at['mark']=="1")$('#'+opts.tip).data(at['mark']+at['m'],data);
						generateHtml(data);
						if(at['mark']=="2")$('#'+opts.tip).data(at['mark']+at['m'],data);
						generateHtml(data);
						if(at['mark']=="3")$('#'+opts.tip).data(at['mark']+at['m'],data);
						generateHtml(data);
						if(at['mark']=="4")$('#'+opts.tip).data(at['mark']+at['m'],data);
						generateHtml(data);
					},
					error:function(){
						alert("系统错误");
					}
				});
			}
		}
	}
	function generateHtml(data){
		var str =[],i=0,data_length = data.length;
		if(at['mark']=="1"){
			for (; i<data_length; i+=1) {
				str.push("<tr icdname=\"",data[i].contents,"\" icdcode=\"",data[i].option01,"\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else if(at['mark']=="2"){
			for (; i<data_length; i+=1) {
				str.push("<tr icd9name=\"",data[i].contents,"\" icd9code=\"",data[i].option01,"\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else if(at['mark']=="3"){
			for (; i<data_length; i+=1) {
				str.push("<tr doctorname=\"",data[i].contents,"\" doctorid=\"",data[i].option01,"\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else if(at['mark']=="4"){
			for (; i<data_length; i+=1) {
				str.push("<tr icdssname=\"",data[i].contents,"\" icdsscode=\"",data[i].option01,"\"><td align=\"left\" class=\"td1\">",data[i].contents,"</td><td align=\"right\" class=\"td2\">（",data[i].option01,"）</td></tr>");
			}
		}else{
			return false;
		}
		if(data_length>0){
			$('#'+opts.tip).html("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tipcontent_border\" id=\""+opts.tip+"_table"+"\">"+str.join("")+"</table>");
			if(i>6){//super 7 row scroll
				$("#"+opts.tip+"_table").removeClass("tipcontent_border");
				if ($.browser.msie){
					$("#"+opts.tip).css("display","block").height(150).width($("#"+opts.tip+"_table").width()+17).addClass("tipcontent_border").css("display","none");
				}else{
					$("#"+opts.tip).css("display","block").height(150).width($("#"+opts.tip+"_table").width()+34).addClass("tipcontent_border").css("display","none");
				}
			}else{
				$("#"+opts.tip).removeClass("tipcontent_border");
				$("#"+opts.tip).css("display","block").css("height","").width($("#"+opts.tip+"_table").width()+4).css("display","none");	
			}
			searched=at['m'];
			searchedm=at['mark'];
			tipBuild();
		}
	
	}
    function highlight(txt, search) {
        return txt.replace(search, '<b>' + search + '</b>');
    }
	function tipHidd(){
		$('#'+opts.tip).hide();
		setTimeout(function(){
			$(me).off('keydown.inputSuggest').on('keyup.inputSuggest mouseup.inputSuggest',function(event){check(me,event,opts.a,opts.b)});
		}, 400);
		flag=0;
	}
	function generalinput(){
		if($('#'+opts.tip).css("display")=="block"){
			window.clearTimeout(tt);
			tt = window.setTimeout(tipHidd,10);
		}else{
			$('#tipGuide').hide();
		}
	}
	function tipBuild(){
		window.clearTimeout(tt);
		flag=0;
		var left = at['x'];
		var leftedge = $(document).width()-left;
		var optswidth = $('#'+opts.tip).width();
		if (leftedge < optswidth)
			left = $(document).scrollLeft() + left-(optswidth-leftedge+1);
		else				
			left = $(document).scrollLeft() + left;	
		$('#'+opts.tip).css({'top':at['y']+"px",'left':left+"px"}).show();
		//$("#menuair").hide();
		$('#'+opts.tip+' tr').off().mouseover(function(){
			$(this).addClass(opts.tipOver).siblings().removeClass();
			flag=$('#'+opts.tip+' tr').index(this);
		}).click(function(){
			if(at['mark']=="1"){
				$(me).val($(this).attr("icdname"));
				if(opts.b!=""){
					$("#"+opts.b).val($(this).attr("icdcode"));
				}
				tipHidd();
			}else if(at['mark']=="2"){
				$(me).val($(this).attr("icd9name"));
				if(opts.b!=""){
					$("#"+opts.b).val($(this).attr("icd9code"));
				}
				tipHidd();
			}else if(at['mark']=="3"){
				$(me).val($(this).attr("doctorname"));
				//$(me).parent.append('<img src="qmimgs/'+$(this).attr("doctorid")+'.jpg" height="50" width="100" />');
				//if(opts.b!=""){
				//	$("#"+opts.b).val($(this).attr("doctorid"));
				//}
				tipHidd();
			}else if(at['mark']=="4"){
				$(me).val($(this).attr("icdssname"));
				if(opts.b!=""){
					$("#"+opts.b).val($(this).attr("icdsscode"));
				}
				tipHidd();
			}else{
				return false;
			}
		});
		keyMoveTo(0);
		$(me).off('keyup.inputSuggest mouseup.inputSuggest').on('keydown.inputSuggest',function(e){return keyMove(e);});
	}
	
	function showTipGuide(tip){
		$("#tipGuide").html(tip).css({'top':at['y']+"px",'left':at['x']+"px"}).show();
	}	
	function keyMove(e){
		var dllength = $('#'+opts.tip+' tr').length;
		if(e.which=="38"){
			flag -= 1;
			if(flag < 0) flag=dllength-1;
			keyMoveTo(flag,dllength);
			return false;
		}
		if(e.which=="40"){
			flag += 1;
			if(flag >= dllength) flag=0;
			keyMoveTo(flag,dllength);
			return false;
		}
		if(e.which=="13"){
			if(at['mark']=="1"){	
				$(me).val($('#'+opts.tip+' tr').eq(flag).attr("icdname"));
				if(opts.b!=""){
					$("#"+opts.b).val($('#'+opts.tip+' tr').eq(flag).attr("icdcode"));
				}
				tipHidd();
			}
			if(at['mark']=="2"){	
				$(me).val($('#'+opts.tip+' tr').eq(flag).attr("icd9name"));
				if(opts.b!=""){
					$("#"+opts.b).val($('#'+opts.tip+' tr').eq(flag).attr("icd9code"));
				}
				tipHidd();
			}
			if(at['mark']=="3"){	
				$(me).val($('#'+opts.tip+' tr').eq(flag).attr("doctorname"));
				//if(opts.b!=""){
				//	$("#"+opts.b).val($('#'+opts.tip+' tr').eq(flag).attr("icd9code"));
				//}
				tipHidd();
			}
			if(at['mark']=="4"){	
				$(me).val($('#'+opts.tip+' tr').eq(flag).attr("icdssname"));
				if(opts.b!=""){
					$("#"+opts.b).val($('#'+opts.tip+' tr').eq(flag).attr("icdsscode"));
				}
				tipHidd();
			}
			return false;
		}
		if(e.which!="38" && e.which!="40"){
			generalinput();
		}
		return true;
	}
	function keyMoveTo(i,length){
		$('#'+opts.tip+' tr').removeClass().eq(i).addClass(opts.tipOver);
		if(i>5 || ((length-5)>i+1 ||(i==length-1))){
			$('#'+opts.tip).scrollTop(25*(i-5));//3 center to scroll, dl height 25px
		}else if(i==0){
			$('#'+opts.tip).scrollTop(0);
		}
	}
})(jQuery);

(function ($) {
    $.fn.dwseeTopBottomMenu = function (options) {
        var settings = $.extend({
            'menucontainer': '.TopBottomMenu',
            'boxsize': 40,
            'boxbackground': '#ffffff',
            'position': 'right',
            'topicon': 'img/emr/up_arrow.png',
            'bottomicon': 'img/emr/down_arrow.png'
        }, options);
        $('body').prepend('<div id="top-bottom-menu"><div id="dstbm-top"></div><div id="dstbm-bottom"></div></div>');
        $(settings.menucontainer).clone().appendTo('#dstbmmenu');
        $(settings.menucontainer).hide();
        $("#dstbmmenu > " + settings.menucontainer).css("display", "block");
        $("#top-bottom-menu").css("height", settings.boxsize + "px").css("bottom", (settings.boxsize * 2) + 10 + "px").css("line-height", settings.boxsize + "px").css(settings.position, "10px");
        $("#top-bottom-menu #dstbm-top").css("height", settings.boxsize + "px").css("width", settings.boxsize + "px").css(settings.position, "0").css("background", "url('" + settings.topicon + "') center center no-repeat").css("background-color", settings.boxbackground);
        $("#top-bottom-menu #dstbm-bottom").css("height", settings.boxsize + "px").css("width", settings.boxsize + "px").css(settings.position, "0").css("top", (settings.boxsize) + 4 + "px").css("background", "url('" + settings.bottomicon + "') center center no-repeat").css("background-color", settings.boxbackground);
		$(window).scroll(function () {
            var pos = $(window).height() / 2;
            if ($(window).scrollTop() > 200) {
                $("#dstbm-top").fadeIn("slow")
            } else {
                $("#dstbm-top").fadeOut("slow")
            }
            if (($(window).height() + $(window).scrollTop()) >= $(document).height()) {
                $("#dstbm-bottom").fadeOut("slow")
            } else {
                $("#dstbm-bottom").fadeIn("slow")
            }
        });
        $("#dstbm-top").click(function () {
            $('html, body').animate({
                scrollTop: '0'
            })
        });
        $("#dstbm-bottom").click(function () {
            $('html, body').animate({
                scrollTop: $("body").height()
            })
        });

    }
})(jQuery);