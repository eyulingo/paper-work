
SET GLOBAL time_zone = "+8:00";

DROP DATABASE IF EXISTS `eyulingo_db`;

CREATE DATABASE IF NOT EXISTS `eyulingo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

ALTER DATABASE `eyulingo_db` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

USE `eyulingo_db`;

-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: eyulingo_db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admin_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('admin1','admin1password'),('admin2','admin2password'),('admin3','admin3password');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`good_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE RESTRICT,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkcodes`
--

DROP TABLE IF EXISTS `checkcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkcodes` (
  `email_addr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `type` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_addr`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkcodes`
--

LOCK TABLES `checkcodes` WRITE;
/*!40000 ALTER TABLE `checkcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivers`
--

DROP TABLE IF EXISTS `delivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivers` (
  `deliver_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`deliver_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivers`
--

LOCK TABLES `delivers` WRITE;
/*!40000 ALTER TABLE `delivers` DISABLE KEYS */;
INSERT INTO `delivers` VALUES ('中通快递'),('圆通快递'),('宅急送'),('汇通快递'),('申通快递'),('自提'),('邮政EMS'),('韵达快递'),('顺丰速运');
/*!40000 ALTER TABLE `delivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodcomments`
--

DROP TABLE IF EXISTS `goodcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodcomments` (
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `good_comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`good_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goodcomments_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE RESTRICT,
  CONSTRAINT `goodcomments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodcomments`
--

LOCK TABLES `goodcomments` WRITE;
/*!40000 ALTER TABLE `goodcomments` DISABLE KEYS */;
INSERT INTO `goodcomments` VALUES (1,1,5,'听见 冬天的离开\n我在某年某月醒过来\n我想 我等 我期待\n未来却不能因此安排'),(2,2,4,'井底点灯深烛伊，共郎长行莫围棋。\n玲珑骰子安红豆，入骨相思知不知。'),(3,3,3,'一尺深红蒙曲尘，天生旧物不如新。'),(4,4,4,'困花压蕊丝丝雨，不堪只共愁人语。斗帐抱春寒，梦中何处山。\n卷帘风意恶，泪与残红落。羡煞是杨花，输它先到家。'),(5,2,4,'阴天 傍晚 车窗外\n未来有一个人在等待\n向左 向右 向前看\n爱要拐几个弯才来'),(6,3,1,'愿得一心人，白头不相离。'),(7,4,3,'秋风清，秋月明，\n落叶聚还散，寒鸦栖复惊。\n相思相见知何日？此时此夜难为情！ \n入我相思门，知我相思苦，\n长相思兮长相忆，短相思兮无穷极，\n早知如此绊人心，何如当初莫相识。'),(8,5,5,'去年今日此门中，人面桃花相映红。\n人面不知何处去，桃花依旧笑春风。'),(9,3,5,'我遇见谁, 会有怎样的对白\n我等的人, 他在多远的未来\n我听见风来自地铁和人海\n我排着队, 拿着爱的号码牌'),(10,4,2,'花开不并百花丛，独立疏篱趣未穷。\n宁可枝头抱香死，何曾吹落北风中。'),(11,5,2,'人间四月芳菲尽，山寺桃花始盛开。 \n长恨春归无觅处，不知转入此中来。'),(12,6,3,'今人不见古时月，今月曾经照古人。\n古人今人若流水，共看明月皆如此。'),(13,1,4,'锦瑟无端五十弦，一弦一柱思华年。\n庄生晓梦迷蝴蝶，望帝春心托杜鹃。\n沧海月明珠有泪，蓝田日暖玉生烟。\n此情可待成追忆，只是当时已惘然。'),(14,4,3,'我们也曾在爱情里受伤害\n我看着路梦的入口有点窄\n我遇见你是最美的意外\n总有一天, 我的谜底会解开'),(15,5,3,'红藕香残玉簟秋。轻解罗裳，独上兰舟。云中谁寄锦书来，雁字回时，月满西楼。\n花自飘零水自流。一种相思，两处闲愁。此情无计可消除，才下眉头，却上心头。'),(16,6,3,'曾伴浮云归晚翠，犹陪落日泛秋声。\n世间无限丹青手，一片伤心画不成。'),(17,1,1,'出门一笑莫心哀，浩荡襟怀到处开。'),(18,2,5,'僵卧孤村不自哀，尚思为国戍轮台。\n夜阑卧听风吹雨，铁马冰河入梦来。'),(19,5,5,'分手時內疚的你一轉臉\n為日後不想有甚麼牽連\n當我工作睡覺禱告娛樂那麼刻意過好每天\n誰料你見鬆綁了又願見面'),(20,6,5,'多情自古伤离别，更那堪，冷落清秋节！今宵酒醒何处？杨柳岸，晓风残月。此去经年，应是良辰好景虚设。便纵有千种风情，更与何人说？'),(21,1,2,'别梦依依到谢家，小廊回合曲阑斜。\n多情只有春庭月，犹为离人照落花。'),(22,2,3,'洛阳城东西，长作经时别。\n昔去雪如花，今来花似雪。'),(23,3,4,'晚日寒鸦一片愁。柳塘新绿却温柔。若教眼底无离恨，不信人间有白头。\n肠已断，泪难收。相思重上小红楼。情知已被山遮断，频倚阑干不自由。'),(24,6,2,'誰當初想擺脫被圍繞左右\n過後誰人被遙控於世界盡頭\n勒到呼吸困難才知變扯線木偶\n這根線其實說到底 誰拿捏在手'),(25,1,1,'不聚不散 只等你給另一對手擒獲\n那時青絲 不會用上餘生來量度\n但我拖著軀殼 發現沿途尋找的快樂\n仍繫於你肩膊 或是其實在等我捨割\n然後斷線風箏會直飛天國'),(26,2,5,'去年花里逢君别，今日花开又一年。\n世事茫茫难自料，春愁黯黯独成眠。\n身多疾病思田里，邑有流亡愧俸钱。\n闻道欲来相问讯，西楼望月几回圆。'),(27,3,5,'丈夫非无泪，不洒离别间。\n杖剑对尊酒，耻为游子颜。\n蝮蛇一螫手，壮士即解腕。\n所志在功名，离别何足叹。'),(28,4,4,'国破山河在，城春草木深。\n感时花溅泪，恨别鸟惊心。\n烽火连三月，家书抵万金。\n白头搔更短，浑欲不胜簪。'),(29,2,5,'這些年望你緊抱他出現\n還憑何擔心再互相糾纏\n給我找個伴侶找到留下你的足印也可發展\n全為你背影逼我步步向前'),(30,3,3,'若这一束吊灯倾泻下来\n或者我 已不会存在\n即使你不爱\n亦不需要分开'),(31,4,4,'若这一刻我竟严重痴呆\n根本不需要被爱\n永远在床上发梦\n余生都不会再悲哀'),(32,5,2,'人总需要勇敢生存\n我还是重新许愿\n例如学会 承受失恋'),(33,3,3,'如一根絲牽引著拾荒之路\n結在喉嚨內痕癢得似有還無\n為你安心我在微笑中想吐未吐\n只想你和伴侶要好 才頑強病好'),(34,4,4,'明年今日 别要再失眠\n床褥都改变 如果有幸会面\n或在同伴新婚的盛宴\n惶惑地等待你出现'),(35,5,5,'明年今日 未见你一年\n谁舍得改变 离开你六十年\n但愿能认得出你的子女\n临别亦听得到你讲再见'),(36,6,4,'明年今日 未见你一年\n谁舍得改变 离开你六十年\n但愿能认得出你的子女\n临别亦听得到你讲再见'),(37,1,4,'在有生的瞬间能遇到你\n竟花光所有运气\n到这日才发现\n曾呼吸过空气'),(38,4,4,'不聚不散 只等你給另一對手擒獲\n以為青絲 不會用上餘生來量度\n但我拖著軀殼 發現沿途尋找的快樂\n仍繫於你肩膊 或是其實在等我捨割\n然後斷線風箏會直飛天國'),(39,5,1,'有人問我 我就會講 但是無人來\n我期待到無奈 有話要講 得不到裝載\n我的心情猶像樽蓋 等被揭開 咀巴卻在養青苔\n人潮內 愈文靜 愈變得 不受理睬 自己要搞出意外\n像突然 地高歌 任何地方也像開四面台\n著最閃的衫 扮十分感慨 有人來拍照要記住插袋'),(40,6,5,'你當我是浮誇吧 誇張只因我很怕\n似木頭 似石頭的話 得到注意嗎\n其實怕被忘記 至放大來演吧\n很不安 怎去優雅\n世上還讚頌沉默嗎\n不夠爆炸 怎麼有話題 讓我誇 做大娛樂家'),(41,1,3,'那年十八 母校舞會 站著如嘍囉\n那時候 我含淚發誓各位 必須看到我\n在世間 平凡又普通的路太多 屋村你住哪一座\n情愛中 工作中 受過的忽視太多 自尊已飽經跌墮\n重視能治肚餓 末曾獲得過便知我為何\n大動作很多 犯下這些錯\n搏人們看看我 算病態麼'),(42,2,3,'你當我是浮誇吧 誇張只因我很怕\n似木頭 似石頭的話 得到注意嗎\n其實怕被忘記 至放大來演吧\n很不安 怎去優雅\n世上還讚頌沉默嗎\n不夠爆炸 怎麼有話題 讓我誇 做大娛樂家'),(43,5,2,'一直不覺 綑綁我的未可扣緊承諾\n滿頭青絲 想到白了仍懶得脫落\n被你牽動思覺 最後誰願纏繞到天國\n然後撕裂軀殼 欲斷難斷在不甘心去捨割\n難道愛本身可愛在於束縛'),(44,6,5,'幸運兒並不多 若然未當過就知我為何\n用十倍苦心做突出一個 正常人夠我富議論性麼'),(45,1,2,'你叫我做浮誇吧 加幾聲噓聲也不怕\n我在場 有悶場的話 表演你看嗎 夠歇斯底里嗎\n以眼淚淋花吧 一心只想你驚訝 我舊時似未存在嗎\n加重注碼 青筋也現形 話我知 現在存在嗎'),(46,2,5,'凝視我 別再只看天花 我非你杯茶\n也可盡情地喝吧 別遺忘有人在 為你 聲沙'),(47,3,4,'還沒好好的感受　雪花綻放的氣候\n我們一起顫抖　會更明白　甚麼是溫柔\n還沒跟你牽著手　走過荒蕪的沙丘\n可能從此以後　學會珍惜　天長和地久'),(48,6,3,'無奈你我牽過手 沒繩索'),(49,1,5,'人生若只如初见，何事秋风悲画扇。\n等闲变却故人心，却道故人心易变。(一作：却道故心人易变)\n骊山语罢清宵半，泪雨霖铃终不怨。(一作：泪雨零 / 夜雨霖)\n何如薄幸锦衣郎，比翼连枝当日愿。'),(50,2,4,'有時候　有時候\n我會相信一切有盡頭\n相聚離開　都有時候\n沒有甚麼會永垂不朽\n可是我　有時候\n寧願選擇留戀不放手\n等到風景都看透\n也許你會陪我　看細水長流'),(51,3,3,'還沒為你把紅豆　熬成纏綿的傷口\n然後一起分享　會更明白　相思的哀愁\n還沒好好的感受　醒著親吻的溫柔\n可能在我左右　你才追求　孤獨的自由');
/*!40000 ALTER TABLE `goodcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `storage` int(11) DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_image_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`good_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'iPhone 8 Plus',1,4999.00,4988.00,15123,'迄今为止最先进的 iPhone。','5d2e897369515b0006bb7c44',0),(2,'iPad Pro (12.9-inch)',1,6999.00,6599.00,23944,'最先进的生产力。','5d2e898a69515b0006bb7c46',0),(3,'MacBook Pro (2019)',1,12999.00,11699.00,2534,'出类拔萃的专业笔记本电脑。','5d2e899669515b0006bb7c48',0),(4,'Apple Watch (Series 4)',1,2699.00,2499.00,16039,'看看 Apple Watch 如何让你充满活力、保持健康，并时刻与人紧密连系，是你健康生活不可或缺的终极装置。','5d2e899f69515b0006bb7c4a',0),(5,'Surface Pro 6',2,5999.00,5499.00,4732,'Surface Pro 6 新款笔记本平板二合一。','5d2e89c469515b0006bb7c4c',0),(6,'Surface Book 2',2,7999.00,7299.00,4456,'全新微软 Surface Book 2 微软官方商城热卖。第8代英特尔处理器，可选NVIDIA独立显卡，17小时电池续航时间，性能巨匠微软Surface Book 2，四重模式任意变换。','5d2e89d569515b0006bb7c4e',0),(7,'Surface Studio 2',2,21999.00,19999.00,393,'Surface Studio 是微软推出的运行 64 位 Windows 10 的一体机产品。','5d2e89df69515b0006bb7c50',0),(8,'Nokia Lumia 1520',2,4999.00,4499.00,49324,'诺基亚Lumia 1520 是 Nokia 公司设计和生产的一款平板手机。','5d2e89e769515b0006bb7c52',0),(9,'芝士咖喱猪排饭',3,14.50,14.50,501,'芝士、咖喱和猪排，即食包装盒饭。','5d2e8a0c69515b0006bb7c54',0),(10,'滑蛋厚切猪排饭',3,13.00,13.00,254,'滑蛋、厚切猪排，即食包装盒饭。','5d2e8a1d69515b0006bb7c58',0),(11,'爆浆猪排饭',3,16.50,16.50,321,'爆浆特大号猪排，即食包装盒饭。','5d2e8a2769515b0006bb7c5a',0),(12,'可口可乐（罐装）',3,3.00,3.00,152678,'300 毫升罐装冷藏可口可乐。','5d2e8a2f69515b0006bb7c5c',0),(13,'奥尔良鸡排盖浇饭',4,17.50,17.50,234,'奥尔良鸡排和盖浇汤汁，即食包装盒饭。','5d2e8a5369515b0006bb7c5e',0),(14,'大碗麻辣香锅饭',4,14.00,14.00,531,'特大碗麻辣香锅，即食包装盒饭。','5d2e8a5f69515b0006bb7c61',0),(15,'沙茶牛肉双拼饭',4,15.50,14.00,153,'沙茶酱和牛肉的双拼搭配，即食包装盒饭。','5d2e8a6769515b0006bb7c64',0),(16,'百事可乐（罐装）',4,3.00,3.00,95865,'300 毫升罐装冷藏百事可乐。','5d2e8a6f69515b0006bb7c66',0),(17,'奶油虾仁意大利面',5,15.00,15.00,543,'奶油虾仁配意大利面，即食包装食品。','5d2e8a9169515b0006bb7c68',0),(18,'咖喱鸡排饭团',5,7.00,7.00,135,'咖喱鸡排包裹米饭，即食包装食品。','5d2e8a9969515b0006bb7c6a',0),(19,'超级海鲜披萨',5,18.00,18.00,421,'海鲜速冻披萨（1 片装）。','5d2e8aa169515b0006bb7c6c',0),(20,'海鲜烩炒饭',5,16.50,16.50,43,'海鲜烩饭，即食包装盒饭。','5d2e8aa969515b0006bb7c6e',0),(21,'麻婆豆腐烩饭',5,14.00,14.00,276,'麻婆豆腐烩饭，即食包装烩饭。','5d2e8ab169515b0006bb7c70',0),(22,'炭烤风味鸡排便当',5,15.00,15.00,542,'炭烤风味鸡排米饭，即食包装食品。','5d2e8ab869515b0006bb7c72',0),(23,'钢笔',6,5999.00,5999.00,152,'MONT BLANC 钢笔。','5d2e8b3169515b0006bb7c74',0),(24,'手表',6,17999.00,17999.00,53,'MONT BLANC 手表。','5d2e8b3969515b0006bb7c76',0),(25,'墨水',6,1799.00,1799.00,5234,'MONT BLANC 墨水。','5d2e8b4b69515b0006bb7c79',0),(26,'华为 P30 Pro 手机',7,5799.00,5799.00,4243,'地表最强拍照手机。','5d2e8b6c69515b0006bb7c7b',0),(27,'华为 MagicBook 2 笔记本电脑',7,8799.00,8499.00,6544,'华为 MagicBook 系列最新笔记本电脑。','5d2e8b7769515b0006bb7c7f',0),(28,'华为手环 3',7,1499.00,1399.00,3426,'华为手环系列最新款。','5d2e8b7f69515b0006bb7c81',0),(29,'超能天然皂粉',8,59.00,54.00,42432,'超能天然皂粉去污牌洗衣粉。','5d2e8b9a69515b0006bb7c84',0),(30,'立白洗衣粉',8,34.00,34.00,64365,'立白最新款去污洗衣粉。','5d2e8ba369515b0006bb7c86',0),(31,'去渍霸超能去污洗衣粉',8,72.00,72.00,3147,'去渍霸，超能去污洗衣粉。','5d2e8baa69515b0006bb7c88',0),(32,'汰渍洗衣液',8,59.00,59.00,4328,'汰渍牌强效去污洗衣液。','5d2e8bb269515b0006bb7c8a',0),(33,'蓝月亮护理洗衣液',8,49.00,49.00,8353,'蓝月亮不伤手护理洗衣液。','5d2e8bba69515b0006bb7c8c',0),(34,'魅族 16 手机',9,2799.00,2799.00,5341,'魅族「Sixteen」系列手机。','5d2e8bda69515b0006bb7c8e',0),(35,'魅族 Note 6 手机',9,1499.00,1499.00,6241,'魅族大屏幕 Note 系列旗舰机。','5d2e8be169515b0006bb7c90',0),(36,'魅族 16X 手机',9,3099.00,3099.00,7426,'魅族“16”系列手机最新款。','5d2e8be869515b0006bb7c92',0),(37,'茄子绒布玩具',10,15.00,15.00,47344,'茄子形状的绒布玩具，材质柔和，颜色亮丽。','5d2e8c0069515b0006bb7c94',0),(38,'冰激凌球绒布玩具',10,9.00,9.00,87692,'冰激凌球形状的绒布玩具，材质柔和，颜色亮丽。','5d2e8c0769515b0006bb7c96',0),(39,'海盐洁面乳',10,97.00,97.00,1642,'包含真实海盐提取物的洁面乳。','5d2e8c0e69515b0006bb7c98',0),(40,'SNICKERS 士力架巧克力',11,5.00,5.00,74124,'横扫饥饿的士力架巧克力条。','5d2e8c2a69515b0006bb7c9a',0),(41,'苹果',11,3.00,3.00,6276,'普通的山东寿光苹果。','5d2e8c3269515b0006bb7c9c',0),(42,'橙子',11,3.00,3.00,3784,'普通的甜橙。','5d2e8c3969515b0006bb7c9e',0),(43,'金扶宁（外用重组人粒细胞巨噬细胞刺激因子凝胶剂）',12,5999.00,5999.00,51,'主要成分为重组人粒细胞巨噬细胞刺激因子（rhGM-CSF），辅料为羧甲基纤维素钠、甘油及保护剂。','5d2e8c5269515b0006bb7ca0',0),(44,'美罗华（利妥昔单抗注射液）',12,3799.00,3799.00,57,'本品主要活性成分为重组利妥昔单抗。辅料包括枸橼酸钠，聚山梨醇酯，氯化钠和注射用水。','5d2e8c5a69515b0006bb7ca2',0),(45,'舒莱（巴利息单抗注射液）',12,12499.00,12499.00,13,'本品活性成份为巴利昔单抗。每瓶含巴利昔单抗20毫克或10毫克，配5毫升注射用水1支。','5d2e8c7069515b0006bb7ca5',0),(46,'拓益（特瑞普单抗注射液）',12,7399.00,7399.00,55,'每瓶含特瑞普利单抗240mg，通过DNA重组技术由中国仓鼠卵巢细胞制得。','5d2e8c7969515b0006bb7ca7',0),(47,'Big Mac 巨无霸汉堡',13,45.00,45.00,312,'经典的 Big Mac 汉堡。','5d2e8c9a69515b0006bb7ca9',0),(48,'炸薯条',13,15.00,15.00,345,'油炸土豆条。','5d2e8ca269515b0006bb7cab',0),(49,'McFlurry 麦旋风冰激凌',13,17.00,17.00,897,'啊，是 McFlurry 麦旋风！','5d2e8ca969515b0006bb7cad',0),(50,'双拼汉堡',13,16.00,16.00,434,'鸡肉和牛肉双拼汉堡。','5d2e8cb269515b0006bb7caf',0),(51,'炸面包条',13,9.00,9.00,231,'美式炸干面包条。','5d2e8cba69515b0006bb7cb1',0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `current_price` decimal(8,2) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`good_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliver_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT NULL,
  `rated` tinyint(4) DEFAULT NULL,
  `rate_level` int(5) DEFAULT NULL,
  `comment_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `deliver_method` (`deliver_method`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`deliver_method`) REFERENCES `delivers` (`deliver_name`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storecomments`
--

DROP TABLE IF EXISTS `storecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecomments` (
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `store_comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`store_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `storecomments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE RESTRICT,
  CONSTRAINT `storecomments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storecomments`
--

LOCK TABLES `storecomments` WRITE;
/*!40000 ALTER TABLE `storecomments` DISABLE KEYS */;
INSERT INTO `storecomments` VALUES (1,1,5,'听见 冬天的离开\n我在某年某月醒过来\n我想 我等 我期待\n未来却不能因此安排'),(1,2,4,'井底点灯深烛伊，共郎长行莫围棋。\n玲珑骰子安红豆，入骨相思知不知。'),(1,3,3,'一尺深红蒙曲尘，天生旧物不如新。'),(1,4,4,'困花压蕊丝丝雨，不堪只共愁人语。斗帐抱春寒，梦中何处山。\n卷帘风意恶，泪与残红落。羡煞是杨花，输它先到家。'),(2,2,4,'阴天 傍晚 车窗外\n未来有一个人在等待\n向左 向右 向前看\n爱要拐几个弯才来'),(2,3,1,'愿得一心人，白头不相离。'),(2,4,3,'秋风清，秋月明，\n落叶聚还散，寒鸦栖复惊。\n相思相见知何日？此时此夜难为情！ \n入我相思门，知我相思苦，\n长相思兮长相忆，短相思兮无穷极，\n早知如此绊人心，何如当初莫相识。'),(2,5,5,'去年今日此门中，人面桃花相映红。\n人面不知何处去，桃花依旧笑春风。'),(3,3,5,'我遇见谁, 会有怎样的对白\n我等的人, 他在多远的未来\n我听见风来自地铁和人海\n我排着队, 拿着爱的号码牌'),(3,4,2,'花开不并百花丛，独立疏篱趣未穷。\n宁可枝头抱香死，何曾吹落北风中。'),(3,5,2,'人间四月芳菲尽，山寺桃花始盛开。 \n长恨春归无觅处，不知转入此中来。'),(3,6,3,'今人不见古时月，今月曾经照古人。\n古人今人若流水，共看明月皆如此。'),(4,1,4,'锦瑟无端五十弦，一弦一柱思华年。\n庄生晓梦迷蝴蝶，望帝春心托杜鹃。\n沧海月明珠有泪，蓝田日暖玉生烟。\n此情可待成追忆，只是当时已惘然。'),(4,4,3,'我们也曾在爱情里受伤害\n我看着路梦的入口有点窄\n我遇见你是最美的意外\n总有一天, 我的谜底会解开'),(4,5,3,'红藕香残玉簟秋。轻解罗裳，独上兰舟。云中谁寄锦书来，雁字回时，月满西楼。\n花自飘零水自流。一种相思，两处闲愁。此情无计可消除，才下眉头，却上心头。'),(4,6,3,'曾伴浮云归晚翠，犹陪落日泛秋声。\n世间无限丹青手，一片伤心画不成。'),(5,1,1,'出门一笑莫心哀，浩荡襟怀到处开。'),(5,2,5,'僵卧孤村不自哀，尚思为国戍轮台。\n夜阑卧听风吹雨，铁马冰河入梦来。'),(5,5,5,'分手時內疚的你一轉臉\n為日後不想有甚麼牽連\n當我工作睡覺禱告娛樂那麼刻意過好每天\n誰料你見鬆綁了又願見面'),(5,6,5,'多情自古伤离别，更那堪，冷落清秋节！今宵酒醒何处？杨柳岸，晓风残月。此去经年，应是良辰好景虚设。便纵有千种风情，更与何人说？'),(6,1,2,'别梦依依到谢家，小廊回合曲阑斜。\n多情只有春庭月，犹为离人照落花。'),(6,2,3,'洛阳城东西，长作经时别。\n昔去雪如花，今来花似雪。'),(6,3,4,'晚日寒鸦一片愁。柳塘新绿却温柔。若教眼底无离恨，不信人间有白头。\n肠已断，泪难收。相思重上小红楼。情知已被山遮断，频倚阑干不自由。'),(6,6,2,'誰當初想擺脫被圍繞左右\n過後誰人被遙控於世界盡頭\n勒到呼吸困難才知變扯線木偶\n這根線其實說到底 誰拿捏在手'),(7,1,1,'不聚不散 只等你給另一對手擒獲\n那時青絲 不會用上餘生來量度\n但我拖著軀殼 發現沿途尋找的快樂\n仍繫於你肩膊 或是其實在等我捨割\n然後斷線風箏會直飛天國'),(7,2,5,'去年花里逢君别，今日花开又一年。\n世事茫茫难自料，春愁黯黯独成眠。\n身多疾病思田里，邑有流亡愧俸钱。\n闻道欲来相问讯，西楼望月几回圆。'),(7,3,5,'丈夫非无泪，不洒离别间。\n杖剑对尊酒，耻为游子颜。\n蝮蛇一螫手，壮士即解腕。\n所志在功名，离别何足叹。'),(7,4,4,'国破山河在，城春草木深。\n感时花溅泪，恨别鸟惊心。\n烽火连三月，家书抵万金。\n白头搔更短，浑欲不胜簪。'),(8,2,5,'這些年望你緊抱他出現\n還憑何擔心再互相糾纏\n給我找個伴侶找到留下你的足印也可發展\n全為你背影逼我步步向前'),(8,3,3,'若这一束吊灯倾泻下来\n或者我 已不会存在\n即使你不爱\n亦不需要分开'),(8,4,4,'若这一刻我竟严重痴呆\n根本不需要被爱\n永远在床上发梦\n余生都不会再悲哀'),(8,5,2,'人总需要勇敢生存\n我还是重新许愿\n例如学会 承受失恋'),(9,3,3,'如一根絲牽引著拾荒之路\n結在喉嚨內痕癢得似有還無\n為你安心我在微笑中想吐未吐\n只想你和伴侶要好 才頑強病好'),(9,4,4,'明年今日 别要再失眠\n床褥都改变 如果有幸会面\n或在同伴新婚的盛宴\n惶惑地等待你出现'),(9,5,5,'明年今日 未见你一年\n谁舍得改变 离开你六十年\n但愿能认得出你的子女\n临别亦听得到你讲再见'),(9,6,4,'明年今日 未见你一年\n谁舍得改变 离开你六十年\n但愿能认得出你的子女\n临别亦听得到你讲再见'),(10,1,4,'在有生的瞬间能遇到你\n竟花光所有运气\n到这日才发现\n曾呼吸过空气'),(10,4,4,'不聚不散 只等你給另一對手擒獲\n以為青絲 不會用上餘生來量度\n但我拖著軀殼 發現沿途尋找的快樂\n仍繫於你肩膊 或是其實在等我捨割\n然後斷線風箏會直飛天國'),(10,5,1,'有人問我 我就會講 但是無人來\n我期待到無奈 有話要講 得不到裝載\n我的心情猶像樽蓋 等被揭開 咀巴卻在養青苔\n人潮內 愈文靜 愈變得 不受理睬 自己要搞出意外\n像突然 地高歌 任何地方也像開四面台\n著最閃的衫 扮十分感慨 有人來拍照要記住插袋'),(10,6,5,'你當我是浮誇吧 誇張只因我很怕\n似木頭 似石頭的話 得到注意嗎\n其實怕被忘記 至放大來演吧\n很不安 怎去優雅\n世上還讚頌沉默嗎\n不夠爆炸 怎麼有話題 讓我誇 做大娛樂家'),(11,1,3,'那年十八 母校舞會 站著如嘍囉\n那時候 我含淚發誓各位 必須看到我\n在世間 平凡又普通的路太多 屋村你住哪一座\n情愛中 工作中 受過的忽視太多 自尊已飽經跌墮\n重視能治肚餓 末曾獲得過便知我為何\n大動作很多 犯下這些錯\n搏人們看看我 算病態麼'),(11,2,3,'你當我是浮誇吧 誇張只因我很怕\n似木頭 似石頭的話 得到注意嗎\n其實怕被忘記 至放大來演吧\n很不安 怎去優雅\n世上還讚頌沉默嗎\n不夠爆炸 怎麼有話題 讓我誇 做大娛樂家'),(11,5,2,'一直不覺 綑綁我的未可扣緊承諾\n滿頭青絲 想到白了仍懶得脫落\n被你牽動思覺 最後誰願纏繞到天國\n然後撕裂軀殼 欲斷難斷在不甘心去捨割\n難道愛本身可愛在於束縛'),(11,6,5,'幸運兒並不多 若然未當過就知我為何\n用十倍苦心做突出一個 正常人夠我富議論性麼'),(12,1,2,'你叫我做浮誇吧 加幾聲噓聲也不怕\n我在場 有悶場的話 表演你看嗎 夠歇斯底里嗎\n以眼淚淋花吧 一心只想你驚訝 我舊時似未存在嗎\n加重注碼 青筋也現形 話我知 現在存在嗎'),(12,2,5,'凝視我 別再只看天花 我非你杯茶\n也可盡情地喝吧 別遺忘有人在 為你 聲沙'),(12,3,4,'還沒好好的感受　雪花綻放的氣候\n我們一起顫抖　會更明白　甚麼是溫柔\n還沒跟你牽著手　走過荒蕪的沙丘\n可能從此以後　學會珍惜　天長和地久'),(12,6,3,'無奈你我牽過手 沒繩索'),(13,1,5,'人生若只如初见，何事秋风悲画扇。\n等闲变却故人心，却道故人心易变。(一作：却道故心人易变)\n骊山语罢清宵半，泪雨霖铃终不怨。(一作：泪雨零 / 夜雨霖)\n何如薄幸锦衣郎，比翼连枝当日愿。'),(13,2,4,'有時候　有時候\n我會相信一切有盡頭\n相聚離開　都有時候\n沒有甚麼會永垂不朽\n可是我　有時候\n寧願選擇留戀不放手\n等到風景都看透\n也許你會陪我　看細水長流'),(13,3,3,'還沒為你把紅豆　熬成纏綿的傷口\n然後一起分享　會更明白　相思的哀愁\n還沒好好的感受　醒著親吻的溫柔\n可能在我左右　你才追求　孤獨的自由'),(13,4,3,'有時候　有時候\n我會相信一切有盡頭\n相聚離開　都有時候\n沒有甚麼會永垂不朽\n可是我　有時候\n寧願選擇留戀不放手\n等到風景都看透\n也許你會陪我　看細水長流');
/*!40000 ALTER TABLE `storecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `store_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliver_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dist_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dist_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dist_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dist_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dist_image_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`store_id`,`dist_name`),
  KEY `deliver_method` (`deliver_method`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`deliver_method`) REFERENCES `delivers` (`deliver_name`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Apple Store 零售店','5d2e877769515b0006bb7c26','上海市黄浦区南京东路300号',121.484824,31.23773,'400-666-8800','10:00','22:00','顺丰速运','乌绮玉','Wuqiyu123456','上海市静安区中华新路479号','13640698865','5d1d5e47634459000715143b'),(2,'Microsoft 零售店','5d2e87b869515b0006bb7c2a','北京市朝阳区太阳宫中路12号',116.448459,39.971674,'010-84430670','10:00','22:00','中通快递','宇怡然','Yuyiran123456','北京市西城区珠市口西大街113-2号','15381882050','5d1d5e5a634459000715143d'),(3,'FamilyMart 全家便利店','5d2e87dd69515b0006bb7c2c','上海市徐汇区宜山路站3号口',121.387462,31.167414,'021-54894998','00:00','23:59','自提','罕问兰','Hanwenlan123456','上海市徐汇区漕溪北路915号','13636136463','5d1d5e6d634459000715143f'),(4,'Lawson 罗森便利店','5d2e87ef69515b0006bb7c2e','上海市徐汇区漕溪北路88号圣爱大厦1层',121.437181,31.191874,'021-60857694','00:00','23:59','自提','幸和暖','Xinghenuan123456','上海市徐汇区枫林路180号','15819206626','5d1d5e7a6344590007151441'),(5,'7-ELEVEn 便利店','5d2e87fa69515b0006bb7c31','江苏省无锡市梁溪区汉昌西街87号',120.302955,31.584893,'13306191838','00:00','23:59','自提','析津','Xijin123456','江苏省无锡市滨湖区运河西路1596号','13960026223','5d1d5e866344590007151443'),(6,'MONT BLANC','5d2e880269515b0006bb7c33','江苏省无锡市梁溪区梁溪区中山路168号',120.302928,31.572521,'510-82731852','09:30','21:30','宅急送','迟幼枫','Chiyoufeng123456','江苏省无锡市梁溪区中山路333号','15526356625','5d1d5e936344590007151445'),(7,'华为零售店','5d2e880b69515b0006bb7c35','江苏省南京市秦淮区洪武路88号',118.785979,32.037977,'15051867700','08:30','23:00','顺丰速运','冰枫','Bingfeng123456','江苏省南京市雨花台区应天大街619号','13611731420','5d1d5e9d6344590007151447'),(8,'京东专卖店','5d2e881569515b0006bb7c37','江苏省南京市雨花台区经济开发区玉兰路88号',118.793212,31.976738,'950618','08:00','22:00','圆通快递','行若云','Xingruoyun123456','江苏省南京市玄武区太平北路122号','15288003437','5d1d5eab6344590007151449'),(9,'魅族专卖店','5d2e882569515b0006bb7c39','重庆市江北区观音桥朗晴广场LG层A5号',106.545321,29.582235,'023-86063134','09:30','20:30','韵达快递','游天菱','Youtianling123456','重庆市渝北区黄泥磅紫福路69号','15090654947','5d1d5eb7634459000715144b'),(10,'LUSH Fresh Handmade Cosmetics','5d2e882f69515b0006bb7c3b','香港特別行政區油尖旺區九龍灣德福廣場1期1樓',114.17069,22.311644,'27234282','11:00','22:00','邮政EMS','方语','Fangyu123456','香港特別行政區黃大仙區新蒲崗大有街34號','53542013','5d1d5ec2634459000715144d'),(11,'Walmart 沃尔玛','5d2e883969515b0006bb7c3e','广东省广州市越秀区淘金路6-8号',113.288067,23.140145,'020-83588082','08:00','22:30','汇通快递','尚晴','Shangqing123456','广东省广州市越秀区中山二路92号','13527334811','5d1d5ece634459000715144f'),(12,'Mayo Clinic 药店','5d2e884169515b0006bb7c40','浙江省宁波市海曙区药行街93号',121.55471,29.867065,'574-27877080','08:30','21:30','申通快递','祈海亦','Qihaiyi123456','浙江省宁波市海曙区望春街道丽园北路668号','13547406817','5d1d5edd6344590007151451'),(13,'McDonald\'s 麦当劳快餐店','5d2e884b69515b0006bb7c42','天津市河东区十一经路和六纬路交口津东大厦1层',117.224586,39.121287,'022-24011356','00:00','23:59','自提','祭一禾','Jiyihe123456','天津市和平区西安道68号','13976189733','5d1d5ee86344590007151453');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `good_id` int(11) NOT NULL,
  `tag_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`good_id`,`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'iOS'),(1,'双摄像头'),(1,'大屏'),(1,'手机'),(2,'A12X'),(2,'iOS'),(2,'平板电脑'),(3,'Mac'),(3,'新款'),(3,'笔记本电脑'),(4,'watchOS'),(4,'手表'),(4,'新品'),(4,'防水'),(5,'Surface'),(5,'Windows'),(5,'二合一设备'),(5,'笔记本电脑'),(6,'Surface'),(6,'Windows'),(6,'二合一设备'),(6,'独立显卡'),(7,'Surface'),(7,'台式机'),(7,'大屏'),(7,'新品'),(7,'桌面工作站'),(8,'WP'),(8,'大屏'),(8,'手机'),(8,'诺基亚'),(9,'全家'),(9,'猪排'),(9,'盒饭'),(9,'芝士'),(10,'全家'),(10,'猪排'),(10,'盒饭'),(11,'全家'),(11,'爆浆'),(11,'猪排'),(11,'盒饭'),(12,'冷藏'),(12,'罐装'),(12,'饮料'),(13,'盒饭'),(13,'盖浇饭'),(13,'罗森'),(13,'鸡排'),(14,'大碗'),(14,'盒饭'),(14,'罗森'),(14,'香锅'),(14,'麻辣'),(15,'沙茶酱'),(15,'牛肉'),(15,'盒饭'),(15,'盖浇饭'),(15,'罗森'),(16,'冷藏'),(16,'罐装'),(16,'饮料'),(17,'奶油'),(17,'意大利面'),(17,'盒饭'),(17,'虾仁'),(18,'咖喱'),(18,'盒饭'),(18,'饭团'),(18,'鸡排'),(19,'披萨'),(19,'海鲜'),(19,'速冻'),(20,'海鲜'),(20,'烩饭'),(21,'烩饭'),(21,'麻婆豆腐'),(22,'炭烤'),(22,'盒饭'),(22,'鸡排'),(23,'收藏'),(23,'钢笔'),(24,'手表'),(24,'收藏'),(25,'墨水'),(25,'收藏'),(25,'钢笔'),(26,'华为'),(26,'双摄'),(26,'手机'),(26,'拍照'),(27,'华为'),(27,'笔记本电脑'),(28,'华为'),(28,'手表'),(29,'洗衣粉'),(29,'超能'),(30,'洗衣粉'),(30,'立白'),(31,'去渍霸'),(31,'洗衣粉'),(32,'汰渍'),(32,'洗衣液'),(33,'洗衣液'),(33,'蓝月亮'),(34,'手机'),(34,'魅族'),(35,'大屏'),(35,'手机'),(35,'魅族'),(36,'手机'),(36,'新品'),(36,'魅族'),(37,'毛绒玩具'),(38,'毛绒玩具'),(39,'洁面乳'),(40,'巧克力'),(41,'水果'),(42,'水果'),(43,'凝胶剂'),(43,'金扶宁'),(44,'单抗'),(44,'注射液'),(44,'美罗华'),(45,'单抗'),(45,'注射液'),(45,'舒莱'),(46,'单抗'),(46,'拓益'),(46,'注射液'),(47,'巨无霸'),(47,'汉堡'),(47,'牛肉'),(48,'油炸'),(48,'薯条'),(49,'冰激凌'),(49,'麦旋风'),(50,'汉堡'),(50,'牛肉'),(50,'鸡排'),(51,'油炸'),(51,'面包条');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraddresses`
--

DROP TABLE IF EXISTS `useraddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraddresses` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraddresses`
--

LOCK TABLES `useraddresses` WRITE;
/*!40000 ALTER TABLE `useraddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'第灵韵','Dilingyun123456','lingyun@gmail.com','5d1d5cbe634459000715142f'),(2,'真采萱','Zhencaixuan123456','choihyun@outlook.com','5d1d5d326344590007151431'),(3,'谭凝','Tanning123456','tanning@sjtu.edu.cn','5d1d5d416344590007151433'),(4,'随千山','Suiqianshan123456','chinsaan@live.com','5d1d5d526344590007151435'),(5,'颜清秋','Yanqingqiu123456','qqyan@icloud.com','5d1d5d5e6344590007151437'),(6,'无竹','Wuzhu123456','wu_zhu@foxmail.com','5d1d5d6b6344590007151439');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23 15:49:43
