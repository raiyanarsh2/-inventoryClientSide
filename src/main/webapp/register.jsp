<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register - Inventory System</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #8f94fb, #4e54c8);
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.register-container {
	background-color: white;
	padding: 40px 30px;
	border-radius: 12px;
	width: 100%;
	max-width: 450px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	animation: fadeIn 0.6s ease-in-out;
}

.register-container h2 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: #444;
	font-weight: 500;
}

.form-group input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 15px;
}

button {
	width: 100%;
	padding: 12px;
	background-color: #4e54c8;
	color: white;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #3e42a1;
}

#errorMsg {
	color: red;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

#successMsg {
	color: green;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

.switch-link {
	margin-top: 15px;
	text-align: center;
}

.switch-link button {
	background: none;
	color: #4e54c8;
	border: none;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	text-decoration: underline;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<div class="register-container">
		<h2>Create an Account</h2>
		<form id="registerForm">
			<div class="form-group">
				<label for="name">Full Name</label> <input type="text" id="name"
					placeholder="Enter your full name" required />
			</div>
			<div class="form-group">
				<label for="email">Email Address</label> <input type="email"
					id="email" placeholder="Enter your email" required />
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number</label> <input type="text" id="phoneNumber"
					placeholder="Enter your Phone Number" required />
			</div>
			
			<div class="form-group">
				<label for="address">Address</label> <input type="text" id="address"
					placeholder="Enter your Address" required />
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" placeholder="Create a password" required />
			</div>
			<button type="submit">Register</button>
			<p id="errorMsg"></p>
			<p id="successMsg"></p>
		</form>
		<div class="switch-link">
			<p>Already have an account?</p>
			<button onclick="window.location.href='index.jsp'">Login</button>
		</div>
	</div>

	<script>
    document.getElementById("registerForm").addEventListener("submit", function (e) {
      e.preventDefault();

      const name = document.getElementById("name").value.trim();
      const email = document.getElementById("email").value.trim();
      const password = document.getElementById("password").value.trim();
      const phoneNumber = document.getElementById("phoneNumber").value.trim();
      const address = document.getElementById("address").value.trim();

      fetch("http://localhost:3010/api/customers/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ name, email, phoneNumber,address, password })
      })
      .then((response) => {
        if (!response.ok) {
          return response.text().then(msg => { throw new Error(msg); });
        }
        return response.json();
      })
      .then((data) => {
        document.getElementById("errorMsg").textContent = "";
        document.getElementById("successMsg").textContent = "Registration successful! Redirecting to login...";
        setTimeout(() => {
          window.location.href = "index.jsp";
        }, 2000);
      })
      .catch((error) => {
        document.getElementById("successMsg").textContent = "";
        document.getElementById("errorMsg").textContent = error.message;
      });
    });
  </script>
</body>
</html>
