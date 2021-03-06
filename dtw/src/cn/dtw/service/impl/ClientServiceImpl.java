package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.ClientDao;
import cn.dtw.dao.customerdao.Customer_ClientDao;
import cn.dtw.dao.customerdao.impl.Customer_ClientDaoImpl;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.dao.impl.ClientDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.service.ClientService;
import cn.dtw.service.customerservice.ClienttempService;
import cn.dtw.service.customerservice.impl.ClientTempServiceImpl;

public class ClientServiceImpl implements ClientService {
	private ClientDao clientDao = new ClientDaoImpl();
	private ClientContactDaoImpl clientContact = new ClientContactDaoImpl();
	private Customer_ClientDao customer_ClientDao=new Customer_ClientDaoImpl();
	private  ClienttempService  clienttempService=new  ClientTempServiceImpl();
	@Override
	public List<Client> getAllClient() {
		return clientDao.getAllClient();
	}
	@Override
	public List<Client> getAllClient(int currentPage, int rowsize) {
		int startPage = (currentPage-1)*rowsize;
		
		return clientDao.getAllClient(startPage, rowsize);
	}
	@Override
	public int getAllTotalPage(int rowsize) {
		int totalPage=0;
		int alltotal=clientDao.getAllTotalClient();
		if((alltotal%rowsize)==0) {
			totalPage=(alltotal/rowsize);
		}else if(alltotal%rowsize!=0) {
			totalPage=(alltotal/rowsize)+1;
		}
		return totalPage;
	}
	@Override
	public Client getClienttext(Client client) {
		return clientDao.getClienttext(client);
	}
	@Override
	public int getResultById(Client client) {
		return clientDao.getResultById(client);
	}
	@Override
	public int addClient(Client client) {
		
		return clientDao.addClient(client);
	}
	//模糊查询客户名
	@Override
	public List<Client> getClientByName(String clientName) {
		return clientDao.getClientByName(clientName);
	}
	//删除客户
	@Override
	public int deleClient(Client client) {
		List<Customer_client> customerIds=customer_ClientDao.getCustomerIdByClient(client);
		//解绑
		for(Customer_client customerId:customerIds) {
			Customer customer = new Customer();
			customer.setId(customerId.getCustomerId());
			clienttempService.unbindingClientByCustomerId(customer);
		}
		int m=clientDao.deleClientById(client);
		
		List<Client_clientcontact> list= clientContact.getAllContactIdByClientId(client);
		for(Client_clientcontact contactId:list) {
			clientContact.deleClientContact(contactId);
//			contactId.setClientId(client.getClientId());
//			clientContact.deleClientIdAndClientContactId(contactId);
		}
		
		return m;
	}
	//根据公司名查询客户信息
	@Override
	public Client getClientByName(Client client) {
		return clientDao.getClientByName(client);
	}
	//搜索客户信息
	@Override
	public List<Client> searchClient(String searchContent, int currentPage, int rowsize) {
		int startPage = (currentPage-1)*rowsize;
		return clientDao.searchClient(searchContent, startPage, rowsize);
	}
	//搜索的页数
	@Override
	public int getSearchTotalPage(int rowsize,String serchContent) {
		int totalPage=0;
		int alltotal=clientDao.getSearchTotalClient(serchContent);
		if((alltotal%rowsize)==0) {
			totalPage=(alltotal/rowsize);
		}else if(alltotal%rowsize!=0) {
			totalPage=(alltotal/rowsize)+1;
		}
		return totalPage;
	}

}
