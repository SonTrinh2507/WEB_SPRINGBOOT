package ptithcm.bean;

public class productList {
	private Long item_detail_id;
private String watch_id;
private int quantity;
private long price;
private String picture;
private String watch_name;



public String getWatch_id() {
	return watch_id;
}
public void setWatch_id(String watch_id) {
	this.watch_id = watch_id;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public long getPrice() {
	return price;
}
public void setPrice(long price) {
	this.price = price;
}
public String getPicture() {
	return picture;
}
public void setPicture(String picture) {
	this.picture = picture;
}
public String getWatch_name() {
	return watch_name;
}
public void setWatch_name(String watch_name) {
	this.watch_name = watch_name;
}
public productList(Long item_detail_id,String watch_id, int quantity, long price, String picture, String watch_name) {
	this.item_detail_id = item_detail_id;
	this.watch_id = watch_id;
	this.quantity = quantity;
	this.price = price;
	this.picture = picture;
	this.watch_name = watch_name;
}
public productList() {
	
}
public Long getItem_detail_id() {
	return item_detail_id;
}
public void setItem_detail_id(Long item_detail_id) {
	this.item_detail_id = item_detail_id;
}


}
