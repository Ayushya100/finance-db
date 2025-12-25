CREATE TYPE dashboard_category_type_opt AS ENUM ('TOGGLE', 'TEXT', 'MULTI-SELECT', 'SINGLE-SELECT', 'NUMBER', 'DATE');

CREATE TABLE dashboard_setup (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    header_id TEXT NOT NULL,
    category_cd TEXT NOT NULL,
    category_name TEXT NOT NULL,
    category_type dashboard_category_type_opt VARCHAR(25) NOT NULL,
    options JSON,
    default_value TEXT,
    user_applicable BOOLEAN DEFAULT true,
    display_order INT,
    is_active BOOLEAN DEFAULT true,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (header_id) REFERENCES dashboard_setup_header(id) ON DELETE CASCADE
);
