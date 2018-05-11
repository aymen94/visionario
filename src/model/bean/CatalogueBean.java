package model.bean;

import java.util.ArrayList;
import java.util.List;

public class CatalogueBean {

	private List<ProductBean> items = new ArrayList<ProductBean>();

	public List<ProductBean> getItems() {
		return items;
	}

	public void empty() {
		this.items = new ArrayList<ProductBean>();
	}

}
