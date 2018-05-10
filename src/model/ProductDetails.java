/**
 * 
 */
package model;

import java.util.ArrayList;

/**
 * @author handymenny
 *
 */
public class ProductDetails extends ProductModel{

    private String description;
    private CategoryBean category;
    private ArrayList<VariantBean> variants;
    private ArrayList<String> images;
    private char gender;
    
    public ProductDetails() {
    }
   
    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }
    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
    /**
     * @return the category
     */
    public CategoryBean getCategory() {
        return category;
    }
    /**
     * @param category the category to set
     */
    public void setCategory(CategoryBean category) {
        this.category = category;
    }

    /**
     * @return the gender
     */
    public char getGender() {
        return gender;
    }

    /**
     * @param type the gender to set
     */
    public void setGender(char type) {
        this.gender = type;
    }
     /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((category == null) ? 0 : category.hashCode());
        result = prime * result + ((description == null) ? 0 : description.hashCode());
        result = prime * result + gender;
        result = prime * result + ((images == null) ? 0 : images.hashCode());
        result = prime * result + ((variants == null) ? 0 : variants.hashCode());
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
        ProductDetails other = (ProductDetails) obj;
        if (category == null) {
            if (other.category != null)
                return false;
        } else if (!category.equals(other.category))
            return false;
        if (description == null) {
            if (other.description != null)
                return false;
        } else if (!description.equals(other.description))
            return false;
        if (gender != other.gender)
            return false;
        if (images == null) {
            if (other.images != null)
                return false;
        } else if (!images.equals(other.images))
            return false;
        if (variants == null) {
            if (other.variants != null)
                return false;
        } else if (!variants.equals(other.variants))
            return false;
        return true;
    }

    public ArrayList<VariantBean> getVariants() {
        return variants;
    }

    public void setVariants(ArrayList<VariantBean> variants) {
        this.variants = variants;
    }

    public ArrayList<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }



}
