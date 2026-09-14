-- =====================================================
-- OTW (On The Way)
-- Delivery Rider Tracking and Dispatch Management System
-- PART 2A: SQL Query for Creating the Tables
-- SQLite / Programiz Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email TEXT,
    address TEXT NOT NULL
);

-- =========================
-- RIDERS TABLE
-- =========================
CREATE TABLE Riders (
    rider_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    service_area TEXT NOT NULL,
    availability_status TEXT NOT NULL
);

-- =========================
-- VEHICLES TABLE
-- One Rider = One Vehicle
-- =========================
CREATE TABLE Vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    rider_id INTEGER UNIQUE NOT NULL,
    vehicle_type TEXT NOT NULL,
    plate_number TEXT UNIQUE NOT NULL,
    vehicle_status TEXT NOT NULL,
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id)
);

-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    rider_id INTEGER NOT NULL,

    receiver_name TEXT NOT NULL,
    receiver_phone TEXT NOT NULL,

    pickup_address TEXT NOT NULL,
    dropoff_address TEXT NOT NULL,

    parcel_type TEXT NOT NULL,

    booking_datetime TEXT NOT NULL,
    delivery_type TEXT NOT NULL,

    scheduled_delivery_datetime TEXT,

    delivery_fee DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id)
);

-- =========================
-- DELIVERY STATUS TABLE
-- One Order = One Status Record
-- =========================
CREATE TABLE Delivery_Status (
    status_id INTEGER PRIMARY KEY,
    order_id INTEGER UNIQUE NOT NULL,

    delivery_status TEXT NOT NULL,
    updated_datetime TEXT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- =========================
-- PAYMENTS TABLE
-- One Order = One Payment Record
-- =========================
CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER UNIQUE NOT NULL,

    payment_method TEXT NOT NULL,
    payment_status TEXT NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_datetime TEXT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
