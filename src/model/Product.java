package model;

import java.math.BigDecimal;

public class Product {
    
    private long id;
    private String title;
    private BigDecimal maxPrice;
    private BigDecimal lowerPrice;
    private int numReviews;
    private String defaultImage;
    
    public Product() {
    }
    
    /**
     * @return the defaultImage
     */
    public String getDefaultImage() {
        return defaultImage;
    }

    /**
     * @param defaultImage the defaultImage to set
     */
    public void setDefaultImage(String defaultImage) {
        this.defaultImage = defaultImage;
    }

    /**
     * @return the numReviews
     */
    public int getNumReviews() {
        return numReviews;
    }

    /**
     * @param numReviews the numReviews to set
     */
    public void setNumReviews(int numReviews) {
        this.numReviews = numReviews;
    }
    
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((defaultImage == null) ? 0 : defaultImage.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((lowerPrice == null) ? 0 : lowerPrice.hashCode());
        result = prime * result + ((maxPrice == null) ? 0 : maxPrice.hashCode());
        result = prime * result + numReviews;
        result = prime * result + ((title == null) ? 0 : title.hashCode());
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
        Product other = (Product) obj;
        if (defaultImage == null) {
            if (other.defaultImage != null)
                return false;
        } else if (!defaultImage.equals(other.defaultImage))
            return false;
        if (id != other.id)
            return false;
        if (lowerPrice == null) {
            if (other.lowerPrice != null)
                return false;
        } else if (!lowerPrice.equals(other.lowerPrice))
            return false;
        if (maxPrice == null) {
            if (other.maxPrice != null)
                return false;
        } else if (!maxPrice.equals(other.maxPrice))
            return false;
        if (numReviews != other.numReviews)
            return false;
        if (title == null) {
            if (other.title != null)
                return false;
        } else if (!title.equals(other.title))
            return false;
        return true;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the maxPrice
     */
    public BigDecimal getMaxPrice() {
        return maxPrice;
    }

    /**
     * @param maxPrice the maxPrice to set
     */
    public void setMaxPrice(BigDecimal maxPrice) {
        this.maxPrice = maxPrice;
    }

    /**
     * @return the lowerPrice
     */
    public BigDecimal getLowerPrice() {
        return lowerPrice;
    }

    /**
     * @param lowerPrice the lowerPrice to set
     */
    public void setLowerPrice(BigDecimal lowerPrice) {
        this.lowerPrice = lowerPrice;
    }



}
