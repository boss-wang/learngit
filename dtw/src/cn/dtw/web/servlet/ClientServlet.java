package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;
import cn.dtw.service.ClientContactService;
import cn.dtw.service.ClientService;
import cn.dtw.service.impl.ClientContactServiceImpl;
import cn.dtw.service.impl.ClientServiceImpl;
@WebServlet("/client.do")
public class ClientServlet extends BaseServlet {
	
	private ClientService clientserv = new ClientServiceImpl(); 
	private ClientService serv = new ClientServiceImpl();
	private ClientContactService clientconserv = new ClientContactServiceImpl();
	//添加客户
	protected void addClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		String clientAddress = req.getParameter("clientAddress");
		Client client = new  Client ();
		client.setClientName(clientName);
		client.setClientAddress(clientAddress);
		int  back=	serv.addClient(client);
		resp.getWriter().print(back);
	}
	//查询所有客户
	protected void showClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String currentpage=req.getParameter("currentpage");
		int rowsize = 3;
		int totalPage=clientserv.getAllTotalPage(rowsize);
		Integer curpage;
		if(currentpage!=""&&currentpage!=null) {
			curpage=Integer.parseInt(currentpage)>totalPage?totalPage:Integer.parseInt(currentpage);
			curpage=Integer.parseInt(currentpage)<=0?1:curpage;
		}else {
			curpage=new Integer(1);
		}

		req.setAttribute("totalPage", totalPage);
		req.setAttribute("curpage", curpage);
		 List<Client> list=clientserv.getAllClient(curpage, rowsize);
		req.setAttribute("list", list);
		req.getRequestDispatcher("admin/updateClient.jsp").forward(req, resp);
	}
	//修改客户
	protected void updateClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		String clientAddress = req.getParameter("clientAddress");
		String clientId = req.getParameter("clientId");
		Client client = new Client();
		client.setClientId(Integer.parseInt(clientId));
		client.setClientName(clientName);
		client.setClientAddress(clientAddress);
		int res=clientserv.getResultById(client);
		resp.getWriter().print(res);
	}
	protected void gotoUpdateClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId = req.getParameter("clientId");
		String currentpage = req.getParameter("currentpage");
		Client client = new Client();
		client.setClientId(Integer.parseInt(clientId));
		Client  clientText =  clientserv.getClienttext(client);
		req.setAttribute("currentpage", currentpage);
		req.setAttribute("clientText", clientText);
		req.getRequestDispatcher("admin/updateClientAddress.jsp").forward(req, resp);
		
	}
	//添加联系人
	protected void addClientContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId=req.getParameter("clientId");
		String userAccount=req.getParameter("userAccount");
		String userPwd=req.getParameter("userPwd");
		String qq=req.getParameter("qq");
		String email = req.getParameter("email");
		Clientcontact clientContact = new Clientcontact();
		clientContact.setClientContactName(userAccount);
		clientContact.setClientContactTel(userPwd);
		clientContact.setClientContactEmail(email);
		clientContact.setClientContactQQ(qq);
		int contactId= clientconserv.addClientContact(clientContact);
		int clientsId=Integer.parseInt(clientId);
		clientconserv.addClientidAndClientContactId(clientsId, contactId);
		 resp.getWriter().print(clientsId);
	}
	//修改联系人
	protected void updateContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String contactId=req.getParameter("contactId");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		String qq=req.getParameter("qq");
		Clientcontact clientContact  = new Clientcontact();
		clientContact.setClientContactId(Integer.parseInt(contactId));
		clientContact.setClientContactTel(tel);
		clientContact.setClientContactEmail(email);
		clientContact.setClientContactQQ(qq);
		int back= clientconserv.updateClientContact(clientContact);
		resp.getWriter().print(back);
	}
	//删除联系人
	protected void deleContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId =req.getParameter("clientId");
		String contactId=req.getParameter("contactId");
		Client_clientcontact client_contact = new Client_clientcontact();
		client_contact.setClientId(Integer.parseInt(clientId));
		client_contact.setClientContactId(Integer.parseInt(contactId));
		int back =clientconserv.deleClientContact(client_contact);
		resp.getWriter().print(back);
	}
	//删除客户
	protected void delclient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId=req.getParameter("clientId");
		Client client = new Client();
		client.setClientId(Integer.parseInt(clientId));
		int back=clientserv.deleClient(client);
		resp.getWriter().print(back);
	}

		
}