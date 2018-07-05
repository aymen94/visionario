package model.bean;

import java.sql.SQLException;

import model.ProductModel;
import model.VariantModel;

public class CartItem{
    private short variantId;
    private long id;
    
    public CartItem() {
    }

	public short getVariantId() {
		return variantId;
	}

	public void setVariantId(short variantId) {
		this.variantId = variantId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
    
	public VariantBean getVariant() throws SQLException{
		return (new VariantModel()).doRetrieveByKey(id,variantId);
	}
	
	public ProductBean getProduct() throws SQLException{
		return (new ProductModel()).doRetrieveByKey(id);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + variantId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		if (id != other.id)
			return false;
		if (variantId != other.variantId)
			return false;
		return true;
	}





}
