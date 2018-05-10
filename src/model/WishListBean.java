package model;

import java.util.ArrayList;

public class WishListBean {

    public WishListBean() {
    }
    
    public ArrayList<CartItem> getList() {
        return list;
    }

    public void setList(ArrayList<CartItem> list) {
        this.list = list;
    }

    private ArrayList<CartItem> list;
}
