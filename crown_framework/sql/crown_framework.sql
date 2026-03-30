CREATE TABLE IF NOT EXISTS crown_characters (
  id INT NOT NULL AUTO_INCREMENT,
  citizen_id VARCHAR(50) NOT NULL,
  license VARCHAR(80) NOT NULL,
  first_name VARCHAR(50) NOT NULL DEFAULT 'John',
  last_name VARCHAR(50) NOT NULL DEFAULT 'Smith',
  dob DATE NULL,
  sex VARCHAR(10) NULL,
  phone_number VARCHAR(30) NULL,
  bank_balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  cash_balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  job_name VARCHAR(50) NOT NULL DEFAULT 'unemployed',
  job_grade INT NOT NULL DEFAULT 0,
  metadata LONGTEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_crown_characters_citizen_id (citizen_id),
  KEY idx_crown_characters_license (license)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS crown_bank_accounts (
  id INT NOT NULL AUTO_INCREMENT,
  owner_citizen_id VARCHAR(50) NOT NULL,
  account_type VARCHAR(30) NOT NULL DEFAULT 'personal',
  account_number VARCHAR(30) NOT NULL,
  sort_code VARCHAR(20) NOT NULL,
  balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  status VARCHAR(20) NOT NULL DEFAULT 'open',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_crown_bank_accounts_account_number (account_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
