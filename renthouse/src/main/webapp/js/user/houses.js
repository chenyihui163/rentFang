$(function(){
	//给刷选条件增加样式
    $(".shaixuan-tj span.crumb-select-item").live('hover',function(event){
        if(event.type=='mouseenter'){
            $(this).addClass("crumb-select-itemon");
        }else{
            $(this).removeClass("crumb-select-itemon");
        }
    });
    
    //移除选中的条件
    $(".shaixuan-tj span.crumb-select-item").live('click', function(event){
        event.preventDefault();
        $(this).remove();
        var TTR = $(this).find("em").text();
        $(".show-con a").each(function(){
            var TT = $(this).text();
            THI = $(this);
            THIPP = $(this).parents("dl");
            if(TTR==TT){
                THI.removeClass("nzw12");
                THIPP.css("display","block");
            }
        })
        
      //发送请求
      removeParamSendAjax();
    });
    
    //增加条件
    $(".show-con a").click(function(event){
        event.preventDefault();
        THIP = $(this).parents("dl");
        if($(this).hasClass("nzw12")){
        }else{
            $(this).addClass("nzw12");
            var zhiclass = $(this).parents("dd").siblings("dt").find("a").text();
            zhicon = $(this).text();
            tianjaneir="<span class='crumb-select-item'><a href='/'><b>"+zhiclass+"</b><em>"+zhicon+"</em><i class='icon-remove'></i></a></span>"
            $(".shaixuan-tj").children().last().after(tianjaneir);
            THIP.css("display","none");
        }
		//发送请求
        addParamSendAjax(url, zhiclass, zhicon);
    });
    $(".show-more").click(function(event){
        event.preventDefault();
        var ticon = $(this).find("i");
        tspan = $(this).find("span");
        if($(this).hasClass("zk")){
            $(this).siblings(".show-con").css("height","30px");
            ticon.removeClass("icon-angle-up");
            ticon.addClass("icon-angle-down");
            tspan.html("更多");
            $(this).removeClass("zk")
        }else{
            $(this).siblings(".show-con").css("height","auto");
            ticon.removeClass("icon-angle-down");
            ticon.addClass("icon-angle-up");
            tspan.html("收起");
            $(this).addClass("zk")
        }
    });
    $("#sxbtn").click(function(event){
        event.preventDefault();
        var xicon = $(this).find("span i");
        xspan = $(this).find("span em");
        if($(this).hasClass("zkon")){
            xspan.text("收起筛选");
            xicon.removeClass("icon-angle-down");
            xicon.addClass("icon-angle-up");
            $(".sxcon").slideDown();
            $(this).removeClass("zkon")
        }else{
            xspan.text("查看筛选");
            xicon.removeClass("icon-angle-up");
            xicon.addClass("icon-angle-down");
            $(".sxcon").slideUp();
            $(this).addClass("zkon")
        }
    });
    
    postAjavGetData(url);
})

//初始化url
function initUrl(value){
	//初始化请求链接
	return consturl;
}

//移除请求参数，发送请求
function removeParamSendAjax(){
	
	var value = '/queryHousesByCondition.action?query=1';
	if($(".crumb-select-item").length > 0){
     	//遍历已选择的条件
     	$(".crumb-select-item").each(function(){
     		if($(this).find("b").text() === "居住类型："){
     			value += "&hmethod=" + $.trim($(this).find("em").html());
     		}else if($(this).find("b").text() === "出租类型："){
     			value += "&htype=" + $.trim($(this).find("em").html());
     		}else if($(this).find("b").text() === "位置："){
     			value += "&hposition=" + $.trim($(this).find("em").html());
     		}else if($(this).find("b").text() === "价格："){
     			value += "&hprice=" + $.trim($(this).find("em").html());
     		}else if($(this).find("b").text() === "居室："){
     			value += "&hmodel=" + $.trim($(this).find("em").html());
     		}
     	});
     }
	 url = value;
	postAjavGetData(value);
}
//拼接请求参数，发送请求
function addParamSendAjax(value, name, val){
	
	if(name === '居住类型：'){
		name = 'hmethod';
	}else if(name === '出租类型：'){
		name = "htype";
	}else if(name === "位置："){
		name = "hposition";
	}else if(name === "价格："){
		name = "hprice";
	}else if(name === "居室："){
		name = "hmodel";
	}
	
	value += "&" + name + "=" + val;
	//将新的url复制给全局的url
	url = value; 
	postAjavGetData(url);
	
}

