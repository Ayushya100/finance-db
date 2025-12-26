CREATE TYPE transaction_type_opt AS ENUM ('EXPENSE', 'INCOME', 'TRANSFER', 'REFUND', 'ADJUSTMENT', 'INVESTMENT');
CREATE TYPE status_opt AS ENUM ('COMPLETED', 'PENDING', 'FAILED', 'REVERSED');

CREATE TABLE txn_transactions (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    transaction_type transaction_type_opt NOT NULL,
    category_id TEXT NOT NULL,
    payment_method_id TEXT NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    amount NUMERIC(18,2) NOT NULL DEFAULT 0 CHECK (amount > 0),
    currency VARCHAR(5) DEFAULT 'INR',
    description TEXT,
    status status_opt DEFAULT 'COMPLETED',
    reference_id TEXT,
    external_reference TEXT,
    is_reversal BOOLEAN DEFAULT false,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id) ON DELETE CASCADE
);
