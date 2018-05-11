package model.bean;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class CartBean {

    public CartBean() {
        // TODO Auto-generated constructor stub
    }

        private Map<CartItem,Integer> items = new HashMap<CartItem,Integer>();

        public Set<CartItem> getItems() {
            return items.keySet();
        }

        public int getOrder(CartItem item) {
            return items.get(item);
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
        
        public void getSize() {
            items.size();
        }
        
        

}
