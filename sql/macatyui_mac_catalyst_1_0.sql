-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2018 at 06:16 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `macatyui_mac_catalyst_1.0`
--
CREATE DATABASE IF NOT EXISTS `macatyui_mac_catalyst_1.0` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `macatyui_mac_catalyst_1.0`;

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

DROP TABLE IF EXISTS `adverts`;
CREATE TABLE `adverts` (
  `ID` int(11) NOT NULL,
  `Advert_type` int(11) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `Image` varchar(1000) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Company` varchar(1000) NOT NULL,
  `Created_by` int(11) NOT NULL,
  `Last_Updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adverts`
--

INSERT INTO `adverts` (`ID`, `Advert_type`, `Active`, `Image`, `Start_Date`, `End_Date`, `Company`, `Created_by`, `Last_Updated_by`) VALUES
(1, 2, 1, 'advert.jpg', '2018-02-19', '2018-02-22', 'Testing', 1, 1),
(3, 3, 1, 'advert.jpg', '2018-02-19', '2018-02-15', 'Test', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `advert_type`
--

DROP TABLE IF EXISTS `advert_type`;
CREATE TABLE `advert_type` (
  `ID` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `description` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advert_type`
--

INSERT INTO `advert_type` (`ID`, `Name`, `description`) VALUES
(1, 'Top_Banner', 'Banner on top next to the logo'),
(2, 'Side_Banner_Top', 'Side banner on the right side on top and above the fold'),
(3, 'Side_Banner_Middle', 'Side banner on the right side in middle and above the fold'),
(4, 'Side_Banner_bottom', 'Side banner on the right side on bottom and above the fold '),
(5, 'Side_Banner_Footer', 'Side banner on the right side footer and below the fold'),
(6, 'Middle_Banner', 'At the center of the website below breaking news'),
(7, 'Footer_Banner', 'At the bottom of the website below latest news');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `INFO` varchar(5000) NOT NULL,
  `LOGO` varchar(5000) NOT NULL,
  `PROFILE` int(11) NOT NULL,
  `STATUS` tinyint(1) NOT NULL,
  `REG_DATE` date NOT NULL,
  `DEACTIVATED_DATE` date DEFAULT NULL,
  `Address` varchar(500) NOT NULL,
  `PHONE` varchar(13) NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `WEBSITE` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`ID`, `NAME`, `INFO`, `LOGO`, `PROFILE`, `STATUS`, `REG_DATE`, `DEACTIVATED_DATE`, `Address`, `PHONE`, `EMAIL`, `WEBSITE`) VALUES
