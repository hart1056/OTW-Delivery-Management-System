-- =====================================================
-- OTW (On The Way)
-- Delivery Rider Tracking and Dispatch Management System
-- PART 2B: SQL Query for Inserting Records
-- =====================================================

-- =========================
-- CUSTOMERS
-- =========================
INSERT INTO Customers
(customer_id, full_name, phone_number, email, address)
VALUES
(1, 'Maria Santos', '09171234567', 'maria.santos@email.com', 'Imus, Cavite'),
(2, 'John Reyes', '09182345678', 'john.reyes@email.com', 'Bacoor, Cavite'),
(3, 'Angela Cruz', '09193456789', 'angela.cruz@email.com', 'Dasmarinas, Cavite'),
(4, 'Paolo Garcia', '09204567890', 'paolo.garcia@email.com', 'General Trias, Cavite'),
(5, 'Nicole Mendoza', '09215678901', 'nicole.mendoza@email.com', 'Kawit, Cavite');

-- =========================
-- RIDERS
-- =========================
INSERT INTO Riders
(rider_id, full_name, phone_number, service_area, availability_status)
VALUES
(1, 'Joshua Dela Cruz', '09561234567', 'Imus, Cavite', 'Available'),
(2, 'Mark Villanueva', '09572345678', 'Bacoor, Cavite', 'Available'),
(3, 'Kevin Ramos', '09583456789', 'Dasmarinas, Cavite', 'On Delivery'),
(4, 'Jerome Flores', '09594567890', 'General Trias, Cavite', 'Available'),
(5, 'Carlo Bautista', '09605678901', 'Kawit, Cavite', 'Offline');

-- =========================
-- VEHICLES
-- =========================
INSERT INTO Vehicles
(vehicle_id, rider_id, vehicle_type, plate_number, vehicle_status)
VALUES
(1, 1, 'Motorcycle', 'ABC1234', 'Active'),
(2, 2, 'Motorcycle', 'DEF5678', 'Active'),
(3, 3, 'Bicycle', 'N/A-001', 'Active'),
(4, 4, 'Motorcycle', 'GHI9012', 'Maintenance'),
(5, 5, 'Scooter', 'JKL3456', 'Inactive');

-- =========================
-- ORDERS
-- =========================
INSERT INTO Orders
(order_id, customer_id, rider_id, receiver_name, receiver_phone,
pickup_address, dropoff_address, parcel_type, booking_datetime,
delivery_type, scheduled_delivery_datetime, delivery_fee)
VALUES
(1, 1, 1,
 'Ana Lopez', '09199887766',
 'Imus, Cavite',
 'Bacoor, Cavite',
 'Documents',
 '2026-09-15 08:30:00',
 'ASAP',
 NULL,
 85.00),

(2, 2, 2,
 'Michael Torres', '09214567890',
 'Bacoor, Cavite',
 'Dasmarinas, Cavite',
 'Clothing',
 '2026-09-15 09:45:00',
 'Scheduled',
 '2026-09-15 18:00:00',
 120.00),

(3, 3, 3,
 'Samantha Perez', '09325678901',
 'Dasmarinas, Cavite',
 'General Trias, Cavite',
 'Gift',
 '2026-09-15 10:15:00',
 'ASAP',
 NULL,
 95.00),

(4, 4, 4,
 'Daniel Castillo', '09436789012',
 'General Trias, Cavite',
 'Kawit, Cavite',
 'Electronics',
 '2026-09-15 11:20:00',
 'Scheduled',
 '2026-09-15 19:30:00',
 150.00),

(5, 5, 5,
 'Christine Ramos', '09547890123',
 'Kawit, Cavite',
 'Imus, Cavite',
 'Food Package',
 '2026-09-15 13:30:00',
 'ASAP',
 NULL,
 75.00);

-- =========================
-- DELIVERY STATUS
-- =========================
INSERT INTO Delivery_Status
(status_id, order_id, delivery_status, updated_datetime)
VALUES
(1, 1, 'Delivered', '2026-09-15 09:45:00'),
(2, 2, 'Scheduled', '2026-09-15 10:00:00'),
(3, 3, 'In Transit', '2026-09-15 10:45:00'),
(4, 4, 'Picked Up', '2026-09-15 11:45:00'),
(5, 5, 'Pending Pickup', '2026-09-15 08:00:00');

-- =========================
-- PAYMENTS
-- =========================
INSERT INTO Payments
(payment_id, order_id, payment_method, payment_status, payment_amount, payment_datetime)
VALUES
(1, 1, 'GCash', 'Paid', 85.00, '2026-09-15 08:35:00'),
(2, 2, 'Cash', 'Pending', 120.00, '2026-09-15 09:50:00'),
(3, 3, 'Maya', 'Paid', 95.00, '2026-09-15 10:20:00'),
(4, 4, 'GCash', 'Paid', 150.00, '2026-09-15 11:30:00'),
(5, 5, 'Cash', 'Paid', 75.00, '2026-09-15 13:35:00');
