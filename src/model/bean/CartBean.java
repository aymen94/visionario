/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 * Copyright (c) 2018. Christian Gemelli
 */
package model.bean;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class CartBean {

    public CartBean() {
    }

        private Map<CartItem,Integer> items = new HashMap<CartItem,Integer>();

        public Set<CartItem> getItems() {
            return items.keySet();
        }

        public int getQuantity(CartItem item) {
            Integer quantity=items.get(item);
            if(quantity==null)
                return 0; 
            return quantity;
        }

        public void put(CartItem item, int quantity) {
            items.put(item, quantity);
        }
        
        public void empty() {
            this.items = new HashMap<CartItem,Integer>();
        }

        public void remove(CartItem item) {
            items.remove(item);
        }
        
        public int getSize() {
            return items.size();
        }      

}
