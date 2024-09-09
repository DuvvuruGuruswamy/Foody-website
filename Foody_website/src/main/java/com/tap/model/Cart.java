package com.tap.model;

	import java.util.HashMap;
	import java.util.Map;

	public class Cart {

	    private Map<Integer, CartItem> items;

	    public Cart() {
	        items = new HashMap<>();
	    }

	    public void addItem(CartItem item) {
	        if (items.containsKey(item.getItemId())) {
	            CartItem existingItem = items.get(item.getItemId());
	            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
	        } else {
	            items.put(item.getItemId(), item);
	        }
	    }

	    public void removeItem(int itemId) {
	        items.remove(itemId);
	    }

	    public void updateQuantity(int itemId, int quantity) {
	        if (items.containsKey(itemId)) {
	            CartItem item = items.get(itemId);
	            item.setQuantity(quantity);
	        }
	    }

	    public CartItem getItem(int itemId) {
	        return items.get(itemId);
	    }

	    public Map<Integer, CartItem> getItems() {
	        return items;
	    }


	}


