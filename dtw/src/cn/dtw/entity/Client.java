package cn.dtw.entity;

public class Client{
private int clientId;
private String clientName;
private String clientAddress;

public int getClientId(){
	return clientId;
}
public void setClientId(int clientId){
	this.clientId=clientId;
}


public String getClientName(){
	return clientName;
}
public void setClientName(String clientName){
	this.clientName=clientName;
}


public String getClientAddress(){
	return clientAddress;
}
public void setClientAddress(String clientAddress){
	this.clientAddress=clientAddress;
}

}