package com.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.AllotDAO;
import com.dto.SalaryDto;
import com.entity.Allot;
import com.service.AllotService;

@Service("allotService")
public class AllotServiceImpl implements AllotService {
	@Autowired
	@Resource
	private AllotDAO allotDAO;

	@Override // 继承接口的新增 返回值0(失败),1(成功)
	public int insertAllot(Allot allot) {
		return this.allotDAO.insertAllot(allot);
	}

	@Override // 继承接口的更新 返回值0(失败),1(成功)
	public int updateAllot(Allot allot) {
		return this.allotDAO.updateAllot(allot);
	}

	@Override // 继承接口的删除 返回值0(失败),1(成功)
	public int deleteAllot(String allotid) {
		return this.allotDAO.deleteAllot(allotid);
	}

	@Override // 继承接口的查询全部
	public List<Allot> getAllAllot() {
		return this.allotDAO.getAllAllot();
	}

	@Override // 继承接口的按条件精确查询
	public List<Allot> getAllotByCond(Allot allot) {
		return this.allotDAO.getAllotByCond(allot);
	}

	@Override // 继承接口的按条件模糊查询
	public List<Allot> getAllotByLike(Allot allot) {
		return this.allotDAO.getAllotByLike(allot);
	}

	@Override // 继承接口的按主键查询 返回Entity实例
	public Allot getAllotById(String allotid) {
		return this.allotDAO.getAllotById(allotid);
	}

	@Override
	public List<Allot> getAllotByEmployid(SalaryDto dto) {
		return this.allotDAO.getAllotByEmployid(dto);
	}

}
