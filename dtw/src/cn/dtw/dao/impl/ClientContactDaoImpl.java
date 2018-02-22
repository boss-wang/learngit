package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientContactDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;

public class ClientContactDaoImpl extends BaseDao implements ClientContactDao {

	@Override
	public int addClientContact(Clientcontact clientcontact) {
		String sql = "insert into clientcontact (clientContactName,ClientContactTel,ClientContactEmail,ClientContactQQ)values(?,?,?,?)";
		return super.executeUpdateAndReturnId(sql, clientcontact.getClientContactName(),clientcontact.getClientContactTel(),clientcontact.getClientContactEmail(),clientcontact.getClientContactQQ());
	}

	@Override
	public int addClientidAndClientContactId(int clientId, int contactId) {
		String sql = "insert into client_clientcontact (clientId,clientContactId) values(?,?)";
		return super.executeUpdate(sql, clientId,contactId);
	}

	@Override
	public int updateClientContact(Clientcontact clientcontact) {
		String sql = "update clientcontact set ClientContactTel=?,ClientContactEmail=?,ClientContactQQ=? where clientContactId=?";
		return  super.executeUpdate(sql,clientcontact.getClientContactTel(),clientcontact.getClientContactEmail(),clientcontact.getClientContactQQ(),clientcontact.getClientContactId());
		
	}

	@Override
	public int deleClientContact(Client_clientcontact client_clientcontact) {
		String sql = "delete from clientcontact where clientContactId=?";
		return super.executeUpdate(sql, client_clientcontact.getClientContactId());
		
	}

	@Override
	public int deleClientIdAndClientContactId(Client_clientcontact client_clientcontact) {
		String sql = "delete from client_clientcontact where  clientId=? and clientContactId=?";
		return super.executeUpdate(sql, client_clientcontact.getClientId(),client_clientcontact.getClientContactId());
	}

	@Override
	public List<Client_clientcontact> getAllContactIdByClientId(Client client) {
		String sql = "select clientContactId from client_clientcontact where clientId=? ";
		return super.executeQuery(new BeanListHandler<Client_clientcontact>(Client_clientcontact.class), sql, client.getClientId());
		
	}
	
}
