package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.UserDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.UserHeadSculpture;
import cn.dtw.util.MD5;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List<User> getAllUser() {
		String sql = "select * from user where userStatus=1 ";
		return super.executeQuery(new BeanListHandler<User>(User.class), sql);
	}

	@Override
	public User getUserById(User user) {
		User_roleDao userRoleDao = new User_roleDaoImpl();
		String sql = "select * from user where userId=? ";
		User userGet = super.executeOneRow(new BeanHandler<User>(User.class), sql, user.getUserId());
		List<Role> roleList = userRoleDao.getRoleByUserId(userGet);
		userGet.setRoles(roleList);
		return userGet;
	}

	@Override
	public User getUserByAccount(User user) {
		String sql = "select * from user where userAccount=?";
		return super.executeOneRow(new BeanHandler<User>(User.class), sql, user.getUserAccount());
	}

	@Override
	public boolean updateUserById(User user) {
		String sql  = "update user set userPwd=?,userName=?,userSex=? where userId=?";
		int res =	 super.executeUpdate(sql, MD5.KL(MD5.toMD5(user.getUserPwd())),user.getUserName(),user.getUserSex(),user.getUserId());
		return res>0?true:false;
	}
	//获得创建用户ID
	@Override
	public int addUser(User user) {
		String sql="insert into user(userAccount,userPwd,userName,userSex,userStatus,showPicPath) values(?,?,?,?,1,'img/headsculpture/view.jpg')";
		int id = super.executeUpdateAndReturnId(sql, user.getUserAccount(),MD5.KL(MD5.toMD5(user.getUserPwd())),user.getUserName(),user.getUserSex());
		String sql2 ="insert into userheadsculpture (userId,picturepath) values(?,?)";
		 super.executeUpdate(sql2, id,"img/headsculpture/view.jpg");
		return id;
	}
	//分页查询用户
	@Override
	public List<User> getAllUser(int start, int rowsize) {
		User_roleDao userRoleDao = new User_roleDaoImpl();
		String sql = "select * from user where userStatus=1 order by userId desc limit ?,?";
		List<User> list = super.executeQuery(new BeanListHandler<User>(User.class), sql, start,rowsize);
		List<User> userList = new ArrayList<User>();
		for(User user:list) {
			//获得用户的职位信息
			List<Role> roleList = userRoleDao.getRoleByUserId(user);
			user.setRoles(roleList);
			userList.add(user);
		}
		return userList;
	}
	//查询所有记录条数
	@Override
	public int getAllTotal() {
		String sql = "select count(1) as count from user where userStatus=1 ";
		Long total = (Long)super.executeOneColumn(new ScalarHandler("count"), sql);
		return total.intValue();
	}
	//删除员工账号
	@Override
	public int deleteUser(int userId) {
		String sql="delete from user where userId=?";
		return super.executeUpdate(sql, userId);
	}
	//获得所有头像路径
	@Override
	public List<UserHeadSculpture> getAllPicPathById(User user) {
		String sql = "select * from userheadsculpture where userId=?";
		return super.executeQuery(new BeanListHandler<UserHeadSculpture>(UserHeadSculpture.class), sql, user.getUserId());
	}
	//更新头像
	@Override
	public int updateHeadPic(User user, UserHeadSculpture userHeadSculpture) {
		String sql="update user set showPicPath=? where userId=? ";
		return super.executeUpdate(sql,userHeadSculpture.getPicturePath(),user.getUserId());
	}
	//添加头像
	@Override
	public int addUserHeadPic(UserHeadSculpture userHeadSculpture) {
		String sql ="insert into userheadsculpture (userId,picturepath) values(?,?)";
		return super.executeUpdate(sql, userHeadSculpture.getUserId(),userHeadSculpture.getPicturePath());
	}
	//搜索的总行数
	@Override
	public int searchAllTotal(String searchContnet) {
		String sql = "select count(1) as count from user where (userAccount like concat('%',?,'%') or userName like concat('%',?,'%')) and userStatus=1 ";
		Long total = (Long)super.executeOneColumn(new ScalarHandler("count"), sql,searchContnet,searchContnet);
		return total.intValue();
	}
	//搜索员工列表
	@Override
	public List<User> searchUser(String searchContent, int start, int rowsize) {
		User_roleDao userRoleDao = new User_roleDaoImpl();
		String sql = "select * from user where (userAccount like concat('%',?,'%') or userName like concat('%',?,'%')) and userStatus=1 order by userId desc limit ?,?";
		List<User> list = super.executeQuery(new BeanListHandler<User>(User.class), sql,searchContent,searchContent, start,rowsize);
		List<User> userList = new ArrayList<User>();
		for(User user:list) {
			//获得用户的职位信息
			List<Role> roleList = userRoleDao.getRoleByUserId(user);
			user.setRoles(roleList);
			userList.add(user);
		}
		return userList;
	}

}
