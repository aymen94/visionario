package model.bean;

import security.PasswordHash;

public class SignInBean {

    private long id;
    private String pwhash;
    private Boolean permission;

    public SignInBean() {
    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((pwhash == null) ? 0 : pwhash.hashCode());
        result = prime * result + ((permission == null) ? 0 : permission.hashCode());
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
        SignInBean other = (SignInBean) obj;
        if (id != other.id)
            return false;
        if (pwhash == null) {
            if (other.pwhash != null)
                return false;
        } else if (!pwhash.equals(other.pwhash))
            return false;
        if (permission == null) {
            if (other.permission != null)
                return false;
        } else if (!permission.equals(other.permission))
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
     * @return the password
     */
    public String getPassword() {
        return pwhash;
    }
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.pwhash = password;
    }

    /**
     * @return the permission
     */
    public Boolean getPermission() {
        return permission;
    }
    /**
     * @param permission the permission to set
     */
    public void setPermission(Boolean permission) {
        this.permission = permission;
    }

    public boolean checkPassword(String text)
    {
        try {
            return PasswordHash.validatePassword(text, pwhash);
        } catch (Exception e) {
            return false;
        }
    }
}
