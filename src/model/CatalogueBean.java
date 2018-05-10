package model;

import java.util.ArrayList;
import java.util.List;

public class CatalogueBean {

	private List<Product> items = new ArrayList<Product>();

	public List<Product> getItems() {
		return items;
	}

	public void empty() {
		this.items = new ArrayList<Product>();
	}

}
