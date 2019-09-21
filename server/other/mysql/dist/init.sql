CREATE DATABASE IF NOT EXISTS flagdb;

CONNECT flagdb;

CREATE TABLE IF NOT EXISTS flagtbl(
  flag varchar(100)
);

INSERT INTO flagtbl VALUES('flag{curl_command_is_a_great_tool}');

CREATE USER flaguser;

GRANT ALL PRIVILEGES ON flagtbl TO 'flaguser';