(1, 'SAMSUNG', 'Samsung is a South Korean multinational conglomerate company  Samsung is a South Korean multinational conglomerate Since its founding in Suwon, Korea in 1969, Samsung Electronics has grown into a global information technology leader, managing more than 200 subsidiaries around the world.\nThe company’s offerings include home appliances such as TVs, monitors, refrigerators, and washing machines as well as key mobile telecommunications products like smartphones and tablets. Samsung also continues to be a trusted provider of key electronic components like DRAM and non-memory semiconductors.\nSamsung pledges to create and deliver quality products and services that enhance convenience and foster smarter lifestyles for its customers around the world. Samsung is dedicated to improving the global community through its constant pursuit of groundbreaking innovations and value creation.company headquartered in Samsung Town, Seoul. Its primary products are apparel, chemicals, consumer electronics, electronic components, medical equipment, semiconductors, ships, telecommunications equipmentSamsung is a South Korean multinational conglomerate Since its founding in Suwon, Korea in 1969, Samsung Electronics has grown into a global information technology leader, managing more than 200 subsidiaries around the world.\nThe company’s offerings include home appliances such as TVs, monitors, refrigerators, and washing machines as well as key mobile telecommunications products like smartphones and tablets. Samsung also continues to be a trusted provider of key electronic components like DRAM and non-memory semiconductors.\nSamsung pledges to create and deliver quality products and services that enhance convenience and foster smarter lifestyles for its customers around the world. Samsung is dedicated to improving the global community through its constant pursuit of groundbreaking innovations and value creation.company headquartered in Samsung Town, Seoul. Its primary products are apparel, chemicals, consumer electronics, electronic components, medical equipment, semiconductors, ships, telecommunications equipmentheadquartered in Samsung Town, Seoul. Its primary products are apparel, chemicals, consumer electronics, electronic components, medical equipment, semiconductors, ships, telecommunications equipment.', 'samsung.jpg', 1, 1, '2017-09-03', NULL, '111 Brixton, Johannesburg', '+27713829233', 'Raduvha.tj@gmail.com', 'www.themba.com'),
(2, 'apple', 'Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services.', 'apple.jpg', 1, 1, '2017-09-03', NULL, '', '', '', ''),
(3, 'lg', 'LG is the best mobile phone of all the mobile phone companies. LG is fully technologically compliant, flexible, strong, and easily and fast connection to network system. It is better than Nokia in very ramification. Nokia is widely sold because it is cheaper.', 'lg.jpg', 2, 1, '2017-09-03', NULL, '', '', '', ''),
(4, 'Asus', 'ASUSTeK Computer Inc. stylized as SUS is a Taiwanese multinational computer hardware and electronics company headquartered in Beitou District Taipei Taiwan.', 'asus.jpg', 1, 1, '2017-09-03', NULL, '', '', '', ''),
(5, 'Lenovo', 'Lenovo Group Ltd. is a Chinese multinational technology company with headquarters in Beijing, China, and Morrisville, North Carolina, United States.', 'lenovo.jpg', 1, 1, '2017-09-03', NULL, '', '', '', ''),
(6, 'Acer', 'Acer Inc. is a Taiwanese multinational hardware and electronics corporation specializing in advanced electronics technology and is headquartered in Xizhi, New Taipei City, Taiwan.', 'acer.jpg', 1, 1, '2017-09-03', NULL, '', '', '', ''),
(8, 'RODEO TOUCH', 'RodeoTouch is a wholly black owned Company, that has its business cornerstone firmly entrenched in the seamless and efficient execution of events and marketing campaigns. We work hand-in-glove with established companies in order to expose them to their relevant markets through events, promotional campaigns and activations in order for them to increase market exposure and for them to engage with their prospective clientele.</br></br>\r\n\r\nOur efficient and effective execution of events and campaigns is our biggest asset, but our real edge comes in the form of our management and style of communication with the relevant role players. WE ARE PERSONAL !</br></br>\r\n\r\nWe are personal in our engagement with our crew and clients because we feel this builds a greater bond than just monetary motivation. We believe in owning every event and treating it as if it was our last. This is what sets us apart from the chasing pack our dedicated attention to detail, as well as that human touch.RodeoTouch is a diverse organization that deals primarily with the sourcing, supplying and management of all events related activities ranging from invite preparation to on-site management and everything in-between .</br></br>\r\n\r\nWe also supply staff to corporate companies and to other event companies for various work that ranges from expo’s, exhibitions, events, promotions and general office administration work.</br></br>\r\n\r\nRodeoTouch is based in Johannesburg Gauteng (Head office), and we have branches in Cape Town, Durban, Port Elizabeth and other small cities. Our reach is national as well as international (Neighboring Countries: Botswana, Swaziland, Lesotho ,Mozambique and Malawi). We have displayed to our clients, with distinction the size of our national as well as international footprint by being part and parcel of several major events as well as major campaigns that not only illustrate our capabilities but also our reach.\r\n\r\nRodeoTouch has a total black male member’s interest of 100%. We have a B-BBEE status of Level Three Contributor and a B-BBEE procurement recognition of 110%.', 'rt_white-smaller.JPG', 1, 1, '2017-09-27', NULL, 'Building B\r\n4 Kikuyu Road\r\nSunninghill\r\n\r\n\r\n', '061 495 4013', 'info@rodeotouch.com', 'www.rodeotouch.com'),
(9, 'KWANTU GROUP', 'Kwantu Group (Pty) Ltd is the brainchild of Magcina Mike Tyulu. With exposure in the fuel and logistics space, opportunities presented themselves which gave birth to Kwantu Group. The concept has evolved to include consulting services which supports the initial vision and leverages past experiences and relationships to offer SME’s access to markets and bolster their business processes.\r\n<h>MMission</h>\r\nOur mission is to be customer centric and ensure that we are fulfilling our clients’ needs as best as possible while ensuring organizational efficiency with the services we provide. We aim to grow with our clients’ business by offering solutions that speak to their needs. Kwantu Group will always strive to merge quality, lowest cost and time efficiency in its processes with an aim to keep operations at optimal capacity.', 'KWANTU1.PNG', 1, 1, '2017-10-22', NULL, 'info@kwantugroup.com', '+27725566138 ', 'info@kwantugroup.com', 'http://www.kwantugroup.com'),
(10, 'Simply Fresh Productions', 'Welcome to Simply Fresh Productions.\r\n\r\nSimply Fresh Productions is an urban social events company. Whether you come to us to organize, run your whole event. We don''t stop there, we can organise/run various parts of your event from bars, door, tickets, fencing, branding and more. We are your ultimate event consultants. If it''s an events idea we got you!\r\nI messed that up it still doesn''t make sense.\r\n\r\nWith our young, enthusiastic, energetic and eager team no task is too big, too small, too complicated or too simple. "Simply" put, with us all is "Fresh".\r\n\r\nA world full of happiness, smiles, entertainment and indeed the lifestyle. Join our lifestyle/journey as we take you from one event to another, from indoor to outdoor events, from straight turn up to braai''s with your mates on a Sunday(Rooftop Vibes). Question, If not why not... It''s that simple as SIMPLY FRESH PRODUCTIONS ', 'IMG_2914.JPG', 1, 1, '2017-10-22', NULL, 'Kgatle.elphas@gmail.com', '079 612 2489', 'ksepharatla@yahoo.com', 'Kgatle.elphas@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `companies_services`
--

DROP TABLE IF EXISTS `companies_services`;
CREATE TABLE `companies_services` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `IMAGE` varchar(100) NOT NULL,
  `CompanyID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies_services`
--

INSERT INTO `companies_services` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE`, `CompanyID`) VALUES
(1, 'Web Development', 'We develop website for companies of any size, small to big, our prices are among the lowest in the industry', '1.jpg', 1),
(2, 'Mobile Development', 'We develop mobile application for individuals, organizations tailored to your eequirements', '2.jpg', 1),
(3, 'Reporting', 'We provide different reporting services to different indurstrpf sfslmllsfldsl  dfdk klefjsd', '3.jpg', 1),
(4, 'EVENTING SERVICES', 'RodeoTouch helps with the concept development process of every clients eventing needs. Our event planning deals with implementation on the ground at the event and all peripheral activities that form part of the event. Our eventing scope consists of the following : Corporate Theatre, Stage Productions, Consumer Events, Training, Roadshows & Exhibitions, Conferences, Award Ceremonies, Product Launches and Team Building.', 'Rodeo1.png', 8),
(5, 'STAFF PLACEMENTS', 'We supply staff/crew for events ,corporate companies and to other event companies for various work that ranges from Production Managers, Stage Managers, Ushers, Hosts, Hostesses ,Parking/Valet Attendants and staff for general office administration work - Marketing surveys, Inbound and Outbound Call Centre Logistics (Event Specific) Transcribing and Data Capturing and much more...', 'rodeo2.png', 8),
(6, 'CORPORATE GIFTING', 'We supply the corporate gifting service to our clients and those who need any gifts, clothing, memorabilia for their events. We do our utmost best to exceed expectation with the quality of gifts and always try to bring fresh new ideas that speak to the theme, message of the event or company.', 'rodeo3.png', 8),
(7, 'ENTERTAINMENT', 'We have amongst our ranks, some of the most exciting and versatile talented artists who perform amazing cover version and perform their own pieces/productions too. These talents can entertain small and big crowds.', 'rodeo4.png', 8),
(9, 'Consulting', 'Each client will be treated with the utmost respect paying high regard to each detail\r\nof their business. The main goal will be to grow their business and a results oriented\r\napproach linked to business goals will be adopted.', 'sv2.jpg', 9),
(11, 'Logistics', 'We offer brokering services to service your transport requirements by getting you the best rates for tippers, flatbed trailers, LPG and fuel tankers, ensuring safe delivery of your goods from pick up to drop off.', 'future-of-logistics-drone-deliver.jpg', 9),
(12, 'Trading', 'Our produce will be kept fresh and a consistent cold chain will be applied to\r\nguarantee this. Constant communication and working with our stakeholders means\r\nthat our produce will always be of the best quality, arriving in a timely manner.', 'sv1.jpg', 9),
(13, 'Products and/or Services', 'Kwantu Group’s products and/or service offering can be divided into the following\r\nareas:\r\nConsulting (Business Development and Introduction Services)\r\n Logistics Services (Tipper, Flatbed Trailer and Fuel Tanker deliveries); and\r\n Trading (Fresh Produce including Patty Pans, Baby Marrow, Melons, Chillies,\r\nBaby Butternut, Baby Gem Squash, etc).', 'kwantu1.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `company_adverts`
--

DROP TABLE IF EXISTS `company_adverts`;
CREATE TABLE `company_adverts` (
  `id` int(11) NOT NULL,
  `advert_type` varchar(15) NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_name` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `advert_status` tinyint(1) NOT NULL,
  `slide_number` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_adverts`
--

INSERT INTO `company_adverts` (`id`, `advert_type`, `date_posted`, `company_name`, `image`, `advert_status`, `slide_number`) VALUES
(1, 'standard', '2017-10-26 15:54:26', 'joburg', 'poster8.jpg', 1, 1),
(2, 'standard', '2017-10-26 15:54:19', 'music', 'poster2.jpg', 1, 2),
(3, 'standard', '2017-10-26 15:54:10', 'artist', 'poster7.jpg', 1, 3),
(4, 'standard', '2017-10-26 15:54:03', 'Samsung', 'poster.jpg', 1, 0),
(5, 'standard', '2017-10-26 12:58:23', 'artist', 'poster5.jpg', 1, 5),
(6, 'standard', '2017-10-26 12:27:45', 'artist', 'poster4.jpg', 1, 0),
(7, 'standard', '2017-10-26 15:53:56', 'kapa', 'poster6.jpg', 1, 3),
(8, 'standard', '2017-10-25 16:29:25', 'test', 'poster.jpg', 1, 1),
(9, 'standard', '2017-10-25 16:32:24', 'test', 'poster1.jpg', 1, 2),
(10, 'standard', '2017-10-25 16:30:22', 'test', 'poster3.jpg', 1, 3),
(11, 'standard', '2017-10-26 12:54:05', 'test', 'poster.jpg', 1, 4),
(12, 'exclusive', '2017-10-26 15:55:32', 'test', '6.jpg', 1, 1),
(13, 'exclusive', '2017-10-26 15:56:15', 'test', 'banner.jpg', 1, 2),
(14, 'exclusive', '2017-10-26 15:56:06', 'test', 'cape_town.jpg', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Message` varchar(500) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`ID`, `Name`, `Email`, `Message`, `Date`) VALUES
(3, 'Gabriel', 'e30Fever@E30fever.com', 'Mobile submit not working.', '2016-02-21 08:16:42'),
(4, 'Gabriel', 'e30Fever@E30fever.com', 'So the website is fully, or semi functional now from a pc and phone respictively, just one more touch and we are done.\n\nRegards\nGabriel', '2016-02-21 10:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `industry`
--

INSERT INTO `industry` (`id`, `name`, `description`) VALUES
(1, 'TECHNOLOGY', 'N/A'),
(2, 'EDUCATION', ''),
(3, 'HR AND RECRUITMENT', 'N/A'),
(4, 'FINANCE', '');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `TYPE` tinyint(1) NOT NULL,
  `REG_DATE` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(50) NOT NULL,
  `MESSAGE` varchar(2000) NOT NULL,
  `SENDER` varchar(200) NOT NULL,
  `MESSAGE_STATUS` tinyint(1) NOT NULL,
  `DATE` date NOT NULL,
  `CONTACT` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`ID`, `SUBJECT`, `MESSAGE`, `SENDER`, `MESSAGE_STATUS`, `DATE`, `CONTACT`) VALUES
