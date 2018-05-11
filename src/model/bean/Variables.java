package model.bean;

public class Variables {

    public Variables() {
        // TODO Auto-generated constructor stub
    }

    
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((value == null) ? 0 : value.hashCode());
        result = prime * result + ((webPage == null) ? 0 : webPage.hashCode());
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
        Variables other = (Variables) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (value == null) {
            if (other.value != null)
                return false;
        } else if (!value.equals(other.value))
            return false;
        if (webPage == null) {
            if (other.webPage != null)
                return false;
        } else if (!webPage.equals(other.webPage))
            return false;
        return true;
    }


    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }


    private String id;
    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }


    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }


    /**
     * @return the webPage
     */
    public String getWebPage() {
        return webPage;
    }


    /**
     * @param webPage the webPage to set
     */
    public void setWebPage(String webPage) {
        this.webPage = webPage;
    }


    private String value;
    private String webPage;
}
