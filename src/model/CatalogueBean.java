package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CatalogueBean {

	private static final long serialVersionUID = 1L;

	private List<MinProduct> items = new ArrayList<MinProduct>();

	public List<MinProduct> getItems() {
		return items;
	}

	public void empty() {
		this.items = new ArrayList<MinProduct>();
	}

}
