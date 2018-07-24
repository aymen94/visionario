/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model.bean;

import java.util.ArrayList;


public class ProductDetails extends ProductBean{

    private String description;
    private CategoryBean category;
    private ArrayList<VariantBean> variants;
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


}
