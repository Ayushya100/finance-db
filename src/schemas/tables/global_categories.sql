CREATE TABLE global_categories (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    category_type category_type_opt  NOT NULL,
    category_cd VARCHAR(25) NOT NULL UNIQUE,
    category_name TEXT NOT NULL,
    category_scope category_scope_opt NOT NULL DEFAULT 'PERSONAL',
    category_nature category_nature_opt,
    is_active BOOLEAN DEFAULT true,
    metadata TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false
);
