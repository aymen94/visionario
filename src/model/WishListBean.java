package model;

import java.util.ArrayList;

public class WishListBean {

    public WishListBean() {
    }
    
    public ArrayList<ProductId> getList() {
        return list;
    }

    public void setList(ArrayList<ProductId> list) {
        this.list = list;
    }

    private ArrayList<ProductId> list;
}
