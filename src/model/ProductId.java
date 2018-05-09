package model;

public class ProductId {

    public ProductId() {
        // TODO Auto-generated constructor stub
    }

    short variant;
    long product;
    
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
}
