CREATE OR REPLACE FUNCTION update_modified_version()
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified_on = now();
    NEW.version = OLD.version + 1;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
