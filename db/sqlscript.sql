-- --------------------------------------------------------

--
-- Table structure for table `ipn_tblitems`
--

CREATE TABLE ipn_tblitems (
  recid int(11) NOT NULL AUTO_INCREMENT,
  item_number varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  item_name varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  item_title varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  item_description text COLLATE utf8_unicode_ci,
  item_description_full text COLLATE utf8_unicode_ci,
  mc_gross varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  item_image varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  publish int(11) NOT NULL DEFAULT '1',
  sortorder int(11) NOT NULL DEFAULT '100',
  pagetitle varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  metadescription text COLLATE utf8_unicode_ci,
  PRIMARY KEY (recid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `ipn_tblitems`
--
ALTER TABLE ipn_tblitems
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `item_name` (`item_name`);



--
-- Dumping data for table `ipn_tblitems`
--
INSERT INTO ipn_tblitems (item_number, item_name, item_title, item_description, item_description_full, mc_gross, item_image, publish, sortorder, pagetitle, metadescription) 
VALUES 
('Cork', 'Cork', 'Cork', "What do you get when you take the cork out of a bottle, you get a nice pop sound that makes everyone jump.", "Pop open a bottle and hopefully the cork will shoot up to the ceiling. If it doesn’t then you may feel a little disappointed.A dull dud pop is what you may get.The fizz will give it the pop so do we think that the bubbly is not quite as good if we don't get a good sound. Format: mp3 Size: 293 kBytes Length: 18 seconds",  '0.01', 'images/cork.jpg', '1', '100', 'Cork', NULL),
('Dial Up', 'Dial Up', 'Dial Up', "This is the kind of sound you use to get in the old days on phone line when dialing up with a modem.", "This is probably a sound that people only of a certain age will remember.  It is the sound of the start of the internet and you would hear it when you made you attempt to connect at some real slow data rate.  Format: mp3 Size: 39.5 kBytes Length: 2 seconds",  '0.02', 'images/dialup.jpg', '1', '100', 'Cork', NULL),
('Bottle', 'Bottle', 'Bottle', "This is a nice sound of a bottle being opened and then the contents poured out.  The metal cap is prised off the top of the bottle and it falls to the fall bouncing around.", "This is a nice sound of a bottle being opened and then the contents poured out.  The metal cap is prised off the top of the bottle and it falls to the fall bouncing around.  Format: mp3  Size: 202 kBytes  Length: 12 seconds",  '0.02', 'images/bottle.jpg', '1', '100', 'Cork', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `ipn_tblpaypal_currency`
--

CREATE TABLE ipn_tblpaypal_currency (
  recid int(11) NOT NULL AUTO_INCREMENT,
  currency_code varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  currency_symbol varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  currency_description varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (recid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


  --
-- Dumping data for table `ipn_tblpaypal_currency`
--

INSERT INTO ipn_tblpaypal_currency (currency_code, currency_symbol, currency_description) VALUES
('AUD', 'AUD $', 'Australian Dollar'),
('BRL', 'BRL R$', 'Brazilian Real'),
('CAD', 'CAD $', 'Canadian Dollar'),
('CHF', 'CHF Fr', 'Swiss Franc'),
('CZK', 'CZK K&#269;', 'Czech Koruna'),
('DKK', 'DKK kr', 'Danish Krone'),
('EUR', 'EUR &#8364;', 'Euro'),
('GBP', 'GBP &pound;', 'Pound Sterling'),
('HKD', 'HKD $', 'Hong Kong Dollar'),
('HUF', 'HUF Ft', 'Hungarian Forint'),
('JPY', 'YEN &yen;', 'Japanese Yen'),
('ILS', 'ILS', 'Israeli Shekel'),
('NOK', 'NOK kr', 'Norwegian Krone'),
('MYR', 'MYR RM', 'Malaysian Ringgits'),
('MXN', 'MXN N$', 'Mexican Peso'),
('NZD', 'NZD $', 'New Zealand Dollar'),
('PHP', 'PHP P', 'Philippine Pesos'),
('PLN', 'PLN z&#322;', 'Polish Zloty'),
('SEK', 'SEK kr', 'Swedish Krona'),
('SGD', 'SGD $', 'Singapore Dollar'),
('TWD', 'TWD $', 'Taiwan New Dollars'),
('THB', 'TWD B', 'Thai Baht'),
('USD', 'USD $', 'U.S. Dollar');


-- --------------------------------------------------------

--
-- Table structure for table `ipn_tblsetup`
--

CREATE TABLE ipn_tblsetup (
  recid int(11) NOT NULL DEFAULT '0',
  paypaladdress varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  sandbox_seller varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  sitetitle varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  metadescription text COLLATE utf8_unicode_ci,  
  cancel_url varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  return_url varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  notify_url varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  notify_sandbox_url varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  mc_currency varchar(10) COLLATE utf8_unicode_ci DEFAULT 'USD',
  currency varchar(20) COLLATE utf8_unicode_ci DEFAULT 'USD $',
  PRIMARY KEY (recid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table `ipn_tblsetup`


INSERT INTO ipn_tblsetup (recid, paypaladdress, 
                                sandbox_seller, sitetitle, metadescription, cancel_url, return_url, notify_url, notify_sandbox_url) 
                            VALUES 
                            ('1', 'paulvgibbs@gmail.com', 
                                NULL, NULL ,NULL, NULL, NULL, NULL, NULL);


CREATE VIEW ipn_view_publishedproducts AS
	SELECT
	ipn_tblitems.recid, ipn_tblitems.item_number,
	ipn_tblitems.item_name, ipn_tblitems.item_title, ipn_tblitems.item_description, 
    ipn_tblitems.item_description_full, ipn_tblitems.mc_gross,	
	(SELECT mc_currency FROM ipn_tblsetup WHERE recid = 1) AS mc_currency,     
	(SELECT currency FROM ipn_tblsetup WHERE recid = 1) AS currency,
	ipn_tblitems.item_image,  ipn_tblitems.publish, ipn_tblitems.sortorder,
    ipn_tblitems.pagetitle, ipn_tblitems.metadescription
	FROM
	ipn_tblitems
	WHERE publish = 1
	ORDER BY ipn_tblitems.sortorder;



