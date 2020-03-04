DROP SCHEMA IF EXISTS auth CASCADE;
CREATE SCHEMA auth;

CREATE TABLE auth.user
(
    id            uuid PRIMARY KEY       NOT NULL,
    username      character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at    timestamptz DEFAULT now(),
    updated_at    timestamptz
);

CREATE FUNCTION auth.user_updated() RETURNS trigger
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

CREATE TRIGGER message_updated
    BEFORE UPDATE
    ON auth.user
    FOR EACH ROW
EXECUTE PROCEDURE auth.user_updated();

CREATE TABLE auth.client
(
    id            uuid PRIMARY KEY       NOT NULL,
    secret        character varying(255) NOT NULL,
    redirect_uris json                   NOT NULL,
    trusted_peers json                   NOT NULL,
    public        integer                NOT NULL,
    name          character varying(255) NOT NULL,
    logo_url      character varying(255) NOT NULL,
    created_at    timestamptz DEFAULT now()
);

CREATE TABLE auth.refresh_token
(
    id                    uuid PRIMARY KEY       NOT NULL,
    client_id             character varying(255) NOT NULL,
    scopes                json                   NOT NULL,
    nonce                 character varying(255) NOT NULL,
    claims_user_id        uuid                   NOT NULL,
    claims_username       character varying(255) NOT NULL,
    claims_email          character varying(255) NOT NULL,
    claims_email_verified integer                NOT NULL,
    claims_groups         json                   NOT NULL,
    created_at            timestamptz DEFAULT now()
);

