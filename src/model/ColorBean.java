/**
 * 
 */
package model;

/**
 * @author handymenny
 *
 */
public class ColorBean {
    
    private short id;
    private String hex;
    private String name;

    
    public ColorBean() {
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((hex == null) ? 0 : hex.hashCode());
        result = prime * result + id;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
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
        ColorBean other = (ColorBean) obj;
        if (hex == null) {
            if (other.hex != null)
                return false;
        } else if (!hex.equals(other.hex))
            return false;
        if (id != other.id)
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }

    /**
     * @return the hex
     */
    public String getHex() {
        return hex;
    }
    /**
     * @param hex the hex to set
     */
    public void setHex(String hex) {
        this.hex = hex;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
    public short getId() {
        return id;
    }
    public void setId(short id) {
        this.id = id;
    }


}
