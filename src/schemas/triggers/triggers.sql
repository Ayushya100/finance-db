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

CREATE TRIGGER dashboard_setup_header_update_trigger
BEFORE UPDATE ON dashboard_setup_header
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER dashboard_setup_update_trigger
BEFORE UPDATE ON dashboard_setup
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

CREATE TRIGGER user_dashboard_update_trigger
BEFORE UPDATE ON user_dashboard
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER operation_tags_update_trigger
BEFORE UPDATE ON operation_tags
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

CREATE TRIGGER user_finance_update_trigger
BEFORE UPDATE ON user_finance
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER txn_dtl_update_trigger
BEFORE UPDATE ON txn_dtl
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER credit_txn_dtl_update_trigger
BEFORE UPDATE ON credit_txn_dtl
FOR EACH ROW
EXECUTE FUNCTION update_version();

CREATE TRIGGER user_task_update_trigger
BEFORE UPDATE ON user_task
FOR EACH ROW
EXECUTE FUNCTION update_version();