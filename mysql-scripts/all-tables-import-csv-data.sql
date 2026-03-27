USE gophish;

SET FOREIGN_KEY_CHECKS = 0;

-- TEMPLATES
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/templates.csv'
INTO TABLE gophish.templates
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, name, subject, html, text, modified_date);

-- PAGES
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/pages.csv'
INTO TABLE gophish.pages
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, name, html, capture_credentials, capture_passwords, redirect_url, modified_date);

-- SMTP
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/smtp.csv'
INTO TABLE gophish.smtp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, interface_type, name, host, username, password, from_address, modified_date, ignore_cert_errors);

-- HEADERS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/headers.csv'
INTO TABLE gophish.headers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(smtp_id, `key`, value);

-- GROUPS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/groups.csv'
INTO TABLE gophish.`groups`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, name, modified_date);

-- TARGETS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/targets.csv'
INTO TABLE gophish.targets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(first_name, last_name, email, position);

-- GROUP_TARGETS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/group_targets.csv'
INTO TABLE gophish.group_targets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(group_id, target_id);

-- CAMPAIGNS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/campaigns.csv'
INTO TABLE gophish.campaigns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, name, created_date, completed_date, template_id, page_id, status, url, smtp_id, launch_date);

-- RESULTS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/results.csv'
INTO TABLE gophish.results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(campaign_id, user_id, email, first_name, last_name, position, ip, latitude, longitude, status, reported, modified_date);

-- EMAIL_REQUESTS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/email_requests.csv'
INTO TABLE gophish.email_requests
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, template_id, page_id, first_name, last_name, email, position, url, r_id, from_address);

-- MAIL_LOGS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/mail_logs.csv'
INTO TABLE gophish.mail_logs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(campaign_id, user_id, send_date, send_attempt, r_id, processing);

-- EVENTS
LOAD DATA LOCAL INFILE 'D:/Dev/Python/Phishing/dts 1/events.csv'
INTO TABLE gophish.events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(campaign_id, email, time, message, details);

SET FOREIGN_KEY_CHECKS = 1;
