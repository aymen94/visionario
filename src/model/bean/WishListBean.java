/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model.bean;

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
