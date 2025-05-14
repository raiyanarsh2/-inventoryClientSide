<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Shopping Cart</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

  <!-- Lucide Icons CDN -->
  <script src="https://unpkg.com/lucide@latest"></script>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: #f4f6fa;
      color: #333;
    }

    nav {
      background-color: #4e54c8;
      color: white;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .nav-left h1 {
      font-size: 24px;
      font-weight: 600;
    }

    .nav-right {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .nav-icon {
      display: flex;
      align-items: center;
      gap: 6px;
      background: white;
      color: #4e54c8;
      padding: 8px 12px;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 500;
      transition: background 0.2s;
    }

    .nav-icon:hover {
      background: #e1e4f0;
    }

    .cart-container {
      padding: 40px 30px;
      max-width: 1000px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
    }

    .cart-items {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      margin-bottom: 20px;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      padding: 15px 0;
      border-bottom: 1px solid #ddd;
    }

    .cart-item:last-child {
      border-bottom: none;
    }

    .cart-item h4 {
      font-size: 16px;
    }

    .cart-item button {
      background-color: #f44336;
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 6px;
      cursor: pointer;
    }

    .cart-item button:hover {
      background-color: #d32f2f;
    }

    .total-price {
      text-align: right;
      margin-top: 20px;
      font-size: 20px;
      font-weight: 600;
    }

    .checkout-btn {
      background-color: #4e54c8;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      margin-top: 30px;
      width: 100%;
      font-size: 18px;
    }

    .checkout-btn:hover {
      background-color: #3e42a1;
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
  <nav>
    <div class="nav-left">
      <h1>Inventory</h1>
    </div>
    <div class="nav-right">
      <div class="nav-icon">
        <i data-lucide="user"></i>
        <span>Profile</span>
      </div>
      <div class="nav-icon">
        <i data-lucide="shopping-cart"></i>
        <span>Cart</span>
      </div>
    </div>
  </nav>

  <!-- Cart Page -->
  <div class="cart-container">
    <h2>Your Cart</h2>

    <!-- Cart Items Section -->
    <div class="cart-items" id="cartItems">
      <!-- Cart items will be dynamically inserted here -->
    </div>

    <!-- Total Price Section -->
    <div class="total-price" id="totalPrice">Total: ₹0</div>

    <!-- Checkout Button -->
    <button class="checkout-btn" onclick="proceedToCheckout()">Proceed to Checkout</button>
  </div>

  <!-- Script -->
  <script>
    lucide.createIcons();

    let cart = [
      { id: 1, name: "Wireless Mouse", price: 799, quantity: 1 },
      { id: 2, name: "Bluetooth Keyboard", price: 1499, quantity: 2 }
    ];

    // Function to render cart items
    function renderCartItems() {
      const cartItemsContainer = document.getElementById("cartItems");
      cartItemsContainer.innerHTML = "";

      cart.forEach(item => {
        const cartItemDiv = document.createElement("div");
        cartItemDiv.classList.add("cart-item");
        cartItemDiv.innerHTML = `
          <h4>${item.name} - ₹${item.price} x ${item.quantity}</h4>
          <button onclick="removeItemFromCart(${item.id})">Remove</button>
        `;
        cartItemsContainer.appendChild(cartItemDiv);
      });

      updateTotalPrice();
    }

    // Function to remove an item from the cart
    function removeItemFromCart(id) {
      cart = cart.filter(item => item.id !== id);
      renderCartItems();
    }

    // Function to update the total price
    function updateTotalPrice() {
      const totalPrice = cart.reduce((total, item) => total + (item.price * item.quantity), 0);
      document.getElementById("totalPrice").innerText = `Total: ₹${totalPrice}`;
    }

    // Function to simulate proceeding to checkout
    function proceedToCheckout() {
      if (cart.length === 0) {
        alert("Your cart is empty. Add items to the cart before proceeding.");
        return;
      }

      alert("Proceeding to checkout...");
      // API call logic for checkout can go here
      // Example: POST /checkout with cart data
    }

    // Initial render
    renderCartItems();
  </script>
</body>
</html>
