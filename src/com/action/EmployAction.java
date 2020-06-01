package com.action;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.SalaryDto;
import com.entity.Allot;
import com.entity.Employ;
import com.entity.Orders;
import com.service.AllotService;
import com.service.EmployService;
import com.service.OrdersService;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/employ", produces = "text/plain;charset=utf-8")
public class EmployAction extends BaseAction {
	// 注入Service 由于标签的存在 所以不需要getter setter
	@Autowired
	@Resource
	private EmployService employService;
	
	@Autowired
	@Resource
	private AllotService allotService;
	
	@Autowired
	@Resource
	private OrdersService ordersService;

	// 准备添加数据
	@RequestMapping("createEmploy.action")
	public String createEmploy() {
		return "admin/addemploy";
	}

	// 添加数据
	@RequestMapping("addEmploy.action")
	public String addEmploy(Employ employ) {
		this.employService.insertEmploy(employ);
		return "redirect:/employ/createEmploy.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteEmploy.action")
	public String deleteEmploy(String id) {
		this.employService.deleteEmploy(id);
		return "redirect:/employ/getAllEmploy.action";
	}

	// 批量删除数据
	@RequestMapping("deleteEmployByIds.action")
	public String deleteEmployByIds() {
		String[] ids = this.getRequest().getParameterValues("employid");
		for (String employid : ids) {
			this.employService.deleteEmploy(employid);
		}
		return "redirect:/employ/getAllEmploy.action";
	}

	// 更新数据
	@RequestMapping("updateEmploy.action")
	public String updateEmploy(Employ employ) {
		this.employService.updateEmploy(employ);
		return "redirect:/employ/getAllEmploy.action";
	}

	// 显示全部数据
	@RequestMapping("getAllEmploy.action")
	public String getAllEmploy(String number) {
		List<Employ> employList = this.employService.getAllEmploy();
		PageHelper.getPage(employList, "employ", null, null, 10, number, this.getRequest(), null);
		return "admin/listemploy";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryEmployByCond.action")
	public String queryEmployByCond(String cond, String name, String number) {
		Employ employ = new Employ();
		if (cond != null) {
			if ("realname".equals(cond)) {
				employ.setRealname(name);
			}
			if ("sex".equals(cond)) {
				employ.setSex(name);
			}
			if ("birthday".equals(cond)) {
				employ.setBirthday(name);
			}
			if ("idcard".equals(cond)) {
				employ.setIdcard(name);
			}
			if ("jiguan".equals(cond)) {
				employ.setJiguan(name);
			}
			if ("minzu".equals(cond)) {
				employ.setMinzu(name);
			}
			if ("workdate".equals(cond)) {
				employ.setWorkdate(name);
			}
			if ("contact".equals(cond)) {
				employ.setContact(name);
			}
			if ("memo".equals(cond)) {
				employ.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.employService.getEmployByLike(employ), "employ", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryemploy";
	}

	// 按主键查询数据
	@RequestMapping("getEmployById.action")
	public String getEmployById(String id) {
		Employ employ = this.employService.getEmployById(id);
		this.getRequest().setAttribute("employ", employ);
		return "admin/editemploy";
	}

	public EmployService getEmployService() {
		return employService;
	}

	public void setEmployService(EmployService employService) {
		this.employService = employService;
	}
	
	//得到工作情况
	@RequestMapping("getAllSalary.action")
	public String getAllSalary(String number) {
		double total = 0;
		SalaryDto dto2 = new SalaryDto();
		String date = VeDate.getStringDateShort();
		String d = date.substring(0, date.length() - 3);
		dto2.setDate(d);
		List<SalaryDto> salaryList = new ArrayList<>();
		List<Employ> employList = this.employService.getAllEmploy();
		for (Employ e : employList) {
			SalaryDto dto = new SalaryDto();
			dto.setEmployid(e.getEmployid());
			dto.setRealname(e.getRealname());
			dto2.setEmployid(e.getEmployid());
			List<Allot> allotList = this.allotService.getAllotByEmployid(dto2);
			dto.setCount(allotList.size());			
			for (Allot allot : allotList) {
				Orders order = new Orders();
				order.setOrdersid(allot.getOrdersid());
				List<Orders> orderList = this.ordersService.getOrdersByCond(order);
				total += Double.parseDouble(orderList.get(0).getTotal());
			}			
			dto.setAmount(total + "");
			salaryList.add(dto);
		}
		PageHelper.getSalaryPage(salaryList, "salary", null, null, 10, number, this.getRequest(), null);
		return "admin/listsalary";
	}
}
