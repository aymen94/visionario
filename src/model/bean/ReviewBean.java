package model.bean;

import java.sql.Date;

public class ReviewBean {

    public ReviewBean() {
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((comment == null) ? 0 : comment.hashCode());
        result = prime * result + ((date == null) ? 0 : date.hashCode());
        result = prime * result + ((userName == null) ? 0 : userName.hashCode());
        result = prime * result + (int) (product ^ (product >>> 32));
        result = prime * result + score;
        result = prime * result + (int) (user ^ (user >>> 32));
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
        ReviewBean other = (ReviewBean) obj;
        if (comment == null) {
            if (other.comment != null)
                return false;
        } else if (!comment.equals(other.comment))
            return false;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        if (userName == null) {
            if (other.userName != null)
                return false;
        } else if (!userName.equals(other.userName))
            return false;
        if (product != other.product)
            return false;
        if (score != other.score)
            return false;
        if (user != other.user)
            return false;
        return true;
    }

    /**
     * @return the user
     */
    public long getUser() {
        return user;
    }
    /**
     * @param user the user to set
     */
    public void setUser(long user) {
        this.user = user;
    }
    /**
     * @return the nameUser
     */
    public String getUserName() {
        return userName;
    }
    /**
     * @param nameUser the nameUser to set
     */
    public void setUserName(String nameUser) {
        this.userName = nameUser;
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
    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }
    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }
    /**
     * @return the score
     */
    public short getScore() {
        return score;
    }
    /**
     * @param score the score to set
     */
    public void setScore(short score) {
        this.score = score;
    }
    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }
    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    private String userName;
    private long product;
    private Date date;
    private short score;
    private String comment;
    private long user;

}
