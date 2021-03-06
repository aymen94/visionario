/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

public class Query {

    protected static final String deleteUser = "UPDATE user SET `password`=NULL, permission=NULL WHERE id=?;" +
                                               "DElETE FROM Wishlist WHERE user=?;";

    protected static final String numOfProduct = "UPDATE productvariant SET available=?";

    protected static final String deleteRow = "DELETE FROM tableName WHERE id=?";

    protected static final String numberInfo = "SELECT COUNT(*) FROM ";

    protected static final String revenue = "SELECT SUM(price) FROM composition";

    protected static final String allUsers = "SELECT * FROM user";

    protected static final String category = "SELECT id, name FROM Category WHERE id=?";

    protected static final String variantByProd = "SELECT id,size,discounted_price,sold,price,weight,available,color,path "+
                                                  "FROM ProductVariant p, Image i " +
                                                  "WHERE p.product=?  and i.product=p.product and i.variant = p.id";

    protected static final String variantByKey = "SELECT size,discounted_price,sold,price,weight,available,color,path " +
                                                 "FROM ProductVariant p, Image i " +
                                                 "WHERE p.product=? and p.id=? and i.product=p.product and i.variant = p.id";

    protected static final String productByKey = "SELECT Product.id, title, priceMin, priceMax, numReviews, path "+
                                                 " FROM Product, Image"+
                                                 " WHERE Product.id=? AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String productAll = "SELECT  Product.id,title, priceMin, priceMax, numReviews, path FROM Product, Image "+
                                               "WHERE Image.product=Product.id AND path LIKE '%default%' AND VARIANT=1";

    protected static final String productDetail = "SELECT title,description,category,gender,numReviews,priceMin,priceMax,path " +
                                                  "FROM Product, Image " +
                                                  "WHERE id=? AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String userByMail = "SELECT id,password,permission "+
                                                 "FROM User WHERE email=?";
    
    protected static final String userById = "SELECT id,name,surname,email,sex,date_of_birth as birth,password,permission "+
            "FROM User WHERE id=?";

    protected static final String signup = "INSERT INTO User (name,surname,email,password,sex,date_of_birth,permission)"+
                                           "VALUES (?,?,?,?,?,?,?)";

    protected static final String productSearch = "SELECT DISTINCT Product.id, title, priceMin, priceMax, numReviews, path "+
            " FROM Product, Image, ProductVariant"+
            " WHERE ProductVariant.product=Product.id"
            + " AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1";

    protected static final String productDiscounted = "SELECT DISTINCT Product.id, ProductVariant.id, title, discounted_price,price, numReviews, path"
            + " FROM Product, Image, ProductVariant WHERE ProductVariant.product=Product.id AND Image.product=Product.id AND Image.path LIKE '%default%' AND Image.variant=1 AND discounted_price<price LIMIT ?" ;


    protected static final String countMatches = "SELECT COUNT( DISTINCT Product.id)"+
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

    protected static final String updatePassword = "UPDATE User " + "SET password = ? WHERE id=?";
    
    protected static final String updateProfile = "UPDATE User SET name=?, surname=?, email=?, sex=?, date_of_birth=?, permission=? "
            + " WHERE id=?";

    protected static final String addressByUser = "SELECT id,city,country,phone_number, province, consignee, address_line,zip"
            + " FROM Address WHERE user=?";
    
    protected static final String addressByid_User = "SELECT id,city,country,phone_number, province, consignee, address_line,zip"
            + " FROM Address WHERE user=? and id=?";

    protected static final String insertAddress = 
        "SET @user=?;SET @id = IFNULL((SELECT MAX(id) FROM address where user=@user),0)+1;" +
            "\nINSERT INTO address (id,`user`, country, province, city, zip, address_line, consignee, phone_number)" +
            "values (@id,@user,?,?,?,?,?,?,?);" + " SELECT @id as id;";

    protected static final String updateAddress = "UPDATE address SET country=?,province=?,city=?,zip=?,address_line=?,consignee=?,phone_number=?"
            + " WHERE user=? and id=?";

    protected static final String removeAddress = "DELETE FROM address"
            + " WHERE user=? AND id=?";

    protected static final String reviewsByProd = "SELECT product, user, date, comment, score,User.name as user_name FROM Review,User WHERE product=? AND User.id=user";
    
    protected static final String orderByUser= "SELECT id, address, track,consignee, total, shipping_date, ordering_date, delivery_date, shipping_fees, status, sign, payment_method"
            + " FROM `order` WHERE user=?";

    protected static final String orderById_User=  "SELECT user, address, track, consignee, total, shipping_date, ordering_date, delivery_date, shipping_fees, status, sign, payment_method"
            + " FROM `order` WHERE id=? and user=?";

    protected static final String compositionByOrd = "SELECT title, color, size, quantity, Composition.price FROM Composition, Product, ProductVariant "
            + "WHERE `order`=? AND Product.id=Composition.product AND ProductVariant.id=Composition.variant AND Product.id=ProductVariant.product";

    protected static final String saveOrder = "INSERT INTO `Order` (total, ordering_date, `user`, shipping_fees, status, payment_method, address, consignee) values (?,?,?,?,?,?,?,?)";
    protected static final String saveComposition = "INSERT INTO Composition (product, variant, `order`, quantity, price) values (?,?,?,?,?)";

    
    protected static String additionalWhere(String query, String q, int category,
            char gender, int countSize, int countColor, int sort, int limit, int offset)
    {
        if(q!=null && q.length()>0)
            query+=" AND MATCH (title,description) AGAINST (? IN NATURAL LANGUAGE MODE)";

        if(gender=='M' || gender=='W')
            query+=" AND (gender=? OR gender='U')";
        else if(gender=='K')
            query+=" AND gender=?";

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
            query+=" ORDER BY priceMin ASC, priceMax ASC";
        else if(sort==2)
            query+=" ORDER BY priceMax DESC, priceMin DESC";
        else if(sort==3)
            query+=" ORDER BY name";
        else if(sort==4)
            query+=" ORDER BY size";

        if(limit>0)
        {
            query+=" LIMIT ?";
        }
        if(offset>0)
        {
            query+=" OFFSET ?";
        }
        
        return query;
    }
}
