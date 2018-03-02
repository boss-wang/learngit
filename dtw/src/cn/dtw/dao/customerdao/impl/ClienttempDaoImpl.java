package cn.dtw.dao.customerdao.impl;

import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.ClienttempDao;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.Customer;

public class ClienttempDaoImpl extends BaseDao implements ClienttempDao  {

	@Override
	public int addClienttemp(Clienttemp clienttemp) {
		String sql="insert into clienttemp (clientName,clientAddress) values(?,?)";
		return super.executeUpdateAndReturnId(sql, clienttemp.getClientName(),clienttemp.getClientAddress());
	}

	@Override
	public int addClienttemp_customer(Clienttemp_customer clienttemp_customer) {
		String sql="insert into clienttemp_customer (customerId,clientId,clientExists) values(?,?,?)";
		return super.executeUpdate(sql, clienttemp_customer.getCustomerId(),clienttemp_customer.getClientId(),clienttemp_customer.getClientExists());
	}
	//通过客户id查询其对应临时公司信息
	@Override
	public Clienttemp getClienttempByCustomer(Customer customer) {
		String sql = "select * from clienttemp where clienttemp.clientId=(select clientId from clienttemp_customer where customerId=? )";
		return super.executeOneRow(new BeanHandler<Clienttemp>(Clienttemp.class), sql, customer.getId());
	}

}