(1, 'test', 'we test', 'themba', 1, '2017-09-18', '0713829233'),
(2, 'ddfd', 'ddd', 'ereertr', 1, '2017-09-18', 'fddfdf');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `Headline` varchar(50) NOT NULL,
  `Author` varchar(50) NOT NULL DEFAULT 'E30Fever',
  `Content` varchar(10000) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Image` varchar(500) NOT NULL,
  `Industry` int(11) NOT NULL,
  `Breaking_news` tinyint(1) NOT NULL,
  `Views` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`ID`, `Headline`, `Author`, `Content`, `Date`, `Image`, `Industry`, `Breaking_news`, `Views`, `user_id`) VALUES
(1, 'Business News: Baic’s', 'THEMBA', 'A key contractor involved in Chinese car maker Baic’s R11 billion Coega project has appealed for no more disruptions, as it is already several months behind schedule.\r\n', '2018-02-18 18:52:05', 'c1.jpg', 1, 1, 0, 1),
(2, ' Currie Cup Final', 'THEMBA', '. Saturday’s Currie Cup final between the Sharks and Western Province in Durban will be the eighthcontested between the teams.\nThe first final dates back to 1984, with Western Province holding a 4-3 overall edge.\n1984 and 1995: Western Province vs Natal Sharks, Cape Town.\nNatal, as the Sharks were then called, surprisingly made the final when they took advantage of a "strange" ruling enforced by the old South African Rugby Board.\nNatal, winners of the B-section, were allowed a chance to play for a spot in the A-section final by hosting a semi-final against the second-placed team in the A-section. \nThey stunned Free State 26-15 in the semi-finals in Durban and booked their spot in the final against high-flying WP at Newlands. Natal, under the leadership of Springbok No 8 Wynand Claassen, threatened a major upset when they led 9-3 at the break.\n WP however took charge in the second period and ran out comfortable victors. If was a hat-trick of Currie Cup titles for WP and they would go on to set the record of five title triumphs in a row.\nNatal’s French flyhalf Thierry Lacroix proved Western Province’s undoing by contributing 20 points with the boot at a wet Kings Park. \nThis was the last Currie Cup final of the old amateur era where six teams played in the Currie Cup A-section. Apart from Lacroix, Natal also had French lock Olivier Roumat among their ranks, while Western Province had France flank Laurent Cabannes. \nThe French trio had earlier in the year played in the memorable Rugby World Cup hosted in South Africa.\n2000 and 2001: Natal Sharks vs Western Province, Durban.\n2000 - Western Province went into the final as underdogs, having lost to the Sharks at Newlands a few weeks earlier. However, they silenced Kings Park by scoring three tries to nil, with Springbok wing Breyton Paulse bagging a brace.\n This was the game where Paulse famously executed his trademark handstand-somersaults after scoring.\n2001 - Western Province overcame a 17-6 first half deficit to again silence the Sharks, this time at Newlands. The Sharks outscored WP by three tries to two, but Springbok centre Braam van Straaten’s deadly boot proved the difference for WP. Van Straaten contributed 24 points, including a try.\n2010, 2012 and 2013: Sharks vs Western Province\n2010 - This game will be remembered as the match where 20-year-old flyhalf Pat Lambie came of age. Lambie scored 25 points, including two tries, as the Sharks thrashed a shell-shocked WP.\n The Capetonians came into the game confident having convincingly beaten the Sharks 33-21 at Newlands a few weeks earlier, but left Kings Park with egg on their face. Lambie’s famous hand-off of Schalk Burger has become part of Currie Cup final folklore.\n2012 - This game will go down as one of the great upsets in Currie Cup finals history. Injuries to several frontline players forced Western Province to take a young side to Kings Park and few gave them a chance against a Springbok-laden Sharks outfit.\n The day will best be remembered for WP flyhalf Demetri Catrakilis’ heroics with the boot, which included a left-footed drop kick. WP centre Juan de Jongh’s spectacular first half try off a scrum also stands out and helped WP claim their first Currie Cup title in 11 years.\n2013 - A year later Western Province were the favourites when they hosted the Sharks in the final at Newlands. WP had beaten the Sharks 17-13 in Durban two weeks beforehand, but failed to pitch in front of their home fans. \nScrumhalf Charl McLeod’s intercept try in the sixth minute set the tone as Brendan Venter’s Sharks produced a tactical masterclass to win in convincing fashion\n', '2018-02-18 18:53:57', 'c22.jpg', 2, 1, 0, 1),
(3, 'Public Protector Breaking News', 'E30Fever', 'An inquiry into Public Protector Busisiwe Mkhwebane will no longer go ahead, after African National Congress MPs in the Portfolio Committee on Justice and Correctional Services shut down the process on Wednesday. From the beginning of Wednesday''s proceedings, MPs seemed to be on different pages after ANC MPs claimed they had not received the requisite documents that all other MPs had received. Then, the majority ANC caucus disagreed with all the opposition MPs that they had agreed, on October 10, to hold an inquiry into Mkhwebane''s conduct at a committee meeting.\r\nANC MP Madipoane Mothapo said they had only agreed to "look into the matter" at portfolio committee level. Her colleague Loyiso Mpumlwana said they had to still decide if there "was a need" for an inquiry. Committee chairperson Mathole Motshekga - whose initial statement on October 10 read: "Portfolio committee agrees to hold inquiry into request to remove public protector" - also backtracked, and agreed with his ANC colleagues. He said they had only agreed to "look into" the matter, and they must now decide if there was a basis, as per National Assembly Speaker Baleka Mbete''s referral to the committee.\r\nOpposition MPs were not happy.\r\nAfrican Christian Democratic Party MP Steve Swart said it was on record that the committee had decided between setting up an ad hoc committee to hold an inquiry, or whether to hold the inquiry themselves. They had decided to hold an inquiry themselves. Economic Freedom Fighters MP Sam Matiase said they already agreed to hold the inquiry. That was the first question they had asked themselves on October 10. Democratic Alliance MP Glynnis Breytenbach said it would be highly irrational to dismiss the matter now based only on a letter of request to begin proceedings.\r\nThey needed to summon witnesses to deal with the merits of the case. "I cannot stress enough the need to act rationally here. That is something we learnt from the Nkandla judgment," she said. Both Motshekga and ANC whip in the committee Makgathatso Pilane-Majake dismissed their objections.\r\n', '2018-02-18 18:57:02', 'c33.jpg', 3, 1, 0, 1),
(4, ' Finance Minister Budget News', 'THEMBA', '\r\nFinance Minister Malusi Gigaba''s maiden budget performance in Parliament on Wednesday afternoon did not leave any room for celebration, and government''s finances and prospects over the next three years do not present a rosy picture.\r\n\r\nLow economic growth (down to an expected 0.7% this year) has resulted in skyrocketing risks, with the Medium-term Budget Policy Statement talking about “SA confronting a low-growth trap".\r\n\r\nThe projected revenue shortfall was higher than expected at R50.8bn (for the 2017/18 budget), resulting in an increasing budget deficit and a substantial debt risk hike. At about 15%, debt repayment costs are already the biggest budget item.\r\n\r\nThe biggest disappointment of Gigaba’s speech was the lack of real new initiatives or measures to stimulate growth or cut government expenses. The plans sound very familiar, and phrases like "an interministerial committee will look at that”, “announcements will be made later (in February)" or “some programmes will need to be eliminated, or funding reduced" are downright unacceptable. \r\n\r\nThe mini budget is quite frank about government''s predicament, but there is no mention of where the money for shortfalls will really come from, except maybe "the selling of assets" and tax increases. Gigaba seems to be "referring" and postponing all the contentious issues - from public service wage hikes to nuclear power and the water crisis in the Western Cape.\r\n\r\nThere was no mention of tax hikes or plans for new taxes, although South Africans can brace themselves for increases next February. The mini budget said though that there is "little space for tax increases in the current environment”.\r\n\r\nThere is still an attempt at reassurance, with statements like “government remains committed to a path of fiscal consolidation", "it will maintain the expenditure ceiling" and "a presidential task team will develop proposals to restore fiscal sustainability”.\r\nBut then the usual suspects like radical economic transformation, contributions to transformation and inclusive growth and a redistributive and progressive budget are also still there. \r\n\r\nOne must admit that Gigaba was in a tight spot, with revenue resources under pressure and mounting spending needs. But then again, what do you expect when well-intentioned warnings are simply disregarded by government? \r\n\r\nThe highlights of the mini budget are:\r\n\r\n• Tax: South Africans will probably pay more taxes from next year (detail in next February’s budget), but no details were given. The mini budget suggests the possibility of a "profound shift in the relationship between economic growth and tax collection” in that “tax buoyancy - the expansion of revenue associated with economic growth, has fallen significantly in the past two years”.\r\nWhether that means less effective tax collection or "less willing" taxpayers, is not clear. Over the three years to 2019/20 the projected tax shortfall will be a massive R209bn.\r\n\r\nGigaba did talk about “noting a slippage in tax compliance” in his speech. “I am engaging with the commissioner of SARS (the  South African Revenue Service) on the recommendations made in August by the tax ombud, and to take concrete and practical steps to help improve taxpayer confidence (on delays in refunds)," he said. \r\n   \r\n• Economic growth has slowed and the February projection of 1.3% has been lowered to 0.7%, still higher than the 0.5% recently projected by the International Monetary Fund. Economic growth is expected to recover slowly, reaching 1.9% in 2020.\r\nThe weaker growth outlook reflects a continued deterioration in business and consumer confidence that has gathered pace since 2014, the mini budget mentions. However, the international economic outlook is improving.\r\n\r\n• Risks to fiscal framework: The consolidated budget deficit for 2017/18 is expected to be 4.3% of GDP, compared with a 2017 Budget estimate of 3.1%. The main budget deficit, which determines government’s net borrowing requirement, will be 4.7% of GDP this year.\r\nAdditional risks to the framework include more financial demands from state-owned enterprises (SOEs), public service compensation pressures and new spending commitments, particularly in higher education. Government guarantees for SOEs have jumped to R445bn. \r\n\r\n• National debt: Gross national debt is projected to reach over 60% of GDP by 2022, with debt service costs reaching 15% of main budget revenue by 2020/21. Debt service costs (R163.3bn this year, rising to R223.4bn by 2020/21) are the biggest single item on the budget, and at 11% per year the fastest rising category. The gross debt-to-GDP outlook has worsened from February''s projected 51.9% of GDP by 2022 to the current revised figure of 60.8%. \r\n\r\n• Risks of spending on SOEs: Government''s total guarantees on SOE lending have jumped to R445bn. Unprofitable state firms are putting huge pressure on the fiscus. Their average profitability fell from 7.5% in 2011/12 to just 0.2% in 2016/17.\r\nThat increased their risk premium - and thus debt costs - substantially. The recapitalisation of South African Airways (total of R10bn) and the South African Post Office lifted the lid breach on the expenditure ceiling by R3.9bn. The guarantees are government''s major explicit contingent liabilities.\r\n\r\n• Spending priorities: The fastest growing elements of spending are learning and culture (including post-school education and training) and health and community development, with growth rates of 7.6%, 7.5% and 7.9% respectively. It is stated that government is protecting expenditure that delivers services to low-income households. However, additional resources to support spending priorities are severely limited.\r\n\r\nFurthermore, seven expenditure priorities for the medium-term expenditure framework period are mentioned:\r\n\r\n• Job-creation and small business development;\r\n\r\n• Youth development;\r\n\r\n• Infrastructure expansion and maintenance;\r\n\r\n• Land reform, smallholder farmer and agriculture development;\r\n\r\n• Comprehensive social security, education and skills;\r\n\r\n• An integrated plan to fight crime; and\r\n\r\n• Advancing the national interest in the Southern African Development Community throughout Africa, and through participation in the BRICS (Brazil, Russia, India, China and South Africa) bloc and the Indian Ocean Rim Association.\r\n\r\nNothing is said about big projects like the nuclear energy new build plan or the national health insurance scheme. The only mention is that the latter will increase spending on health by 2025. Announcements will either be made later, or have been put on hold for the time being\r\n', '2018-02-18 18:58:25', 'C44.jpg', 4, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `ID` int(11) NOT NULL,
  `COMPANY` varchar(200) NOT NULL,
  `POST` varchar(10000) NOT NULL,
  `FILE` varchar(200) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `SUBJECT` varchar(200) DEFAULT NULL,
  `SUMMARY` varchar(200) NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VIEWS` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`ID`, `COMPANY`, `POST`, `FILE`, `COMPANY_ID`, `DATE`, `USER_ID`, `ACTIVE`, `TYPE`, `SUBJECT`, `SUMMARY`, `TIMESTAMP`, `VIEWS`) VALUES
