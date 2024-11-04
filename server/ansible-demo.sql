-- Device
CREATE TABLE device (
  ip_address INET PRIMARY KEY,
  hostname VARCHAR(100),
  device_sn VARCHAR(50),
  os_version VARCHAR(50),
  hardware_model VARCHAR(100),
  uptime VARCHAR(100),
  cpu_consumption NUMERIC(5,2),
  memory_consumption NUMERIC(5,2),
  power_status_all VARCHAR(25),
  fan_status_all VARCHAR(25),
  cpu_status VARCHAR(25),
  vendor VARCHAR(100),
  uptime_for_formatted VARCHAR(100)
);

-- Kill Switch
CREATE TABLE kill_switch (
  target_int VARCHAR(50) PRIMARY KEY,
  status_kill BOOLEAN,
  ip_address INET,
  FOREIGN KEY (ip_address) REFERENCES device(ip_address)
);

-- Component
CREATE TABLE component (
  pid VARCHAR(50) PRIMARY KEY,
  description TEXT,
  P_serial_number VARCHAR(50),
  ip_address INET,
  FOREIGN KEY (ip_address) REFERENCES device(ip_address)
);

-- Power Supply
CREATE TABLE power_supply (
  pid VARCHAR(50) PRIMARY KEY, 
  power_status VARCHAR(100),
  power_health VARCHAR(50),
  FOREIGN KEY (pid) REFERENCES component(pid)
);

-- Fan
CREATE TABLE fan (
  pid VARCHAR(50) PRIMARY KEY, 
  fan_status VARCHAR(100),
  fan_health VARCHAR(50),
  FOREIGN KEY (pid) REFERENCES component(pid)
);

-- FortGate Compliance Report
CREATE TABLE fortigate_compliance_report (
  ip_address INET PRIMARY KEY,
  isSecurityRatingComply VARCHAR(25),
  isSwitchSecurityModeComply VARCHAR(25),
  isNonStdHTTPComply VARCHAR(25),
  isTimedoutComply VARCHAR(25),
  isImplicitDenyHitRateComply VARCHAR(25),
  operation_mode_compliance TEXT,
  security_rating_compliance TEXT,
  isOperationModeComply VARCHAR(25),
  switch_controller_security_mode_compliance TEXT,
  non_std_http_compliance TEXT,
  admin_timeout_compliance TEXT,
  implicit_deny_compliance TEXT,
  FOREIGN KEY (ip_address) REFERENCES device(ip_address)
);

-- Cisco Compliance Report
CREATE TABLE cisco_compliance_report (
  ip_address INET PRIMARY KEY,
  isSSHComply VARCHAR(25),
  isInterfaceComply VARCHAR(25),
  isDNSServerComply VARCHAR(25),
  isNTPServerComply VARCHAR(25),
  isSNMPUserComply VARCHAR(25),
  isSNMPTCPComply VARCHAR(25),
  isSNMPProtocolComply VARCHAR(25),
  ssh_compliance TEXT,
  interface_Compliance TEXT,
  dns_valid_compliance TEXT,
  ntp_server_configured_msg TEXT,
  snmp_users_compliance TEXT,
  snmp_TCP_compliance TEXT,
  snmp_protocol_compliance TEXT,
  FOREIGN KEY (ip_address) REFERENCES device(ip_address)
);


--- Query For Testing 
INSERT INTO device (ip_address, hostname, device_sn, os_version, hardware_model, uptime, cpu_consumption, memory_consumption, power_status_all, fan_status_all, cpu_status, vendor, uptime_for_formatted) VALUES
('192.168.0.1', 'CD123456', 'sample_cisco_1', 'IOS XE 17.3', 'Cisco ISR 4451', '120 days', 5.25, 30.50, 'GOOD', 'GOOD', 'GOOD', 'GOOD', 'GOOD'),
('192.168.0.2', 'CD123457', 'sample_cisco_2', 'IOS 15.2', 'Cisco Catalyst 9300', '200 days', 3.50, 20.75, 'GOOD', 'GOOD', 'GOOD', 'GOOD', 'GOOD'),
('192.168.0.3', 'CD123458', 'sample_cisco_3', 'ASA 9.8', 'Cisco ASA 5506-X', '150 days', 10.00, 40.00, 'GOOD', 'GOOD', 'GOOD', 'GOOD', 'GOOD');

INSERT INTO fortigate_compliance_report (ip_address) SELECT ip_address FROM device;

SELECT ip_address FROM fortigate_compliance_report WHERE ip_address = '192.168.0.1';