package model.bean;

import java.util.Arrays;

public class ShowCaseElement extends ProductBean{

    private boolean sale;
    private String defaultImg[];
    private boolean top;
    
    public ShowCaseElement() {
    }

    public String[] getDefaultImg() {
        return defaultImg;
    }
    public void setDefaultImg(String defaultImg[]) {
        this.defaultImg = defaultImg;
    }

    public boolean isSale() {
        return sale;
    }

    public void setSale(boolean sale) {
        this.sale = sale;
    }

    /**
     * @return the top
     */
    public boolean isTop() {
        return top;
    }

    /**
     * @param top the top to set
     */
    public void setTop(boolean top) {
        this.top = top;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + Arrays.hashCode(defaultImg);
        result = prime * result + (sale ? 1231 : 1237);
        result = prime * result + (top ? 1231 : 1237);
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
        ShowCaseElement other = (ShowCaseElement) obj;
        if (!Arrays.equals(defaultImg, other.defaultImg))
            return false;
        if (sale != other.sale)
            return false;
        if (top != other.top)
            return false;
        return true;
    }
    
    
}
