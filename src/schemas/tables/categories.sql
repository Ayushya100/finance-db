CREATE TYPE category_type_opt AS ENUM ('EXPENSE', 'INCOME', 'INVESTMENT', 'TRANSFER');
CREATE TYPE category_scope_opt AS ENUM ('PERSONAL', 'BUSINESS', 'SHARED');
CREATE TYPE category_nature_opt AS ENUM ('FIXED', 'VARIABLE', 'ESSENTIAL', 'DISCRETIONARY');

CREATE TABLE categories (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    category_type category_type_opt NOT NULL,
    category_cd VARCHAR(25) NOT NULL,
    category_name TEXT NOT NULL,
    category_scope category_scope_opt NOT NULL DEFAULT 'PERSONAL',
    category_nature category_nature_opt,
    is_favorite BOOLEAN DEFAULT false,
    is_active BOOLEAN DEFAULT true,
    metadata TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
