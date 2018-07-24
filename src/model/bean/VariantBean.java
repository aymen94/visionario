/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */

package model.bean;

import java.math.BigDecimal;

public class VariantBean {
   
    private String size;
    private BigDecimal discountedPrice;
    private BigDecimal price;
    private int sold;
    private int weight;
    private int available;
    private short variantId;
    private String img;
    private String color;

    public VariantBean()
    {
        super();
    }


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
        return weight == other.weight;
    }

    /**
     * @param available the available to set
     */
    public void setAvailable(int available) {
        this.available = available;
    }

    public int getAvailable() { return available;}

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
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the colors to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
