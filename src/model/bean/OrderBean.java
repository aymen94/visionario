/**
 * 
 */
package model.bean;

import java.math.BigDecimal;
import java.sql.Date;

/**
 * @author handymenny
 *
 */
public class OrderBean {

    private long id;
    private BigDecimal total;
    private Date shippingDate;
    private Date orderingDate;
    private Date deliveryDate;
    private long user;
    private BigDecimal shippingFees;
    private short status;
    private String sign;
    private String paymentMethod;
    

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((deliveryDate == null) ? 0 : deliveryDate.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((orderingDate == null) ? 0 : orderingDate.hashCode());
        result = prime * result + ((paymentMethod == null) ? 0 : paymentMethod.hashCode());
        result = prime * result + ((shippingDate == null) ? 0 : shippingDate.hashCode());
        result = prime * result + ((shippingFees == null) ? 0 : shippingFees.hashCode());
        result = prime * result + ((sign == null) ? 0 : sign.hashCode());
        result = prime * result + status;
        result = prime * result + ((total == null) ? 0 : total.hashCode());
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
        OrderBean other = (OrderBean) obj;
        if (deliveryDate == null) {
            if (other.deliveryDate != null)
                return false;
        } else if (!deliveryDate.equals(other.deliveryDate))
            return false;
        if (id != other.id)
            return false;
        if (orderingDate == null) {
            if (other.orderingDate != null)
                return false;
        } else if (!orderingDate.equals(other.orderingDate))
            return false;
        if (paymentMethod == null) {
            if (other.paymentMethod != null)
                return false;
        } else if (!paymentMethod.equals(other.paymentMethod))
            return false;
        if (shippingDate == null) {
            if (other.shippingDate != null)
                return false;
        } else if (!shippingDate.equals(other.shippingDate))
            return false;
        if (shippingFees == null) {
            if (other.shippingFees != null)
                return false;
        } else if (!shippingFees.equals(other.shippingFees))
            return false;
        if (sign == null) {
            if (other.sign != null)
                return false;
        } else if (!sign.equals(other.sign))
            return false;
        if (status != other.status)
            return false;
        if (total == null) {
            if (other.total != null)
                return false;
        } else if (!total.equals(other.total))
            return false;
        if (user != other.user)
            return false;
        return true;
    }

    public OrderBean() {
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
     * @return the total
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * @return the shippingDate
     */
    public Date getShippingDate() {
        return shippingDate;
    }

    /**
     * @param shippingDate the shippingDate to set
     */
    public void setShippingDate(Date shippingDate) {
        this.shippingDate = shippingDate;
    }

    /**
     * @return the orderingDate
     */
    public Date getOrderingDate() {
        return orderingDate;
    }

    /**
     * @param orderingDate the orderingDate to set
     */
    public void setOrderingDate(Date orderingDate) {
        this.orderingDate = orderingDate;
    }

    /**
     * @return the deliveryDate
     */
    public Date getDeliveryDate() {
        return deliveryDate;
    }

    /**
     * @param deliveryDate the deliveryDate to set
     */
    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
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
     * @return the shippingFees
     */
    public BigDecimal getShippingFees() {
        return shippingFees;
    }

    /**
     * @param shippingFees the shippingFees to set
     */
    public void setShippingFees(BigDecimal shippingFees) {
        this.shippingFees = shippingFees;
    }

    /**
     * @return the status
     */
    public short getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(short status) {
        this.status = status;
    }

    /**
     * @return the sign
     */
    public String getSign() {
        return sign;
    }

    /**
     * @param sign the sign to set
     */
    public void setSign(String sign) {
        this.sign = sign;
    }

    /**
     * @return the paymentMethod
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * @param paymentMethod the paymentMethod to set
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
