CREATE DATABASE hr;
USE hr;
GRANT ALL PRIVILEGES ON hr.* TO hr@localhost IDENTIFIED BY'hr'WITH GRANT OPTION;


CREATE TABLE countries (
  COUNTRY_ID char(2) DEFAULT NULL,
  COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
('IT','Italy', 1),
('JP','Japan', 3),
('US','United States of America', 2),
('CA','Canada', 2),
('CN','China', 3),
('IN','India', 3),
('AU','Australia', 3),
('ZW','Zimbabwe', 4),
('SG','Singapore', 3),
('UK','UnitedKingdom', 1),
('FR','France', 1),
('DE','Germany', 1),
('ZM','Zambia', 4),
('EG','Egypt', 4),
('BR','Brazil', 2),
('CH','Switzerland', 1),
('NL','Netherlands', 1),
('MX','Mexico', 2),
('KW','Kuwait', 4),
('IL','Israel', 4),
('DK','Denmark', 1),
('ML','Malaysia', 3),
('NG','Nigeria', 4),
('AR','Argentina', 2),
('BE','Belgium', 1);



CREATE TABLE departments (
  DEPARTMENT_ID int(4) NOT NULL,
  DEPARTMENT_NAME varchar(30) DEFAULT NULL,
  MANAGER_ID int(6) DEFAULT NULL,
  LOCATION_ID int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(10,'Administration', 200, 1700),
(20,'Marketing', 201, 1800),
(30,'Purchasing', 114, 1700),
(40,'Human Resources', 203, 2400),
(50,'Shipping', 121, 1500),
(60,'IT', 103, 1400),
(70,'Public Relations', 204, 2700),
(80,'Sales', 145, 2500),
(90,'Executive', 100, 1700),
(100,'Finance', 108, 1700),
(110,'Accounting', 205, 1700),
(120,'Treasury', 0, 1700),
(130,'Corporate Tax', 0, 1700),
(140,'Control And Credit', 0, 1700),
(150,'Shareholder Services', 0, 1700),
(160,'Benefits', 0, 1700),
(170,'Manufacturing', 0, 1700),
(180,'Construction', 0, 1700),
(190,'Contracting', 0, 1700),
(200,'Operations', 0, 1700),
(210,'IT Support', 0, 1700),
(220,'NOC', 0, 1700),
(230,'IT Helpdesk', 0, 1700),
(240,'Government Sales', 0, 1700),
(250,'Retail Sales', 0, 1700),
(260,'Recruiting', 0, 1700),
(270,'Payroll', 0, 1700);



CREATE TABLE employees (
  EMPLOYEE_ID int(6) NOT NULL,
  FIRST_NAME varchar(20) DEFAULT NULL,
  LAST_NAME varchar(25) DEFAULT NULL,
  EMAIL varchar(25) DEFAULT NULL,
  PHONE_NUMBER varchar(20) DEFAULT NULL,
  HIRE_DATE varchar(15) DEFAULT NULL,
  JOB_ID varchar(10) DEFAULT NULL,
  SALARY double DEFAULT NULL,
  COMMISSION_PCT double DEFAULT NULL,
  MANAGER_ID int(6) DEFAULT NULL,
  DEPARTMENT_ID int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(100,'Steven','King','SKING','515.123.4567','17-06-2003','AD_PRES', 24000, 0, 0, 90),
(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','21-09-2005','AD_VP', 17000, 0, 100, 90),
(102,'Lex','De Haan','LDEHAAN','515.123.4569','13-01-2001','AD_VP', 17000, 0, 100, 90),
(103,'Alexander','Hunold','AHUNOLD','590.423.4567','03-01-2006','IT_PROG', 9000, 0, 102, 60),
(104,'Bruce','Ernst','BERNST','590.423.4568','21-05-2007','IT_PROG', 6000, 0, 103, 60),
(105,'David','Austin','DAUSTIN','590.423.4569','25-06-2005','IT_PROG', 4800, 0, 103, 60),
(106,'Valli','Pataballa','VPATABAL','590.423.4560','05-02-2006','IT_PROG', 4800, 0, 103, 60),
(107,'Diana','Lorentz','DLORENTZ','590.423.5567','07-02-2007','IT_PROG', 4200, 0, 103, 60),
(108,'Nancy','Greenberg','NGREENBE','515.124.4569','17-08-2002','FI_MGR', 12008, 0, 101, 100),
(109,'Daniel','Faviet','DFAVIET','515.124.4169','16-08-2002','FI_ACCOUN', 9000, 0, 108, 100),
(110,'John','Chen','JCHEN','515.124.4269','28-09-2005','FI_ACCOUN', 8200, 0, 108, 100),
(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','30-09-2005','FI_ACCOUN', 7700, 0, 108, 100),
(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','07-03-2006','FI_ACCOUN', 7800, 0, 108, 100),
(113,'Luis','Popp','LPOPP','515.124.4567','07-12-2007','FI_ACCOUN', 6900, 0, 108, 100),
(114,'Den','Raphaely','DRAPHEAL','515.127.4561','07-12-2002','PU_MAN', 11000, 0, 100, 30),
(115,'Alexander','Khoo','AKHOO','515.127.4562','18-05-2003','PU_CLERK', 3100, 0, 114, 30),
(116,'Shelli','Baida','SBAIDA','515.127.4563','24-12-2005','PU_CLERK', 2900, 0, 114, 30),
(117,'Sigal','Tobias','STOBIAS','515.127.4564','24-07-2005','PU_CLERK', 2800, 0, 114, 30),
(118,'Guy','Himuro','GHIMURO','515.127.4565','15-11-2006','PU_CLERK', 2600, 0, 114, 30),
(119,'Karen','Colmenares','KCOLMENA','515.127.4566','10-08-2007','PU_CLERK', 2500, 0, 114, 30),
(120,'Matthew','Weiss','MWEISS','650.123.1234','18-07-2004','ST_MAN', 8000, 0, 100, 50),
(121,'Adam','Fripp','AFRIPP','650.123.2234','10-04-2005','ST_MAN', 8200, 0, 100, 50),
(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','01-05-2003','ST_MAN', 7900, 0, 100, 50),
(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','10-10-2005','ST_MAN', 6500, 0, 100, 50),
(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','16-11-2007','ST_MAN', 5800, 0, 100, 50),
(125,'Julia','Nayer','JNAYER','650.124.1214','16-07-2005','ST_CLERK', 3200, 0, 120, 50),
(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','28-09-2006','ST_CLERK', 2700, 0, 120, 50),
(127,'James','Landry','JLANDRY','650.124.1334','14-01-2007','ST_CLERK', 2400, 0, 120, 50),
(128,'Steven','Markle','SMARKLE','650.124.1434','08-03-2008','ST_CLERK', 2200, 0, 120, 50),
(129,'Laura','Bissot','LBISSOT','650.124.5234','20-08-2005','ST_CLERK', 3300, 0, 121, 50),
(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','30-10-2005','ST_CLERK', 2800, 0, 121, 50),
(131,'James','Marlow','JAMRLOW','650.124.7234','16-02-2005','ST_CLERK', 2500, 0, 121, 50),
(132,'TJ','Olson','TJOLSON','650.124.8234','10-04-2007','ST_CLERK', 2100, 0, 121, 50),
(133,'Jason','Mallin','JMALLIN','650.127.1934','14-06-2004','ST_CLERK', 3300, 0, 122, 50),
(134,'Michael','Rogers','MROGERS','650.127.1834','26-08-2006','ST_CLERK', 2900, 0, 122, 50),
(135,'Ki','Gee','KGEE','650.127.1734','12-12-2007','ST_CLERK', 2400, 0, 122, 50),
(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','06-02-2008','ST_CLERK', 2200, 0, 122, 50),
(137,'Renske','Ladwig','RLADWIG','650.121.1234','14-07-2003','ST_CLERK', 3600, 0, 123, 50),
(138,'Stephen','Stiles','SSTILES','650.121.2034','26-10-2005','ST_CLERK', 3200, 0, 123, 50),
(139,'John','Seo','JSEO','650.121.2019','12-02-2006','ST_CLERK', 2700, 0, 123, 50),
(140,'Joshua','Patel','JPATEL','650.121.1834','06-04-2006','ST_CLERK', 2500, 0, 123, 50),
(141,'Trenna','Rajs','TRAJS','650.121.8009','17-10-2003','ST_CLERK', 3500, 0, 124, 50),
(142,'Curtis','Davies','CDAVIES','650.121.2994','29-01-2005','ST_CLERK', 3100, 0, 124, 50),
(143,'Randall','Matos','RMATOS','650.121.2874','15-03-2006','ST_CLERK', 2600, 0, 124, 50),
(144,'Peter','Vargas','PVARGAS','650.121.2004','09-07-2006','ST_CLERK', 2500, 0, 124, 50),
(145,'John','Russell','JRUSSEL','011.44.1344.429268','01-10-2004','SA_MAN', 14000, 0.4, 100, 80),
(146,'Karen','Partners','KPARTNER','011.44.1344.467268','05-01-2005','SA_MAN', 13500, 0.3, 100, 80),
(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','10-03-2005','SA_MAN', 12000, 0.3, 100, 80),
(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','15-10-2007','SA_MAN', 11000, 0.3, 100, 80),
(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','29-01-2008','SA_MAN', 10500, 0.2, 100, 80),
(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','30-01-2005','SA_REP', 10000, 0.3, 145, 80),
(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','24-03-2005','SA_REP', 9500, 0.25, 145, 80),
(152,'Peter','Hall','PHALL','011.44.1344.478968','20-08-2005','SA_REP', 9000, 0.25, 145, 80),
(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','30-03-2006','SA_REP', 8000, 0.2, 145, 80),
(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','09-12-2006','SA_REP', 7500, 0.2, 145, 80),
(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','23-11-2007','SA_REP', 7000, 0.15, 145, 80),
(156,'Janette','King','JKING','011.44.1345.429268','30-01-2004','SA_REP', 10000, 0.35, 146, 80),
(157,'Patrick','Sully','PSULLY','011.44.1345.929268','04-03-2004','SA_REP', 9500, 0.35, 146, 80),
(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','01-08-2004','SA_REP', 9000, 0.35, 146, 80),
(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','10-03-2005','SA_REP', 8000, 0.3, 146, 80),
(160,'Louise','Doran','LDORAN','011.44.1345.629268','15-12-2005','SA_REP', 7500, 0.3, 146, 80),
(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','03-11-2006','SA_REP', 7000, 0.25, 146, 80),
(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','11-11-2005','SA_REP', 10500, 0.25, 147, 80),
(163,'Danielle','Greene','DGREENE','011.44.1346.229268','19-03-2007','SA_REP', 9500, 0.15, 147, 80),
(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','24-01-2008','SA_REP', 7200, 0.1, 147, 80),
(165,'David','Lee','DLEE','011.44.1346.529268','23-02-2008','SA_REP', 6800, 0.1, 147, 80),
(166,'Sundar','Ande','SANDE','011.44.1346.629268','24-03-2008','SA_REP', 6400, 0.1, 147, 80),
(167,'Amit','Banda','ABANDA','011.44.1346.729268','21-04-2008','SA_REP', 6200, 0.1, 147, 80),
(168,'Lisa','Ozer','LOZER','011.44.1343.929268','11-03-2005','SA_REP', 11500, 0.25, 148, 80),
(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','23-03-2006','SA_REP', 10000, 0.2, 148, 80),
(170,'Tayler','Fox','TFOX','011.44.1343.729268','24-01-2006','SA_REP', 9600, 0.2, 148, 80),
(171,'William','Smith','WSMITH','011.44.1343.629268','23-02-2007','SA_REP', 7400, 0.15, 148, 80),
(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','24-03-2007','SA_REP', 7300, 0.15, 148, 80),
(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','21-04-2008','SA_REP', 6100, 0.1, 148, 80),
(174,'Ellen','Abel','EABEL','011.44.1644.429267','11-05-2004','SA_REP', 11000, 0.3, 149, 80),
(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','19-03-2005','SA_REP', 8800, 0.25, 149, 80),
(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','24-03-2006','SA_REP', 8600, 0.2, 149, 80),
(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','23-04-2006','SA_REP', 8400, 0.2, 149, 80),
(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','24-05-2007','SA_REP', 7000, 0.15, 149, NULL),
(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','04-01-2008','SA_REP', 6200, 0.1, 149, 80),
(180,'Winston','Taylor','WTAYLOR','650.507.9876','24-01-2006','SH_CLERK', 3200, 0, 120, 50),
(181,'Jean','Fleaur','JFLEAUR','650.507.9877','23-02-2006','SH_CLERK', 3100, 0, 120, 50),
(182,'Martha','Sullivan','MSULLIVA','650.507.9878','21-06-2007','SH_CLERK', 2500, 0, 120, 50),
(183,'Girard','Geoni','GGEONI','650.507.9879','03-02-2008','SH_CLERK', 2800, 0, 120, 50),
(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','27-01-2004','SH_CLERK', 4200, 0, 121, 50),
(185,'Alexis','Bull','ABULL','650.509.2876','20-02-2005','SH_CLERK', 4100, 0, 121, 50),
(186,'Julia','Dellinger','JDELLING','650.509.3876','24-06-2006','SH_CLERK', 3400, 0, 121, 50),
(187,'Anthony','Cabrio','ACABRIO','650.509.4876','07-02-2007','SH_CLERK', 3000, 0, 121, 50),
(188,'Kelly','Chung','KCHUNG','650.505.1876','14-06-2005','SH_CLERK', 3800, 0, 122, 50),
(189,'Jennifer','Dilly','JDILLY','650.505.2876','13-08-2005','SH_CLERK', 3600, 0, 122, 50),
(190,'Timothy','Gates','TGATES','650.505.3876','11-07-2006','SH_CLERK', 2900, 0, 122, 50),
(191,'Randall','Perkins','RPERKINS','650.505.4876','19-12-2007','SH_CLERK', 2500, 0, 122, 50),
(192,'Sarah','Bell','SBELL','650.501.1876','04-02-2004','SH_CLERK', 4000, 0, 123, 50),
(193,'Britney','Everett','BEVERETT','650.501.2876','03-03-2005','SH_CLERK', 3900, 0, 123, 50),
(194,'Samuel','McCain','SMCCAIN','650.501.3876','01-07-2006','SH_CLERK', 3200, 0, 123, 50),
(195,'Vance','Jones','VJONES','650.501.4876','17-03-2007','SH_CLERK', 2800, 0, 123, 50),
(196,'Alana','Walsh','AWALSH','650.507.9811','24-04-2006','SH_CLERK', 3100, 0, 124, 50),
(197,'Kevin','Feeney','KFEENEY','650.507.9822','23-05-2006','SH_CLERK', 3000, 0, 124, 50),
(198,'Donald','OConnell','DOCONNEL','650.507.9833','21-06-2007','SH_CLERK', 2600, 0, 124, 50),
(199,'Douglas','Grant','DGRANT','650.507.9844','13-01-2008','SH_CLERK', 2600, 0, 124, 50),
(200,'Jennifer','Whalen','JWHALEN','515.123.4444','17-09-2003','AD_ASST', 4400, 0, 101, 10),
(201,'Michael','Hartstein','MHARTSTE','515.123.5555','17-02-2004','MK_MAN', 13000, 0, 100, 20),
(202,'Pat','Fay','PFAY','603.123.6666','17-08-2005','MK_REP', 6000, 0, 201, 20),
(203,'Susan','Mavris','SMAVRIS','515.123.7777','07-06-2002','HR_REP', 6500, 0, 101, 40),
(204,'Hermann','Baer','HBAER','515.123.8888','07-06-2002','PR_REP', 10000, 0, 101, 70),
(205,'Shelley','Higgins','SHIGGINS','515.123.8080','07-06-2002','AC_MGR', 12008, 0, 101, 110),
(206,'William','Gietz','WGIETZ','515.123.8181','07-06-2002','AC_ACCOUN', 8300, 0, 205, 110);



CREATE TABLE jobs (
  JOB_ID varchar(10) NOT NULL,
  JOB_TITLE varchar(35) DEFAULT NULL,
  MIN_SALARY int(6) DEFAULT NULL,
  MAX_SALARY int(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('AD_PRES','President', 20080, 40000),
('AD_VP','Administration Vice President', 15000, 30000),
('AD_ASST','Administration Assistant', 3000, 6000),
('FI_MGR','Finance Manager', 8200, 16000),
('FI_ACCOUNT','Accountant', 4200, 9000),
('AC_MGR','Accounting Manager', 8200, 16000),
('AC_ACCOUNT','Public Accountant', 4200, 9000),
('SA_MAN','Sales Manager', 10000, 20080),
('SA_REP','Sales Representative', 6000, 12008),
('PU_MAN','Purchasing Manager', 8000, 15000),
('PU_CLERK','Purchasing Clerk', 2500, 5500),
('ST_MAN','Stock Manager', 5500, 8500),
('ST_CLERK','Stock Clerk', 2008, 5000),
('SH_CLERK','Shipping Clerk', 2500, 5500),
('IT_PROG','Programmer', 4000, 10000),
('MK_MAN','Marketing Manager', 9000, 15000),
('MK_REP','Marketing Representative', 4000, 9000),
('HR_REP','Human Resources Representative', 4000, 9000),
('PR_REP','Public Relations Representative', 4500, 10500);



CREATE TABLE job_history (
  EMPLOYEE_ID int(6) DEFAULT NULL,
  START_DATE varchar(15) DEFAULT NULL,
  END_DATE varchar(15) DEFAULT NULL,
  JOB_ID varchar(10) DEFAULT NULL,
  DEPARTMENT_ID int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO job_history (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID) VALUES
(102,'13-01-2001','24-07-2006','IT_PROG', 60),
(101,'21-09-1997','27-10-2001','AC_ACCOUN', 110),
(101,'28-10-2001','15-03-2005','AC_MGR', 110),
(201,'17-02-2004','19-12-2007','MK_REP', 20),
(114,'24-03-2006','31-12-2007','ST_CLERK', 50),
(122,'01-01-2007','31-12-2007','ST_CLERK', 50),
(200,'17-09-1995','17-06-2001','AD_ASST', 90),
(176,'24-03-2006','31-12-2006','SA_REP', 80),
(176,'01-01-2007','31-12-2007','SA_MAN', 80),
(200,'01-07-2002','31-12-2006','AC_ACCOUN', 90);



CREATE TABLE locations (
  LOCATION_ID int(4) NOT NULL,
  STREET_ADDRESS varchar(40) DEFAULT NULL,
  POSTAL_CODE varchar(12) DEFAULT NULL,
  CITY varchar(30) DEFAULT NULL,
  STATE_PROVINCE varchar(25) DEFAULT NULL,
  COUNTRY_ID char(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO locations (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1000,'1297 Via Cola di Rie','00989','Roma','NULL','IT'),
(1100,'93091 Calle della Testa','10934','Venice','NULL','IT'),
(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),
(1300,'9450 Kamiya-cho','6823','Hiroshima','NULL','JP'),
(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),
(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),
(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),
(2000,'40-5-12 Laogianggen','190518','Beijing','NULL','CN'),
(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),
(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),
(2300,'198 Clementi North','540198','Singapore','NULL','SG'),
(2400,'8204 Arthur St','NULL','London','NULL','UK'),
(2500,'Magdalen Centre','The Oxford','Oxford','Oxford','UK'),
(2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK'),
(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),
(2800,'Rua Frei Caneca 1360','01307-002','Sao Paulo','Sao Paulo','BR'),
(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),
(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),
(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NG'),
(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal','MX');



CREATE TABLE regions (
  REGION_ID int(11) DEFAULT NULL,
  REGION_NAME varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



INSERT INTO regions (REGION_ID, REGION_NAME) VALUES
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa');