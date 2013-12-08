package fr.istic.tlc.model;


public class Advertisement {

	private String title;
	private double price;
	private String date;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getPrice() {
		return price;
	}

	
	public void setPrice(double price) {
		this.price = price;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Advertisement(String title, double price, String date) {
		super();
		this.title = title;
		this.price = price;
		this.date = date;
	}

	public Advertisement() {
	}

}
