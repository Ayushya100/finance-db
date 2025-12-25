CREATE TYPE recurring_txn_status_opt AS ENUM ('PENDING', 'EXECUTED', 'SKIPPED', 'FAILED');

CREATE TABLE recurring_transaction_runs (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    recurring_id TEXT NOT NULL,
    scheduled_date DATE NOT NULL,
    transaction_id TEXT,
    status recurring_txn_status_opt VARCHAR(25) NOT NULL,
    error_message TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (recurring_id) REFERENCES recurring_transactions(id) ON DELETE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES txn_transactions(id)
);