(1, 'SAMSUNG', 'Samsung is a South Korean multinational conglomera.Samsung is a South Korean multinational conglomera...Samsung is a South Korean multinational conglomera...Samsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\n\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\nSamsung is a South Korean multinational conglomera...\n\n', 'c1.jpg', 1, '2017-09-03', 1, 1, 1, 'FINANCE', 'Samsung is a South Korean multinational ', '2018-02-14 18:39:51', 2),
(2, 'Apple', 'Apple Inc. is an American multinational technology.', 'c22.jpg', 2, '2017-09-03', 1, 1, 1, 'TECHNOLOGY', 'Apple Inc. is an American multinational technology.', '2018-02-14 19:01:45', 3),
(3, 'LG', 'LG is the best mobile phone of all the mobile phon...', 'c33.jpg', 3, '2017-09-03', 1, 1, 1, 'HR&RECRUITING', 'LG is the best mobile phone of all the mobile ', '2018-02-14 19:01:51', 0),
(4, 'Asus', 'ASUSTeK Computer Inc. stylized as SUS is a Taiwane...', 'c44.jpg', 4, '2017-09-03', 1, 1, 1, 'EDUCATION', 'ASUSTeK Computer Inc. stylized as SUS is a ', '2018-02-14 19:02:01', 0),
(5, 'Lenovo', 'Lenovo Group Ltd. is a Chinese multinational techn...', 'lenovo.jpg', 5, '2017-09-03', 1, 1, 1, 'FINANCE', 'Lenovo Group Ltd. is a Chinese multinational ', '2018-02-14 18:05:13', 0),
(6, 'Acer', '	\r\nAcer Inc. is a Taiwanese multinational hardware an...', 'acer.jpg', 1, '2017-09-03', 1, 1, 1, 'EDUCATION', 'Acer Inc. is a Taiwanese multinational hardware an...', '2018-02-14 18:05:25', 0),
(7, 'MACATALYSTS', 'This is the company that the system is created for', 'aMORDEN AGE LOGO.jpg', 1, '2017-09-10', 1, 1, 1, 'TECHNOLOGY', 'Computer Inc. stylized as SUS is a', '2018-02-14 18:05:42', 0),
(8, 'SAMSUNG', 'Samsung Medison, a global medical equipment company and an affiliate of Samsung Electronics, is hosting a number of seminars at the 27th World Congress of the International Society of Ultrasound in Obstetrics & Gynecology (ISUOG) in Vienna. Through 13 sessions at Samsung’s Satellite Symposium, leading medical professionals are publicizing the clinical benefits of Samsung’s ultrasound imaging solutions for women’s health.', 'sam1.jpg', 1, '2017-09-17', 1, 1, 1, 'HR&RECRUITING', 'ultrasound imaging solutions for women’s health.', '2018-02-14 18:06:00', 0),
(9, 'SAMSUNG', 'Now we all know it’s possible, as he was successful at achieving this with filling up Ticketpro Dome, a 20 000 seater, and Orlando Stadium, a 40 000 seater.\r\nOn December 2, the rapper plans to host the biggest hip-hop concert in the world at FNB stadium, which has a 90 000-plus capacity.\r\nIt has been reported that Cassper will be releasing the DVD for last year’s Fill Up Orlando Stadium.\r\nSo if he manages to pull this off, he would have broken a record that not even international artists have managed to achieve.\r\n“This year’s concert demands too much effort, as far as his creativity and energy are concerned,” he told Sunday Sun.\r\nHe also told the publication he’s been working very hard to ensure his fans get value for their money.\r\nHere are the  five reasons we will attend Fill Up FNB stadium:\r\n1.	We know Cassper has been hitting the gym hard as he is prepping for the big concert, so ladies, we know you want to peep those abs.\r\n2.	Cassper became the first South African artist to deliver such a world-class production, with a drone, LED screens and lighting that’s out of this world, as well as a rotating stage. Now, hopefully the stage setup will also be as lit as at Fill Up Orlando Stadium.\r\n3. We are very curious to know who the MCs at this year’s concert are because last year he had Somizi and ex-girlfriend Boity as MCs. The rapper has been very low-key about his love life this year, so let’s hope we are finally going to meet Mrs Nyovest.\r\n4. We all know that Cassper has very expensive taste when it comes to shoes. At the Dome, he wore Maison Martin Margiela sneakers worth R20 000, so we are wondering what boutique and luxury outfit he is going to rock this time around.\r\n5. We want to see who his opening acts are, because the previous years, he had the likes of Nasty C, Babes Wodumo, Nadia Nakai, DJ Fresh and Euphonik to entertain the crowds.\r\n', 'news11.jpg', 1, '2017-09-17', 1, 1, 1, '\r\nCassper Nyovest: Filling Up FNB Stadium\r\n', '\r\nCassper Nyovest: Filling Up FNB Stadium\r\n', '2017-10-27 12:23:32', 6),
(10, 'SAMSUNG', 'Local equities closed firmer on Monday during a relatively flat trading session on the JSE.\r\nTop movers included Tongaat Hulett [JSE:TON], which gained 2.70%, and Sappi [JSE:SAP] which gained 2.47%.\r\nBanking stocks firmed despite a weaker rand, which saw Barclays Africa [JSE:BGA], Nedbank [JSE:NED] and First Rand [JSE:FSR] all firming by 0.97%, 0.23% and 0.34% respectively.\r\nSubdued metal commodity prices did not deter gains among some of JSE-listed miners such as Anglo American PLC [JSE:AGL], AngloGold Ashanti [JSE:ANG] and BHP Billiton [JSE:BIL] which ended the day 2.34%, 1.55% and 0.61% up respectively.\r\nPioneer Foods [JSE:PFG] came under pressure following the release of a trading statement which indicated it is expecting a decrease in both its headline and attributable earnings per share. The stock shed 2.92% to close at R114.55 per share.\r\nOther major losers on the day included Exxaro Resources [JSE:EXX] which lost 3.36%, and the Rhodes Food Group [JSE:RFG] which shed 4.11%.\r\nRCL Foods [JSE:RCL] also came under pressure as it shed 4.01%.\r\nGold miners Gold Fields [JSE:GFI] and Harmony Gold [JSE:HAR] traded weaker on the back of softer Gold prices, to eventually close the day down 0.81% and 1.26% respectively.\r\nThe JSE All-Share index managed to eventually close up 0.09%, whilst the Top-40 index gained 0.13%.\r\nThe Industrials index shed 0.07%, the Resources index gained 0.79% and Financials index ended up 0.06%. \r\nDollar \r\nThe US dollar strengthened on Monday against a basket of major currencies as indicated by the US dollar index, which reached an intra-day high 94.002 index points. This resulted, in part, in the rand weakening to an intra-day low of R13.76 against the greenback.\r\nThe dollar retraced slightly towards the close of the JSE, and as a result the rand gained marginally to trade at R13.72/$ when the JSE closed.\r\nGold traded weaker on Monday due, in part, to the stronger dollar. The precious metal weakened to an intra-day low of $1 272.61 per ounce, before rebounding slightly to trade at $1 274.11/Oz when the local market closed.\r\n', 'news.jpg', 1, '2017-09-17', 1, 1, 1, 'JSE News', 'JSE News', '2017-10-27 12:19:34', 3),
(11, 'SAMSUNG', 'Transnet Port Terminals (TPT) came out on top at the recent PMR Africa Awards.\r\nTPT’s KZN terminals were recognised for the fifth consecutive year for their exceptional contributions to the KwaZulu Natal region with the Diamond Arrow award.\r\nThe results of these awards are based on PMR Africa’s annual country survey on the region of KwaZulu Natal that is independently-conceived, implemented and funded by PMR Africa. The ratings are sourced monthly from top decision makers to identify contributors to the economic growth and development of SA’s municipal districts, provinces and the SADEC countries.\r\n \r\nThe purpose of the PMR Africa survey that was conducted was to profile the KwaZulu Natal province as a growth point and potential investment area for foreign and local developers and investors.\r\nThe PMR Diamond Arrow Award in the business category for best Operator of Ports in the KwaZulu Natal - Port of Durban, was Transnet Port Terminals Durban. Not only did TPT receive a Diamond Award in the KZN region, but also, a PMR Golden Arrow Award awarded to Transnet Port Terminal’s Richard’s Bay operations for the same business category.\r\nThe purpose of the PMR Africa Awards is to not only enhance excellence and set a benchmark in the respective industries, but to also acknowledge personnel and staff for creating the perception and reality out there that this company is an undisputed leader in their respective industry\r\n', 'news9.jpg', 2, '2017-10-25', 1, 1, 1, 'Transnet Making Moves', 'Transnet Making Moves', '2017-10-27 15:42:18', 1),
(12, '', '\nFinance Minister Malusi Gigaba''s maiden budget performance in Parliament on Wednesday afternoon did not leave any room for celebration, and government''s finances and prospects over the next three years do not present a rosy picture.\n\nLow economic growth (down to an expected 0.7% this year) has resulted in skyrocketing risks, with the Medium-term Budget Policy Statement talking about “SA confronting a low-growth trap".\n\nThe projected revenue shortfall was higher than expected at R50.8bn (for the 2017/18 budget), resulting in an increasing budget deficit and a substantial debt risk hike. At about 15%, debt repayment costs are already the biggest budget item.\n\nThe biggest disappointment of Gigaba’s speech was the lack of real new initiatives or measures to stimulate growth or cut government expenses. The plans sound very familiar, and phrases like "an interministerial committee will look at that”, “announcements will be made later (in February)" or “some programmes will need to be eliminated, or funding reduced" are downright unacceptable. \n\nThe mini budget is quite frank about government''s predicament, but there is no mention of where the money for shortfalls will really come from, except maybe "the selling of assets" and tax increases. Gigaba seems to be "referring" and postponing all the contentious issues - from public service wage hikes to nuclear power and the water crisis in the Western Cape.\n\nThere was no mention of tax hikes or plans for new taxes, although South Africans can brace themselves for increases next February. The mini budget said though that there is "little space for tax increases in the current environment”.\n\nThere is still an attempt at reassurance, with statements like “government remains committed to a path of fiscal consolidation", "it will maintain the expenditure ceiling" and "a presidential task team will develop proposals to restore fiscal sustainability”.\nBut then the usual suspects like radical economic transformation, contributions to transformation and inclusive growth and a redistributive and progressive budget are also still there. \n\nOne must admit that Gigaba was in a tight spot, with revenue resources under pressure and mounting spending needs. But then again, what do you expect when well-intentioned warnings are simply disregarded by government? \n\nThe highlights of the mini budget are:\n\n• Tax: South Africans will probably pay more taxes from next year (detail in next February’s budget), but no details were given. The mini budget suggests the possibility of a "profound shift in the relationship between economic growth and tax collection” in that “tax buoyancy - the expansion of revenue associated with economic growth, has fallen significantly in the past two years”.\nWhether that means less effective tax collection or "less willing" taxpayers, is not clear. Over the three years to 2019/20 the projected tax shortfall will be a massive R209bn.\n\nGigaba did talk about “noting a slippage in tax compliance” in his speech. “I am engaging with the commissioner of SARS (the  South African Revenue Service) on the recommendations made in August by the tax ombud, and to take concrete and practical steps to help improve taxpayer confidence (on delays in refunds)," he said. \n   \n• Economic growth has slowed and the February projection of 1.3% has been lowered to 0.7%, still higher than the 0.5% recently projected by the International Monetary Fund. Economic growth is expected to recover slowly, reaching 1.9% in 2020.\nThe weaker growth outlook reflects a continued deterioration in business and consumer confidence that has gathered pace since 2014, the mini budget mentions. However, the international economic outlook is improving.\n\n• Risks to fiscal framework: The consolidated budget deficit for 2017/18 is expected to be 4.3% of GDP, compared with a 2017 Budget estimate of 3.1%. The main budget deficit, which determines government’s net borrowing requirement, will be 4.7% of GDP this year.\nAdditional risks to the framework include more financial demands from state-owned enterprises (SOEs), public service compensation pressures and new spending commitments, particularly in higher education. Government guarantees for SOEs have jumped to R445bn. \n\n• National debt: Gross national debt is projected to reach over 60% of GDP by 2022, with debt service costs reaching 15% of main budget revenue by 2020/21. Debt service costs (R163.3bn this year, rising to R223.4bn by 2020/21) are the biggest single item on the budget, and at 11% per year the fastest rising category. The gross debt-to-GDP outlook has worsened from February''s projected 51.9% of GDP by 2022 to the current revised figure of 60.8%. \n\n• Risks of spending on SOEs: Government''s total guarantees on SOE lending have jumped to R445bn. Unprofitable state firms are putting huge pressure on the fiscus. Their average profitability fell from 7.5% in 2011/12 to just 0.2% in 2016/17.\nThat increased their risk premium - and thus debt costs - substantially. The recapitalisation of South African Airways (total of R10bn) and the South African Post Office lifted the lid breach on the expenditure ceiling by R3.9bn. The guarantees are government''s major explicit contingent liabilities.\n\n• Spending priorities: The fastest growing elements of spending are learning and culture (including post-school education and training) and health and community development, with growth rates of 7.6%, 7.5% and 7.9% respectively. It is stated that government is protecting expenditure that delivers services to low-income households. However, additional resources to support spending priorities are severely limited.\n\nFurthermore, seven expenditure priorities for the medium-term expenditure framework period are mentioned:\n\n• Job-creation and small business development;\n\n• Youth development;\n\n• Infrastructure expansion and maintenance;\n\n• Land reform, smallholder farmer and agriculture development;\n\n• Comprehensive social security, education and skills;\n\n• An integrated plan to fight crime; and\n\n• Advancing the national interest in the Southern African Development Community throughout Africa, and through participation in the BRICS (Brazil, Russia, India, China and South Africa) bloc and the Indian Ocean Rim Association.\n\nNothing is said about big projects like the nuclear energy new build plan or the national health insurance scheme. The only mention is that the latter will increase spending on health by 2025. Announcements will either be made later, or have been put on hold for the time being\n', 'news8.jpg', 1, '2017-10-25', 1, 1, 1, '\r\nFinance Minister Budget News\r\n', '\r\nFinance Minister Budget News\r\n', '2018-02-18 18:57:53', 0),
(13, 'Test', 'An inquiry into Public Protector Busisiwe Mkhwebane will no longer go ahead, after African National Congress MPs in the Portfolio Committee on Justice and Correctional Services shut down the process on Wednesday. From the beginning of Wednesday''s proceedings, MPs seemed to be on different pages after ANC MPs claimed they had not received the requisite documents that all other MPs had received. Then, the majority ANC caucus disagreed with all the opposition MPs that they had agreed, on October 10, to hold an inquiry into Mkhwebane''s conduct at a committee meeting.\nANC MP Madipoane Mothapo said they had only agreed to "look into the matter" at portfolio committee level. Her colleague Loyiso Mpumlwana said they had to still decide if there "was a need" for an inquiry. Committee chairperson Mathole Motshekga - whose initial statement on October 10 read: "Portfolio committee agrees to hold inquiry into request to remove public protector" - also backtracked, and agreed with his ANC colleagues. He said they had only agreed to "look into" the matter, and they must now decide if there was a basis, as per National Assembly Speaker Baleka Mbete''s referral to the committee.\nOpposition MPs were not happy.\nAfrican Christian Democratic Party MP Steve Swart said it was on record that the committee had decided between setting up an ad hoc committee to hold an inquiry, or whether to hold the inquiry themselves. They had decided to hold an inquiry themselves. Economic Freedom Fighters MP Sam Matiase said they already agreed to hold the inquiry. That was the first question they had asked themselves on October 10. Democratic Alliance MP Glynnis Breytenbach said it would be highly irrational to dismiss the matter now based only on a letter of request to begin proceedings.\nThey needed to summon witnesses to deal with the merits of the case. "I cannot stress enough the need to act rationally here. That is something we learnt from the Nkandla judgment," she said. Both Motshekga and ANC whip in the committee Makgathatso Pilane-Majake dismissed their objections.\n', 'news5.jpg', 1, '2017-10-27', 1, 1, 1, 'Public Protector Breaking News	', 'Public Protector Breaking News	', '2018-02-18 18:56:09', 1),
(15, 'Test', '. Saturday’s Currie Cup final between the Sharks and Western Province in Durban will be the eighthcontested between the teams.\nThe first final dates back to 1984, with Western Province holding a 4-3 overall edge.\n1984 and 1995: Western Province vs Natal Sharks, Cape Town.\nNatal, as the Sharks were then called, surprisingly made the final when they took advantage of a "strange" ruling enforced by the old South African Rugby Board.\nNatal, winners of the B-section, were allowed a chance to play for a spot in the A-section final by hosting a semi-final against the second-placed team in the A-section. \nThey stunned Free State 26-15 in the semi-finals in Durban and booked their spot in the final against high-flying WP at Newlands. Natal, under the leadership of Springbok No 8 Wynand Claassen, threatened a major upset when they led 9-3 at the break.\n WP however took charge in the second period and ran out comfortable victors. If was a hat-trick of Currie Cup titles for WP and they would go on to set the record of five title triumphs in a row.\nNatal’s French flyhalf Thierry Lacroix proved Western Province’s undoing by contributing 20 points with the boot at a wet Kings Park. \nThis was the last Currie Cup final of the old amateur era where six teams played in the Currie Cup A-section. Apart from Lacroix, Natal also had French lock Olivier Roumat among their ranks, while Western Province had France flank Laurent Cabannes. \nThe French trio had earlier in the year played in the memorable Rugby World Cup hosted in South Africa.\n2000 and 2001: Natal Sharks vs Western Province, Durban.\n2000 - Western Province went into the final as underdogs, having lost to the Sharks at Newlands a few weeks earlier. However, they silenced Kings Park by scoring three tries to nil, with Springbok wing Breyton Paulse bagging a brace.\n This was the game where Paulse famously executed his trademark handstand-somersaults after scoring.\n2001 - Western Province overcame a 17-6 first half deficit to again silence the Sharks, this time at Newlands. The Sharks outscored WP by three tries to two, but Springbok centre Braam van Straaten’s deadly boot proved the difference for WP. Van Straaten contributed 24 points, including a try.\n2010, 2012 and 2013: Sharks vs Western Province\n2010 - This game will be remembered as the match where 20-year-old flyhalf Pat Lambie came of age. Lambie scored 25 points, including two tries, as the Sharks thrashed a shell-shocked WP.\n The Capetonians came into the game confident having convincingly beaten the Sharks 33-21 at Newlands a few weeks earlier, but left Kings Park with egg on their face. Lambie’s famous hand-off of Schalk Burger has become part of Currie Cup final folklore.\n2012 - This game will go down as one of the great upsets in Currie Cup finals history. Injuries to several frontline players forced Western Province to take a young side to Kings Park and few gave them a chance against a Springbok-laden Sharks outfit.\n The day will best be remembered for WP flyhalf Demetri Catrakilis’ heroics with the boot, which included a left-footed drop kick. WP centre Juan de Jongh’s spectacular first half try off a scrum also stands out and helped WP claim their first Currie Cup title in 11 years.\n2013 - A year later Western Province were the favourites when they hosted the Sharks in the final at Newlands. WP had beaten the Sharks 17-13 in Durban two weeks beforehand, but failed to pitch in front of their home fans. \nScrumhalf Charl McLeod’s intercept try in the sixth minute set the tone as Brendan Venter’s Sharks produced a tactical masterclass to win in convincing fashion\n', 'News6.jpg', 1, '2017-10-27', 3, 1, 1, '\r\nCurrie Cup Final\r\n', '\r\nCurrie Cup Final\r\n', '2018-02-18 18:55:56', 0),
(16, '1', 'A key contractor involved in Chinese car maker Baic’s R11 billion Coega project has appealed for no more disruptions, as it is already several months behind schedule.\nThe new vehicle plant is a joint venture between the Beijing Automotive International Corporation (Baic), which has a 65% stake, and the Industrial Development Corporation, which has 35%.\n“We are bleeding. Work delays are costing us money,” George Gerber, managing director of Uhambiso Consult, which is overseeing construction, said this week.\n“We don’t want any more work stoppages as the project is already five months behind schedule.”\nHe was speaking during a project status report back, which was followed by a tour of the assembly plant.\nOnly last week, a group of small, medium and micro enterprises (SMMEs) calling themselves the African Chamber of Business disrupted work for four days.\nGerber said that about 35% of the work had been dedicated to such enterprises.\nThe language barrier between Chinese workers and those employed by the local SMMEs had proved to be a problem.\nThis was evident during the media briefing, when Baic SA vice-president Zhang Liang’s speech had to be interpreted for the benefit of the journalists and invited guests.\nGerber conceded that language was a problem.\n“We have engaged the services of various interpreters to improve communication. It’s still a challenge, but we are winning,” he said.\nBaic this week called on black-owned small business enterprises in Nelson Mandela Bay to form partnerships to improve their chances of being awarded contracts in the project, at the Coega industrial development zone in Port Elizabeth.\n“Instead of tendering as individual companies, they should team up so as to forge a formidable force and increase their chances of being awarded tenders in the various work streams. This will also limit the animosity that might creep in between them as they fight for the work,” Gerber said.\nThe project will be tackled in phases and is divided into six different contracts.\nThe first phase, valued at R800 million, will see the construction of a paint shop, a bridge, an office block and sewerage works.\nDuring this phase, small businesses will be allocated contracts to the tune of R300 million.\nContracts will only be awarded to those SMMEs registered on the company database, which already contains 1 000.\nBaic SA head of construction Sun Tong Li, speaking through an interpreter, said they intended to ensure work was distributed fairly and that local small businesses and communities got a share of the work.\n“One of our cornerstones is the inclusion of communities of this region. Local black SMMEs must benefit from the project.\n“Between 80% and 85% of the procurement value for civil works will be from South African companies and 15% to 30% of the procurement value for the vehicle assembly plant will be from South African suppliers,” he said.\nGerber said help desks had been established in townships such as Motherwell, KwaZakhele and Bethelsdorp to help local enterprises register on the database and to inform them how to go about tendering.\nHe said a committee of Baic SA officials was responsible for awarding tenders and that it would be done transparently.\n“The opportunity for SMMEs is there, but unfortunately not everyone will get work,” he said.\nTong Li said they had not yet decided from which port to export the vehicles. Ngqura, 20km northeast of Port Elizabeth, was the logical choice, he said.\nFor skills development and training, they would work with local auto manufacturers like Volkswagen SA and Mercedes-Benz in East London.\nThe plant will make sports utility vehicles (SUVs), commercial and private vehicles.\nOn display during the tour were the D20, a hatchback which would be sold for between R150 000 and R200 000; and the DX25, a SUV costing between R210 000 and R250 000.\nThey are not yet on the market as they first have to be converted from left-hand drive to right-hand drive.\n“Also we have to make sure the fuel specifications meet the South African requirements,” said Tong Li.\nGerber said until now, they had only one contractor on site. From next week however, they would have four, as the pace of work was increasing\n', 'news7.jpg', 1, '2017-10-27', 1, 1, 1, 'Business News: Baic’s', 'Business News: Baic’s', '2018-02-18 18:51:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_type`
--

DROP TABLE IF EXISTS `post_type`;
CREATE TABLE `post_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_type`
--

INSERT INTO `post_type` (`ID`, `NAME`, `DESCRIPTION`) VALUES
(1, 'News', 'news for post'),
(2, 'Update', 'recent upadate');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `COST` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`ID`, `NAME`, `DESCRIPTION`, `COST`) VALUES
(1, 'Bronze', 'Few details', 300),
(2, 'Silver', 'few details', 500);

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`ID`, `NAME`, `DESCRIPTION`) VALUES
(1, 'ADMIN', 'ADMIN'),
(2, 'STANDARD', 'STANDARD');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `LAST_LOGIN` datetime NOT NULL,
  `LOGIN_RETRIES` int(11) NOT NULL,
  `PROFILE` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `NAME`, `PASSWORD`, `EMAIL`, `ACTIVE`, `LAST_LOGIN`, `LOGIN_RETRIES`, `PROFILE`) VALUES
