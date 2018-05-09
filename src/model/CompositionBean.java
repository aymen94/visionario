package model;

import java.math.BigDecimal;

public class CompositionBean {

    private long product;
    private short variant;
    private long order;
    private short quantity;
    private BigDecimal price;
    
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (order ^ (order >>> 32));
        result = prime * result + ((price == null) ? 0 : price.hashCode());
        result = prime * result + (int) (product ^ (product >>> 32));
        result = prime * result + quantity;
        result = prime * result + variant;
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        CompositionBean other = (CompositionBean) obj;
        if (order != other.order)
            return false;
        if (price == null) {
            if (other.price != null)
                return false;
        } else if (!price.equals(other.price))
            return false;
        if (product != other.product)
            return false;
        if (quantity != other.quantity)
            return false;
        if (variant != other.variant)
            return false;
        return true;
    }

    /**
     * @return the product
     */
    public long getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(long product) {
        this.product = product;
    }

    /**
     * @return the variant
     */
    public short getVariant() {
        return variant;
    }

    /**
     * @param variant the variant to set
     */
    public void setVariant(short variant) {
        this.variant = variant;
    }

    /**
     * @return the order
     */
    public long getOrder() {
        return order;
    }

    /**
     * @param order the order to set
     */
    public void setOrder(long order) {
        this.order = order;
    }

    /**
     * @return the quantity
     */
    public short getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public CompositionBean() {
    }

}
