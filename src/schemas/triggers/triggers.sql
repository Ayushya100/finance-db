CREATE TRIGGER svc_config_update_trigger
BEFORE UPDATE ON svc_config
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER path_config_update_trigger
BEFORE UPDATE ON path_config
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_role_update_trigger
BEFORE UPDATE ON user_role
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_scope_update_trigger
BEFORE UPDATE ON user_scope
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER role_scope_update_trigger
BEFORE UPDATE ON role_scope
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER users_update_trigger
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_metadata_update_trigger
BEFORE UPDATE ON user_metadata
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER operation_tags_update_trigger
BEFORE UPDATE ON operation_tags
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER global_operation_tags_update_trigger
BEFORE UPDATE ON global_operation_tags
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_global_operation_tags_update_trigger
BEFORE UPDATE ON user_global_operation_tags
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER categories_update_trigger
BEFORE UPDATE ON categories
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER global_categories_update_trigger
BEFORE UPDATE ON global_categories
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_global_categories_update_trigger
BEFORE UPDATE ON user_global_categories
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER txn_accounts_update_trigger
BEFORE UPDATE ON txn_accounts
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER txn_cards_update_trigger
BEFORE UPDATE ON txn_cards
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER wallet_update_trigger
BEFORE UPDATE ON wallet
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER merchant_update_trigger
BEFORE UPDATE ON merchant
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER payment_methods_update_trigger
BEFORE UPDATE ON payment_methods
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER txn_transactions_update_trigger
BEFORE UPDATE ON txn_transactions
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER transaction_parties_update_trigger
BEFORE UPDATE ON transaction_parties
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER txn_entries_update_trigger
BEFORE UPDATE ON txn_entries
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER recurring_transactions_update_trigger
BEFORE UPDATE ON recurring_transactions
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER recurring_transaction_runs_update_trigger
BEFORE UPDATE ON recurring_transaction_runs
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER emi_accounts_update_trigger
BEFORE UPDATE ON emi_accounts
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER emi_schedules_update_trigger
BEFORE UPDATE ON emi_schedules
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER dashboard_setup_header_update_trigger
BEFORE UPDATE ON dashboard_setup_header
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER dashboard_setup_update_trigger
BEFORE UPDATE ON dashboard_setup
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_dashboard_settings_update_trigger
BEFORE UPDATE ON user_dashboard_settings
FOR EACH ROW
EXECUTE FUNCTION update_version();