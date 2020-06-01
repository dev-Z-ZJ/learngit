$(window).load(function() {
	var loc = $("input[name='basepath']").val();
	var url = loc + "chart/chartBar.action";
	$.ajax({
		type : "post",
		url : url,
		dataType : "json",
		success : function(json) {
			var name = json.names.replace("[", "").replace("]", "").split(",");
			var val = json.count.replace("[", "").replace("]", "").split(",");
			var strName = [];
			var strCount = [];
			for (var i = 0; i < name.length; i++) {
				strName.push({
					"value" : name[i]
				});
			}
			for (var i = 0; i < val.length; i++) {
				var x = val[i].replace(/;/g, ",").split(",");
				strCount.push({
					"name" : name[i],
					"type" : 'bar',
					"data" : x
				});
			}
			var option = {
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				legend : {
					data : name
				},
				xAxis : {
					type : 'category',
					data : [ '1分', '2分', '3分', '4分', '5分' ]
				},
				yAxis : {
					type : 'value'
				},
				series : strCount
			};
			// 初始化echarts实例
			var myChart = echarts.init(document.getElementById('chartmain'));
			// 使用制定的配置项和数据显示图表
			myChart.setOption(option);
		},
		error : function() {
			alert("ajax请求发生错误3");
		}
	});
});
