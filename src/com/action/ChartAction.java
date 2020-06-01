package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Cate;
import com.entity.Goods;
import com.entity.Orders;
import com.entity.Topic;
import com.service.CateService;
import com.service.GoodsService;
import com.service.OrdersService;
import com.service.TopicService;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/chart", produces = "text/plain;charset=utf-8")
public class ChartAction extends BaseAction {
	@Autowired
	@Resource
	private OrdersService ordersService;
	@Autowired
	@Resource
	private CateService cateService;
	@Autowired
	@Resource
	private GoodsService goodsService;
	@Autowired
	@Resource
	private TopicService topicService;

	@RequestMapping("chartline.action")
	@ResponseBody
	public String chartline() throws JSONException {
		String start = this.getRequest().getParameter("start");
		String end = this.getRequest().getParameter("end");
		long days = VeDate.getDays(end, start) + 1;
		JSONArray count = new JSONArray();
		JSONArray day = new JSONArray(); // 存放名称
		for (int i = 0; i < days; i++) {
			String nxtDay = VeDate.getNextDay(start, "" + i);
			double total = 0;
			Orders orders = new Orders();
			orders.setAddtime(nxtDay);
			List<Orders> list = this.ordersService.getOrdersByCond(orders);
			for (Orders b : list) {
				total += Double.parseDouble(b.getTotal());
			}
			count.put(total);
			day.put(nxtDay);
		}
		JSONObject json = new JSONObject();
		json.put("count", count.toString());
		json.put("days", day.toString().replaceAll("\"", ""));
		return json.toString();
	}

	@RequestMapping("chartpie.action")
	@ResponseBody
	public String chartpie() throws JSONException {
		JSONArray count = new JSONArray();
		JSONArray name = new JSONArray(); // 存放名称
		List<Goods> goodsList = this.goodsService.getAllGoods();
		for (Goods goods : goodsList) {
			name.put(goods.getGoodsname());
			count.put(Integer.parseInt(goods.getSellnum()));
		}
		JSONObject json = new JSONObject();
		json.put("count", count.toString());
		json.put("names", name.toString().replaceAll("\"", ""));
		return json.toString();
	}

	@RequestMapping("chartBar.action")
	@ResponseBody
	public String chartBar() throws JSONException {
		JSONArray name = new JSONArray();
		JSONArray count = new JSONArray();
		List<Cate> cateList = this.cateService.getAllCate();
		for (Cate cate : cateList) {
			name.put(cate.getCatename());
			int sum1 = 0;
			int sum2 = 0;
			int sum3 = 0;
			int sum4 = 0;
			int sum5 = 0;
			Topic t = new Topic();
			t.setCateid(cate.getCateid());
			List<Topic> list = this.topicService.getTopicBar(t);
			for (Topic x : list) {
				if (Integer.parseInt(x.getNum()) == 1) {
					sum1++;
				}
				if (Integer.parseInt(x.getNum()) == 2) {
					sum2++;
				}
				if (Integer.parseInt(x.getNum()) == 3) {
					sum3++;
				}
				if (Integer.parseInt(x.getNum()) == 4) {
					sum4++;
				}
				if (Integer.parseInt(x.getNum()) == 5) {
					sum5++;
				}
			}
			String sum = "" + sum1 + ";" + sum2 + ";" + sum3 + ";" + sum4 + ";" + sum5;
			System.out.println(sum);
			count.put(sum);
		}
		JSONObject json = new JSONObject();
		json.put("count", count.toString().replaceAll("\"", ""));
		json.put("names", name.toString().replaceAll("\"", ""));
		return json.toString();
	}
}
