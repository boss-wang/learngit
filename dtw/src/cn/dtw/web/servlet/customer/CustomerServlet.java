package cn.dtw.web.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Leavemessage;
import cn.dtw.service.ClientContactService;
import cn.dtw.service.ClientService;
import cn.dtw.service.LeaveMessageService;
import cn.dtw.service.customerservice.ClienttempService;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.Customer_ClientService;
import cn.dtw.service.customerservice.impl.ClientTempServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.service.customerservice.impl.Customer_ClientServiceImpl;
import cn.dtw.service.impl.ClientContactServiceImpl;
import cn.dtw.service.impl.ClientServiceImpl;
import cn.dtw.service.impl.LeaveMessageServiceImpl;
import cn.dtw.util.phone.SDKDemo;
import cn.dtw.web.servlet.BaseServlet;

@WebServlet("/customer.do")
public class CustomerServlet extends BaseServlet {

	private static final long serialVersionUID = 335282468601497196L;
	private CustomerService customerService = new CustomerServiceImpl();
	private LeaveMessageService messageService = new LeaveMessageServiceImpl();
	private ClientService clientService = new ClientServiceImpl();
	private ClientContactService clientContactService = new ClientContactServiceImpl();
	private Customer_ClientService customerClientService = new Customer_ClientServiceImpl();
	private ClienttempService clienttempService = new ClientTempServiceImpl();
	//搜索注册的客户
	protected void searchCustomerApplication(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		String searchContent = req.getParameter("serchContent");
		int currentPage;
		int totalRow = customerService.searchCustomerCount(searchContent);
		int totalPage = totalRow%5==0?totalRow/5:totalRow/5+1;
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Customer> customerList = customerService.searchCustomerList(searchContent,currentPage, 5);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("customerList", customerList);
		req.getRequestDispatcher("/admin/CustomerApplication.jsp").forward(req, resp);
	}

	//显示注册的客户
	protected void showCustomerApplication(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		int totalRow = customerService.getCustomerCount();
		int totalPage = totalRow%5==0?totalRow/5:totalRow/5+1;
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Customer> customerList = customerService.getCustomerList(currentPage, 5);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("customerList", customerList);
		req.getRequestDispatcher("/admin/CustomerApplication.jsp").forward(req, resp);
	}
	//显示留言信息
	protected void showCustomerLeaveMessage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		int rowsize=5;
		int totalPage =messageService.getAllTotalPage(rowsize);
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Leavemessage> messageList = messageService.showMessage(currentPage, rowsize);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("messageList", messageList);
		req.getRequestDispatcher("/admin/leaveMessage.jsp").forward(req, resp);
	}
	//同意绑定公司申请
	protected void passBindingCompany(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int customerId = Integer.parseInt(req.getParameter("customerId"));
		String clientName = req.getParameter("clientName");
		
		Client client = new Client();
		client.setClientName(clientName);
		client = clientService.getClientByName(client);
		Customer customer = customerService.getCustomerByid(customerId);
		//通过手机号码判断客户联系人是否存在，不存在则添加
		boolean flag = false;
		for(Clientcontact contact:client.getClientContactlist()) {
			if(contact.getClientContactTel().equals(customer.getTel())) {
				flag = true;
			};
		}
		if(!flag) {
			clientContactService.addCustomerContact(client, customer);
		}
		//绑定客户id到对应的公司id
		if(customerClientService.addCustomer_client(customer,client)) {
			if(customerService.updateCustomerStatus(customer, 3)) {
				SDKDemo.send(customer.getTel(), "恭喜，您申请绑定的公司已经通过审核！");
				resp.getWriter().print(1);
			}
		};
		resp.getWriter().close();
	}
	//绑定公司申请不通过
		protected void refuseBindingCompany(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int customerId = Integer.parseInt(req.getParameter("customerId"));
			Customer customer = customerService.getCustomerByid(customerId);
			clienttempService.delClienttempByCustomer(customer);
			if(customerService.updateCustomerStatus(customer, 4)) {
				SDKDemo.send(customer.getTel(), "抱歉，您申请绑定的公司未能通过审核，请重新选择公司进行绑定或联系我司客服人员。");
				resp.getWriter().print(1);
			}
			resp.getWriter().close();
		}
	//通过下单人id查询公司
		protected void showBindingCompany(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			String customerId=req.getParameter("customerId");
			Customer customer = new Customer();
			customer.setId(Integer.parseInt(customerId));
			Clienttemp clienttemp=  clienttempService.getClienttempByCustomer(customer);
			if(clienttemp==null) {
				resp.getWriter().print(2);
			}else {
			req.getSession().setAttribute("clienttemp", clienttemp);
			resp.getWriter().print(1);
			}
		}
		//修改个人手机号
		protected void updatePhoneNumber(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			String phonecode=req.getParameter("phonecode");
			String oldphone=req.getParameter("oldphone");
			String newphone=req.getParameter("newphone");
			String customerId=req.getParameter("customerId");
			if(phonecode.equals(req.getSession().getAttribute("contentCode"))) {
				Customer newcustomer = new Customer();
				newcustomer.setId(Integer.parseInt(customerId));
				newcustomer.setTel(newphone);
				Customer oldcustomer = new Customer();
				oldcustomer.setId(Integer.parseInt(customerId));
				oldcustomer.setTel(oldphone);
				customerService.updateCustomerPhoneByCustomer(newcustomer, oldcustomer);
				resp.getWriter().print(1);
			}else {
				resp.getWriter().print(0);
			}
		}
		//修改邮箱
		protected void updateEmail(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			String phoneNumber=req.getParameter("phoneNumber");
			String email=req.getParameter("email");
			Customer customer = new Customer();
			customer.setEmail(email);
			customer.setTel(phoneNumber);
			int back= customerService.updateEmailByCustomer(customer);
			resp.getWriter().print(back);
		}
		//解除公司绑定
		protected void unbinding(HttpServletRequest req, HttpServletResponse resp) throws IOException {
				String customerId=req.getParameter("customerId");
				Customer customer = new Customer();
				customer.setId(Integer.parseInt(customerId));
				int back= clienttempService.unbindingClientByCustomerId(customer);
				if(back==1) {
					Customer cust = customerService.getCustomerByid(customer.getId());
					req.getSession().setAttribute("customer",cust);
				}
				resp.getWriter().print(back);
		}
}