(1, 'THEMBA', '12345', 'RADUVHA.TJ@GMAIL.COM', 1, '2017-08-20 00:00:00', 1, 1),
(2, 'NYIKO', '12345', 'NYIKO@GMAIL.COM', 0, '2017-08-20 00:00:00', 0, 2),
(4, 'Modern Age Catalysts', '12345', 'info@macatalysts.co.za', 1, '2017-10-27 10:00:35', 1, 1),
(3, 'Modern Age Catalysts', '12345', 'info@macatalysts.co.za', 1, '2017-10-27 10:00:57', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `advert_type`
--
ALTER TABLE `advert_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PROFILE` (`PROFILE`);

--
-- Indexes for table `companies_services`
--
ALTER TABLE `companies_services`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `company_adverts`
--
ALTER TABLE `company_adverts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `industry`
--
ALTER TABLE `industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USER` (`USER_ID`),
  ADD KEY `FK_COMPANY` (`COMPANY_ID`);

--
-- Indexes for table `post_type`
--
ALTER TABLE `post_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adverts`
--
ALTER TABLE `adverts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `advert_type`
--
ALTER TABLE `advert_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `companies_services`
--
ALTER TABLE `companies_services`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `company_adverts`
--
ALTER TABLE `company_adverts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `industry`
--
ALTER TABLE `industry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
