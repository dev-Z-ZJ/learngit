package com.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.dto.SalaryDto;
import com.entity.Allot;

@Service("allotService")
public interface AllotService {
	// 插入数据 调用allotDAO里的insertAllot配置
	public int insertAllot(Allot allot);

	// 更新数据 调用allotDAO里的updateAllot配置
	public int updateAllot(Allot allot);

	// 删除数据 调用allotDAO里的deleteAllot配置
	public int deleteAllot(String allotid);

	// 查询全部数据 调用allotDAO里的getAllAllot配置
	public List<Allot> getAllAllot();
	
	public List<Allot> getAllotByEmployid(SalaryDto dto);

	// 按照Allot类里面的字段名称精确查询 调用allotDAO里的getAllotByCond配置
	public List<Allot> getAllotByCond(Allot allot);

	// 按照Allot类里面的字段名称模糊查询 调用allotDAO里的getAllotByLike配置
	public List<Allot> getAllotByLike(Allot allot);

	// 按主键查询表返回单一的Allot实例 调用allotDAO里的getAllotById配置
	public Allot getAllotById(String allotid);

}
