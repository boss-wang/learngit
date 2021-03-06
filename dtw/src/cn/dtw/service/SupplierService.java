package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Supplier;

public interface SupplierService {
	//通过公司名查询公司信息
	public Supplier getSupplierByName(Supplier supplier);
	//添加供应商
	public boolean addSupplier(Supplier supplier);
	//查询分页供应商
	public List<Supplier> getPageSupplier(int page,int pageSize);
	//搜索供应商
	public List<Supplier> searchSupplier(String searchContent,int page,int pageSize);
	//获得总记录条数
	public int getTotalRowOfSupplier();
	//获得搜索记录条数
	public int getSearchRowOfSupplier(String searchContent);
	//通过id获得供应商信息
	public Supplier getSupplierById(Supplier supplier);
	//修改供应商,若公司名存在则返回0，若修改失败返回2，修改成功返回1
	public int updateSupplier(Supplier supplier);
	//删除供应商，及其联系人
	public int delSupplier(Supplier supplier);
	//模糊查询供应商公司名
	public List<Supplier> getSupplierByName(String SupplierName);
}
