package model;

public class Query {

    protected static final String category = "SELECT id, name FROM Category WHERE id=?";

    protected static final String categoryAll = "SELECT id, name FROM Category";

    protected static final String variantByProd = "SELECT id,size,discounted_price,sold,price,weight,available,path "+
                                                  "FROM ProductVariant p, Image i " +
                                                  "WHERE p.product=?  and i.product=p.product and i.variant = p.id";

    protected static final String variantByKey = "SELECT size,discounted_price,sold,price,weight,available,path " +
                                                 "FROM ProductVariant p, Image i " +
                                                 "WHERE p.product=? and p.id=? and i.product=p.product and i.variant = p.id";

    protected static final String productByKey = "SELECT Product.id, title, priceMin, priceMax, numReviews, path "+
                                                 " FROM Product, Image"+
                                                 " WHERE Product.id=? AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String productAll = "SELECT  Product.id,title, priceMin, priceMax, numReviews, path FROM Product, Image "+
                                               "WHERE Image.product=Product.id AND path LIKE '%default%' AND VARIANT=1";

    protected static final String productDetail = "SELECT title,description,category,gender,numReviews,priceMin, priceMax, path " +
                                                  "FROM Product, Image " +
                                                  "WHERE id=? AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String signInByMail = "SELECT id,password,permission "
            + "FROM User WHERE email=?";

}
