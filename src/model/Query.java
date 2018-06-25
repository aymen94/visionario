package model;

public class Query {

    protected static final String category = "SELECT id, name FROM Category WHERE id=?";

    protected static final String categoryAll = "SELECT id, name FROM Category";

    protected static final String variantByProd = "SELECT id,size,discounted_price,sold,price,weight,available,color,path "+
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

    protected static final String productSearch = "SELECT DISTINCT Product.id, title, priceMin, priceMax, numReviews, path "+
            " FROM Product, Image, ProductVariant"+
            " WHERE ProductVariant.product=Product.id"
            + " AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String categorySearch = "SELECT DISTINCT Category.id as id, Category.name as name"+
            " FROM Product, Category, ProductVariant"+
            " WHERE ProductVariant.product=Product.id AND Category.id=category ";

    protected static final String sizeSearch = "SELECT DISTINCT size"+
            " FROM Product, ProductVariant"+
            " WHERE ProductVariant.product=Product.id";

    protected static final String colorSearch = "SELECT DISTINCT color"+
            " FROM Product, ProductVariant"+
            " WHERE ProductVariant.product=Product.id";

    protected static final String genderSearch = "SELECT DISTINCT gender"+
            " FROM Product, ProductVariant"+
            " WHERE ProductVariant.product=Product.id";

    protected static String additionalWhere(String query, String q, int category,
            char gender, int countSize, int countColor, int sort)
    {
        if(q!=null && q.length()>0)
        {
            query+=" AND MATCH (title,description) AGAINST (? IN NATURAL LANGUAGE MODE)";
        }

        if(gender=='M' || gender=='W')
        {
            query+=" AND (gender=? OR gender='U')";
        }
        else if(gender=='K')
        {
            query+=" AND gender=?";
        }

        if(category!=0)
            query+= " AND category=?";

        if(countSize>0)
        {
            query+= " AND (  size=?";
            while(--countSize>0)
                query+=" OR size=?";
            query+=" ) ";
        }

        if(countColor>0)
        {
            query+= " AND (  color=?";
            while(--countColor>0)
                query+=" OR color=?";
            query+=" )";
        }

        if(sort==1)
        {
            query+=" SORT BY priceMin, priceMax ASC";
        }
        else if(sort==2)
        {
            query+=" SORT BY priceMax, priceMin";
        }

        return query;
    }
}
