<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Inventory Dashboard</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
	rel="stylesheet">

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

.nav-right input {
	padding: 8px 12px;
	border-radius: 6px;
	border: none;
	outline: none;
	font-size: 14px;
	width: 200px;
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
	text-decoration: none; /* remove underline from link */
}

.nav-icon:hover {
	background: #e1e4f0;
}

/* Ensures <a> inside nav-icon inherits styles properly */
.nav-icon a {
	display: flex;
	align-items: center;
	gap: 6px;
	color: inherit;
	text-decoration: none;
}

.main-content {
	padding: 40px 30px;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
}

.product-card {
	background-color: white;
	width: 280px;
	padding: 20px;
	border-radius: 16px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: transform 0.2s;
}

.product-card:hover {
	transform: translateY(-4px);
}

.product-card h3 {
	margin-bottom: 10px;
	font-size: 20px;
}

.product-card p {
	color: #666;
	margin-bottom: 12px;
}

.product-card button {
	background-color: #4e54c8;
	color: white;
	padding: 10px 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.product-card button:hover {
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
			<input type="text" placeholder="Search products..." />
			<div class="nav-icon">
				<a href="profile.jsp"> <i data-lucide="user"></i> <span>Profile</span>
				</a>
			</div>
			<div class="nav-icon">
				<a href="cart.jsp"> <i data-lucide="shopping-cart"></i> <span>Cart</span>
				</a>
			</div>
		</div>
	</nav>

	<!-- Main Content Area -->
	<div class="main-content" id="productList">
		<!-- Product will be dynamically inserted -->
	</div>

	<!-- Script -->
	<script>
  lucide.createIcons();

  async function loadProducts() {
    try {
      const response = await fetch('http://localhost:3010/api/items');
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      const products = await response.json();

      const container = document.getElementById("productList");
      container.innerHTML = ""; // Clear existing content

      products.forEach(p => {
        /* const div = document.createElement("div");
        console.log(p.name);
        div.className = "product-card";
        div.innerHTML = `
          <h3>${p.name}</h3>
          <p>Vendor: ${p.vendor}</p>
          <p>Price: ₹${p.price}</p>
          <button onclick="addToCart(${p.id})">Add to Cart</button>
        `; 
        
        container.appendChild(div);
        */
        const div = document.createElement("div");
        div.className = "product-card";

        const title = document.createElement("h3");
        title.textContent = p.name;

        const vendor = document.createElement("p");
        vendor.textContent = "Vendor: " + p.vendor;

        const price = document.createElement("p");
        price.textContent = "Price: ₹" + p.price;

        const button = document.createElement("button");
        button.textContent = "Add to Cart";
        button.onclick = () => addToCart(p.id);

        div.append(title, vendor, price, button);
        container.appendChild(div);
      });
    } catch (error) {
      console.error("Failed to fetch products:", error);
      document.getElementById("productList").innerHTML = `<p style="color:red;">Unable to load products. Please try again later.</p>`;
    }
  }

  function addToCart(id) {
    alert("Product added to cart with ID: " + id);
  }

  loadProducts();
</script>

</body>
</html>
