CREATE TABLE dashboard_setup (
    id TEXT PRIMARY KEY DEFAULT ('041BDS' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    category_name VARCHAR(50) NOT NULL,
    category_desc VARCHAR(255) NOT NULL,
    category_type VARCHAR(20) NOT NULL,
    sub_category VARCHAR(50) NOT NULL,
    type VARCHAR(10) NOT NULL,
    is_periodic BOOLEAN DEFAULT TRUE,
    duration VARCHAR(8) DEFAULT 'daily',
    default_val varchar(20) NOT NULL,
    user_assignable BOOLEAN DEFAULT TRUE,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    CHECK (id ~ '^041BDS[A-F0-9]{32}$')
);