//后台请求数据, 进行分页
function postAjavGetData(value){
	 //向后台请求数据
	 $.ajax({
		 url : value,
		 data : {},
		 type : "get",
		 datatype : "json",
		 async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		 cache : false,
		 success : function(pb){
			 
			 var html = "";
			 if(pb.beanList.length == 0){
				 html = "<div class='row'>";
				 html += "</div>";
			 } else{
				 $(pb.beanList).each(function(){
					 html += "<div class='row'>";
					 html += "<div class='col-sm-1'></div>"
						 
					 html += "<div class='col-sm-10'>";
					 
					 html += "<div class='col-sm-4 col-xs-6 text-right'>";
					 html += "<a href='/skipHouseDetailPage.action?hid=" + this.hid + "'>";
					 html += "<img src='" + this.himg + "'>"
					 html += "</a>";
					 html += "</div>";
					 
					 html += "<div class='col-sm-6 col-xs-6 text-left detail'>";
					 html += "<br>";
					 html += "<p><a href='/skipHouseDetailPage.action?hid="+ this.hid + "'><span class='title'>" + this.hname + " " + this.htoward + "" + "</span></a></p>";
					 html += "<p><span>" + this.hsubway + "</span></p>";
					 html += "<p><span>" + this.harea + "|" + this.hfloor +"|" + this.hmodel + "|" + this.htoward+ "<span class='type'>";
					 
					 if(this.hmethod === '0'){
						 html += "合</span></span></p>";
					 }else if(this.hmethod === '1'){
						 html += "整</span></span></p>";
					 }
					 html += "</div>";
					 
					 html += "<div class='col-sm-2 col-xs-6'>";
					 html += "<br><br>";
					 html += "<p><span class='money'>" + this.hprice + "<span class='yuan'>元/月</span></span></span></p>";
					 html += "<br>";
					 html += "";
					 html += "</div>";
					 html += "<p><a href='/skipHouseDetailPage.action?hid=" + this.hid +"' class='btn btn-info btn-lg'>查看房间详细</a></p>"
					 
					 html += "</div>";
					 
					 html += "<div class='col-sm-1'></div>";
					 html += "</div>";
					 html += "<br>";
				 });
			 }
			 
			 //进行分页
			 var page = '<div class="row">';
			 page += '<div class="col-md-12">';
			 page += '<div class="product-pagination text-center">';
			 page += '<nav>';
			 page += '<ul class="pagination">';
			 
			 if(pb.pc == 1){
				 page += '<li><a href="javascript:void(0);">上一页</a></li>';
			 }else{
				 var value = pb.url + "&pc=" + (pb.pc-1);
				 page += '<li onclick=postAjavGetData('+ '"' + value + '"' + ')><a>上一页</a></li>';
			 }
			 
		 	/*计算页码列表的开始和结束位置，即两个变量begin和end
			计算它们需要通过当前页码！
			1. 总页数不足6页--> begin=1, end=最大页
			2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
			3. 如果begin<1，那么让begin=1，end=6
			4. 如果end>tp, 让begin=tp-5, end=tp*/
			
			var begin;
			var end;
			if(pb.tp <=6){
				begin = 1;
				end = pb.tp;
			}else{
				begin = pb.pc-2;
				end = pb.pc+3;
				if(begin < 1){
					begin = 1;
					end = 6;
				}
				if(end > pb.tp){
					end = pb.tp;
					begin = pb.tp-5;
				}
			}
			
			for(var i=begin; i <=end; i++){
				if(i== pb.pc){
					page += '<li><a href="javascript:void(0);"style="background: orange">' + i + '</a></li>';
				}else{
					var value = pb.url + "&pc=" + i;
					page += '<li onclick=postAjavGetData('+ '"' + value + '"' + ')><a>' + i + '</a></li>';
				}
			}
			
			if(end > pb.tp){
				page += '<span>...</span>';
			}
			
			if(pb.pc == pb.tp){
				page += '<li><a href="javascript:void(0);">下一页</a></li>';
			}else{
				var value = pb.url + "&pc=" + (pb.pc+1);
				page += '<li onclick=postAjavGetData('+ '"' + value + '"' + ')><a class="aBtn bold">下一页</a></li>';
			}
			
			page += '</ul>';
			page += '</nav>';
			page += '</div>';
			page += '</div>';
			page += '</div>';
			 
			 $("#house").html(html+page);
		 }
	 });
}