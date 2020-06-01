package com.action;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Allot;
import com.entity.Cate;
import com.service.AllotService;
import com.entity.Orders;
import com.entity.Employ;
import com.entity.Goods;
import com.service.OrdersService;
import com.service.EmployService;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/allot", produces = "text/plain;charset=utf-8")
public class AllotAction extends BaseAction {
	// 注入Service 由于标签的存在 所以不需要getter setter
	@Autowired
	@Resource
	private AllotService allotService;
	@Autowired
	@Resource
	private OrdersService ordersService;
	@Autowired
	@Resource
	private EmployService employService;

	// 准备添加数据
	@RequestMapping("createAllot.action")
	public String createAllot(String number) {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Orders orders = new Orders();
		orders.setStatus("已付款");
		List<Orders> ordersList = new ArrayList<Orders>();
		List<Orders> tempList = this.ordersService.getOrdersByCond(orders);
		int pageNumber = tempList.size();
		int maxPage = pageNumber;
		if (maxPage % 10 == 0) {
			maxPage = maxPage / 10;
		} else {
			maxPage = maxPage / 10 + 1;
		}
		if (number == null) {
			number = "0";
		}
		int start = Integer.parseInt(number) * 10;
		int over = (Integer.parseInt(number) + 1) * 10;
		int count = pageNumber - over;
		if (count <= 0) {
			over = pageNumber;
		}
		for (int i = start; i < over; i++) {
			Orders o = tempList.get(i);
			ordersList.add(o);
		}
		String html = "";
		StringBuffer buffer = new StringBuffer();
		buffer.append("&nbsp;&nbsp;共为");
		buffer.append(maxPage);
		buffer.append("页&nbsp; 共有");
		buffer.append(pageNumber);
		buffer.append("条&nbsp; 当前为第");
		buffer.append((Integer.parseInt(number) + 1));
		buffer.append("页 &nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("首页");
		} else {
			buffer.append("<a href=\"allot/createAllot.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append("<a href=\"allot/createAllot.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append("<a href=\"allot/createAllot.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"allot/createAllot.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		this.getRequest().setAttribute("html", html);
		this.getRequest().setAttribute("ordersList", ordersList);
		List<Employ> employList = this.employService.getAllEmploy();
		this.getRequest().setAttribute("employList", employList);
		return "admin/addallot";
	}

	// 添加数据
	@RequestMapping("addAllot.action")
	public String addAllot(Allot allot) {
		allot.setAddtime(VeDate.getStringDateShort());
		allot.setStatus("进行中");
		this.allotService.insertAllot(allot);
		Orders orders = this.ordersService.getOrdersById(allot.getOrdersid());
		orders.setStatus("进行中");
		this.ordersService.updateOrders(orders);
		return "redirect:/allot/createAllot.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteAllot.action")
	public String deleteAllot(String id) {
		this.allotService.deleteAllot(id);
		return "redirect:/allot/getAllAllot.action";
	}

	// 批量删除数据
	@RequestMapping("deleteAllotByIds.action")
	public String deleteAllotByIds() {
		String[] ids = this.getRequest().getParameterValues("allotid");
		for (String allotid : ids) {
			this.allotService.deleteAllot(allotid);
		}
		return "redirect:/allot/getAllAllot.action";
	}

	// 更新数据
	@RequestMapping("updateAllot.action")
	public String updateAllot(Allot allot) {
		this.allotService.updateAllot(allot);
		return "redirect:/allot/getAllAllot.action";
	}

	@RequestMapping("over.action")
	public String over(String id) {
		Allot allot = this.allotService.getAllotById(id);
		allot.setStatus("完成");
		this.allotService.updateAllot(allot);
		Orders orders = this.ordersService.getOrdersById(allot.getOrdersid());
		orders.setStatus("完成");
		this.ordersService.updateOrders(orders);
		return "redirect:/allot/getAllAllot.action";
	}

	// 显示全部数据
	@RequestMapping("getAllAllot.action")
	public String getAllAllot(String number) {
		List<Allot> allotList = this.allotService.getAllAllot();
		PageHelper.getPage(allotList, "allot", null, null, 10, number, this.getRequest(), null);
		return "admin/listallot";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryAllotByCond.action")
	public String queryAllotByCond(String cond, String name, String number) {
		Allot allot = new Allot();
		if (cond != null) {
			if ("ordersid".equals(cond)) {
				allot.setOrdersid(name);
			}
			if ("employid".equals(cond)) {
				allot.setEmployid(name);
			}
			if ("addtime".equals(cond)) {
				allot.setAddtime(name);
			}
			if ("status".equals(cond)) {
				allot.setStatus(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.allotService.getAllotByLike(allot), "allot", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryallot";
	}

	// 按主键查询数据
	@RequestMapping("getAllotById.action")
	public String getAllotById(String id) {
		Allot allot = this.allotService.getAllotById(id);
		this.getRequest().setAttribute("allot", allot);
		List<Orders> ordersList = this.ordersService.getAllOrders();
		this.getRequest().setAttribute("ordersList", ordersList);
		List<Employ> employList = this.employService.getAllEmploy();
		this.getRequest().setAttribute("employList", employList);
		return "admin/editallot";
	}

	public AllotService getAllotService() {
		return allotService;
	}

	public void setAllotService(AllotService allotService) {
		this.allotService = allotService;
	}

}
