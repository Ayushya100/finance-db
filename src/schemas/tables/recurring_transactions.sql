CREATE TYPE transaction_type_opt AS ENUM ('EXPENSE', 'INCOME', 'TRANSFER');
CREATE TYPE source_instrument_type_opt AS ENUM ('ACCOUNT', 'CARD', 'WALLET');
CREATE TYPE frequency_opt AS ENUM ('DAILY', 'WEEKLY', 'MONTHLY', 'QUATERLY', 'YEARLY', 'CUSTOM');

CREATE TABLE recurring_transactions (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    transaction_type transaction_type_opt VARCHAR(25) NOT NULL,
    category_id TEXT NOT NULL,
    payment_method_id TEXT NOT NULL,
    source_instrument_type source_instrument_type_opt VARCHAR(25) NOT NULL,
    source_instrument_id TEXT NOT NULL,
    amount NUMERIC(18,2) NOT NULL,
    currency VARCHAR(5) DEFAULT 'INR',
    frequency frequency_opt VARCHAR(25) NOT NULL,
    internal_count INT DEFAULT 1,
    start_date DATE NOT NULL,
    end_date DATE,
    next_run_date DATE NOT NULL,
    status TEXT DEFAULT 'ACTIVE',
    auto_execute BOOLEAN DEFAULT false,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id) ON DELETE CASCADE
);
