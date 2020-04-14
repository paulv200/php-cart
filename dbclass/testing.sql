-- --------------------------------------------------------

--
-- Table structure for table `tblitems`
--

CREATE TABLE tblitems (
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
-- Indexes for table `tblitems`
--
ALTER TABLE tblitems
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `item_name` (`item_name`);



--
-- Dumping data for table `tblitems`
--
INSERT INTO tblitems (item_number, item_name, item_title, item_description, item_description_full, mc_gross, item_image, publish, sortorder, pagetitle, metadescription) 
VALUES 
('Cork', 'Cork', 'Cork', "What do you get when you take the cork out of a bottle, you get a nice pop sound that makes everyone jump.", "Pop open a bottle and hopefully the cork will shoot up to the ceiling. If it doesn’t then you may feel a little disappointed.A dull dud pop is what you may get.The fizz will give it the pop so do we think that the bubbly is not quite as good if we don't get a good sound. Format: mp3 Size: 293 kBytes Length: 18 seconds",  '0.01', 'images/cork.jpg', '1', '100', 'Cork', NULL),
('Dial Up', 'Dial Up', 'Dial Up', "This is the kind of sound you use to get in the old days on phone line when dialing up with a modem.", "This is probably a sound that people only of a certain age will remember.  It is the sound of the start of the internet and you would hear it when you made you attempt to connect at some real slow data rate.  Format: mp3 Size: 39.5 kBytes Length: 2 seconds",  '0.02', 'images/dialup.jpg', '1', '100', 'Cork', NULL),
('Bottle', 'Bottle', 'Bottle', "This is a nice sound of a bottle being opened and then the contents poured out.  The metal cap is prised off the top of the bottle and it falls to the fall bouncing around.", "This is a nice sound of a bottle being opened and then the contents poured out.  The metal cap is prised off the top of the bottle and it falls to the fall bouncing around.  Format: mp3  Size: 202 kBytes  Length: 12 seconds",  '0.02', 'images/bottle.jpg', '1', '100', 'Cork', NULL);


CREATE VIEW view_publisheditems AS
	SELECT
	tblitems.recid, tblitems.item_number,
	tblitems.item_name, tblitems.item_title, tblitems.item_description, 
    tblitems.item_description_full, tblitems.mc_gross,
	tblitems.item_image,  tblitems.publish, tblitems.sortorder,
    tblitems.pagetitle, tblitems.metadescription
	FROM
	tblitems
	WHERE publish = 1
	ORDER BY tblitems.sortorder;



