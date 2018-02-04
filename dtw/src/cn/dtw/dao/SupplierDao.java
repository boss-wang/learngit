package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Supplier;

public interface SupplierDao {
	//通过公司名查询公司信息
	public Supplier getSupplierByName(Supplier supplier);
	//添加供应商
	public boolean addSupplier(Supplier supplier);
	//查询分页供应商
	public List<Supplier> getPageSupplier(int startRow,int pageSize);
	//获得总记录条数
	public int getTotalRowOfSupplier();
	//通过id查询供应商信息
	public Supplier getSupplierById(Supplier supplier);
	//查询除本身外，是否有重名的供应商,没有返回true，有则返回false
	public boolean isExistSupplier(Supplier supplier);
	//修改供应商
	public boolean updateSupplier(Supplier supplier);
}
