<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Vehicle</title>
    <style>
        body {
            background: linear-gradient(135deg, #141E30, #0974f6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            display: flex;
            gap: 20px;
        }
        .booking-container, .bill-summary {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            color: #fff;
        }
        .booking-container {
            width: 400px;
        }
        .bill-summary {
            width: 250px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: none;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .form-control::placeholder {
            color: #ddd;
        }
        .btn-primary, .btn-danger {
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            margin-top: 10px;
            border: none;
            transition: 0.3s;
        }
        .btn-primary {
            background: #4CAF50;
        }
        .btn-danger {
            background: #d9534f;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Bill Summary Card -->
    <div class="bill-summary">
        <h4>Booking Summary</h4>
        <p><strong>Vehicle ID:</strong> <span id="billVehicle">${param.vid}</span></p>
        <p><strong>Start Date:</strong> <span id="billStart">-</span></p>
        <p><strong>End Date:</strong> <span id="billEnd">-</span></p>
        <p><strong>Duration:</strong> <span id="billDuration">-</span> days</p>
        <p><strong>Price per day:</strong> $<span id="billPricePerDay">0</span></p>
        <p><strong>Total Price:</strong> $<span id="billTotal">0</span></p>
    </div>

    <!-- Booking Form -->
    <div class="booking-container">
        <h2>Book the Vehicle</h2>
        <form>
            <div class="form-group">
                <label for="startDate">Booking Start Date</label>
                <input type="date" class="form-control" id="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">Booking End Date</label>
                <input type="date" class="form-control" id="endDate" required>
            </div>
            <div class="form-group">
                <label for="duration">Duration (in days)</label>
                <input type="number" class="form-control" id="duration" readonly>
            </div>
            <div class="form-group">
                <label for="totalPrice">Total Price</label>
                <input type="text" class="form-control" id="totalPrice" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Book Now</button>
            <a href="registeredUser.jsp" class="btn btn-danger">Back</a>
        </form>
    </div>
</div>

<script>
    document.getElementById("startDate").addEventListener("change", updateBill);
    document.getElementById("endDate").addEventListener("change", updateBill);

    function updateBill() {
        var startDate = new Date(document.getElementById("startDate").value);
        var endDate = new Date(document.getElementById("endDate").value);
        var pricePerDay = 50; // Example price

        if (startDate && endDate && endDate > startDate) {
            var duration = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));
            document.getElementById("duration").value = duration;
            document.getElementById("totalPrice").value = duration * pricePerDay;

            document.getElementById("billStart").innerText = startDate.toDateString();
            document.getElementById("billEnd").innerText = endDate.toDateString();
            document.getElementById("billDuration").innerText = duration;
            document.getElementById("billPricePerDay").innerText = pricePerDay;
            document.getElementById("billTotal").innerText = duration * pricePerDay;
        }
    }
</script>

</body>
</html>
