-- partitioning.sql
-- Step 1: Create the partitioned table structure
CREATE TABLE bookings_partitioned (
    booking_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) PARTITION BY RANGE (start_date);

-- Step 2: Create yearly partitions (adjust ranges as needed)
CREATE TABLE bookings_y2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_y2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_y2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

-- Step 3: Create default partition for historical data
CREATE TABLE bookings_historical PARTITION OF bookings_partitioned
    DEFAULT;

-- Step 4: Migrate data from original table
INSERT INTO bookings_partitioned
SELECT * FROM bookings;

-- Step 5: Verify data integrity
SELECT COUNT(*) FROM bookings;
SELECT COUNT(*) FROM bookings_partitioned;

-- Step 6: Replace original table (run during maintenance window)
BEGIN;
ALTER TABLE bookings RENAME TO bookings_old;
ALTER TABLE bookings_partitioned RENAME TO bookings;
COMMIT;

-- Optional: Create indexes on each partition
CREATE INDEX ON bookings_y2023 (start_date);
CREATE INDEX ON bookings_y2024 (start_date);
CREATE INDEX ON bookings_y2025 (start_date);