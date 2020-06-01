package com.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.dto.SalaryDto;
import com.entity.Allot;

@Repository("allotDAO") // Repository标签定义数据库连接的访问 Spring中直接
public interface AllotDAO {

	/**
	 * AllotDAO 接口 可以按名称直接调用allot.xml配置文件的SQL语句
	 */

	// 插入数据 调用entity包allot.xml里的insertAllot配置 返回值0(失败),1(成功)
	public int insertAllot(Allot allot);

	// 更新数据 调用entity包allot.xml里的updateAllot配置 返回值0(失败),1(成功)
	public int updateAllot(Allot allot);

	// 删除数据 调用entity包allot.xml里的deleteAllot配置 返回值0(失败),1(成功)
	public int deleteAllot(String allotid);

	// 查询全部数据 调用entity包allot.xml里的getAllAllot配置 返回List类型的数据
	public List<Allot> getAllAllot();
	
	public List<Allot> getAllotByEmployid(SalaryDto dto);

	// 按照Allot类里面的值精确查询 调用entity包allot.xml里的getAllotByCond配置 返回List类型的数据
	public List<Allot> getAllotByCond(Allot allot);

	// 按照Allot类里面的值模糊查询 调用entity包allot.xml里的getAllotByLike配置 返回List类型的数据
	public List<Allot> getAllotByLike(Allot allot);

	// 按主键查询表返回单一的Allot实例 调用entity包allot.xml里的getAllotById配置
	public Allot getAllotById(String allotid);

}
