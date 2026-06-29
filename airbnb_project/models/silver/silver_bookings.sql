{{ config(materialized='table') }}

SELECT 
    BOOKING_ID,
    BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} + CLEANING_FEE + SERVICE_FEE AS TOTAL_AMOUNT,
    NIGHTS_BOOKED,
    BOOKING_AMOUNT,
    CLEANING_FEE,
    SERVICE_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM
    {{ ref('bronze_bookings') }}