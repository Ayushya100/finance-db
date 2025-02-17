CREATE TRIGGER svc_configs_update_trigger
BEFORE UPDATE ON svc_configs
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER svc_routes_update_trigger
BEFORE UPDATE ON svc_routes
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_roles_update_trigger
BEFORE UPDATE ON user_roles
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_scopes_update_trigger
BEFORE UPDATE ON user_scopes
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER role_scopes_update_trigger
BEFORE UPDATE ON role_scope
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER dashboard_setup_update_trigger
BEFORE UPDATE ON dashboard_setup
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER users_update_trigger
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_account_update_trigger
BEFORE UPDATE ON user_account
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_metadata_update_trigger
BEFORE UPDATE ON user_metadata
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_dashboard_update_trigger
BEFORE UPDATE ON user_dashboard
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER operation_tags_update_trigger
BEFORE UPDATE ON operation_tags
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER txn_accounts_update_trigger
BEFORE UPDATE ON txn_accounts
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER txn_cards_update_trigger
BEFORE UPDATE ON txn_cards
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER wallet_update_trigger
BEFORE UPDATE ON wallet
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_finance_update_trigger
BEFORE UPDATE ON user_finance
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER txn_dtl_update_trigger
BEFORE UPDATE ON txn_dtl
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER credit_txn_dtl_update_trigger
BEFORE UPDATE ON credit_txn_dtl
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();

CREATE TRIGGER user_task_update_trigger
BEFORE UPDATE ON user_task
FOR EACH ROW
EXECUTE FUNCTION update_modified_version();
