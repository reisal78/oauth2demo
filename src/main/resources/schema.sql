create table if not exists oauth_client_details (
  client_id               VARCHAR(256) PRIMARY KEY,
  resource_ids            VARCHAR(256),
  client_secret           VARCHAR(256),
  scope                   VARCHAR(256),
  authorized_grant_types  VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities             VARCHAR(256),
  access_token_validity   INTEGER,
  refresh_token_validity  INTEGER,
  additional_information  VARCHAR(4096),
  autoapprove             VARCHAR(256)
);

create table if not exists oauth_client_token (
  token_id          VARCHAR(256),
  token             bytea,
  authentication_id VARCHAR(256),
  user_name         VARCHAR(256),
  client_id         VARCHAR(256)
);

create table if not exists oauth_access_token (
  token_id          VARCHAR(256),
  token             bytea,
  authentication_id VARCHAR(256),
  user_name         VARCHAR(256),
  client_id         VARCHAR(256),
  authentication    bytea,
  refresh_token     VARCHAR(256)
);

create table if not exists oauth_refresh_token (
  token_id       VARCHAR(256),
  token          bytea,
  authentication bytea
);

create table if not exists oauth_code (
  code           VARCHAR(256),
  authentication bytea
);

create table if not exists oauth_approvals (
  userId         VARCHAR(256),
  clientId       VARCHAR(256),
  scope          VARCHAR(256),
  status         VARCHAR(10),
  expiresAt      TIMESTAMP,
  lastModifiedAt TIMESTAMP
);


INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, access_token_validity)
SELECT 'octavian', '$2a$04$tySCCEyDmRH0rWNPC9ZzbuJMSA2//JmVLkJwRIjrU/ipGGhAlSdVq', 'read', 'password', 0
WHERE NOT EXISTS(SELECT * FROM oauth_client_details WHERE client_id = 'octavian');