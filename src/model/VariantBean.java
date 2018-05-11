/**
 * 
 */
package model;

import java.math.BigDecimal;
import java.util.Arrays;

/**
 * @author handymenny
 *
 */
public class VariantBean {
   
    private String size;
    private BigDecimal discountedPrice;
    private BigDecimal price;
    private int sold;
    private int weight;
    private int available;
    short variantId;
    private String[] colors;
    
    public VariantBean()
    {
        super();
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + available;
        result = prime * result + Arrays.hashCode(colors);
        result = prime * result + ((discountedPrice == null) ? 0 : discountedPrice.hashCode());
        result = prime * result + ((price == null) ? 0 : price.hashCode());
        result = prime * result + ((size == null) ? 0 : size.hashCode());
        result = prime * result + sold;
        result = prime * result + variantId;
        result = prime * result + weight;
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        VariantBean other = (VariantBean) obj;
        if (available != other.available)
            return false;
        if (!Arrays.equals(colors, other.colors))
            return false;
        if (discountedPrice == null) {
            if (other.discountedPrice != null)
                return false;
        } else if (!discountedPrice.equals(other.discountedPrice))
            return false;
        if (price == null) {
            if (other.price != null)
                return false;
        } else if (!price.equals(other.price))
            return false;
        if (size == null) {
            if (other.size != null)
                return false;
        } else if (!size.equals(other.size))
            return false;
        if (sold != other.sold)
            return false;
        if (variantId != other.variantId)
            return false;
        if (weight != other.weight)
            return false;
        return true;
    }

    /**
     * @param available the available to set
     */
    public void setAvailable(int available) {
        this.available = available;
    }

    /**
     * @return the size
     */
    public String getSize() {
        return size;
    }
    /**
     * @param size the size to set
     */
    public void setSize(String size) {
        this.size = size;
    }
    /**
     * @return the discountedPrice
     */
    public BigDecimal getDiscountedPrice() {
        return discountedPrice;
    }
    /**
     * @param discountedPrice the discountedPrice to set
     */
    public void setDiscountedPrice(BigDecimal discountedPrice) {
        this.discountedPrice = discountedPrice;
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
    /**
     * @return the sold
     */
    public int getSold() {
        return sold;
    }
    /**
     * @param sold the sold to set
     */
    public void setSold(int sold) {
        this.sold = sold;
    }
    /**
     * @return the weight
     */
    public int getWeight() {
        return weight;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(int weight) {
        this.weight = weight;
    }

    /**
     * @return the available
     */
    public int getAvailable() {
        return available;
    }
    /**
     * @param available the available to set
     */
    public void setAvailable(short available) {
        this.available = available;
    }


    /**
     * @return the variantId
     */
    public short getVariantId() {
        return variantId;
    }

    /**
     * @param variantId the variantId to set
     */
    public void setVariantId(short variantId) {
        this.variantId = variantId;
    }

    /**
     * @return the colors
     */
    public String[] getColors() {
        return colors;
    }

    /**
     * @param colors the colors to set
     */
    public void setColors(String[] colors) {
        this.colors = colors;
    }
}
