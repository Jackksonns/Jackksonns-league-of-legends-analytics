-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2025-04-03 05:56:53
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `loldb`
--

-- --------------------------------------------------------

--
-- 表的结构 `champion`
--

CREATE TABLE `champion` (
  `championId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('Mage','Fighter','Tank','Assassin','Marksman','Support') DEFAULT NULL,
  `baseHealth` int(11) DEFAULT NULL,
  `baseAttackDamage` int(11) DEFAULT NULL,
  `releaseDealt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `champion`
--

INSERT INTO `champion` (`championId`, `name`, `role`, `baseHealth`, `baseAttackDamage`, `releaseDealt`) VALUES
(1, 'Annie', 'Mage', 524, 50, 124),
(2, 'Darius', 'Fighter', 582, 64, 135),
(3, 'Leona', 'Tank', 576, 60, 95),
(4, 'Ahri', 'Mage', 500, 53, 130),
(5, 'Garen', 'Fighter', 620, 66, 120),
(6, 'Ezreal', 'Marksman', 500, 60, 140),
(7, 'Thresh', 'Support', 560, 55, 100),
(8, 'Katarina', 'Assassin', 510, 58, 125),
(9, 'Malphite', 'Tank', 640, 62, 110),
(10, 'Lux', 'Mage', 480, 54, 115);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `champion_combinations`
-- （参见下面的实际视图）
--
CREATE TABLE `champion_combinations` (
`championId1` int(11)
,`championId2` int(11)
,`combinationCount` bigint(21)
);

-- --------------------------------------------------------

--
-- 表的结构 `item`
--

CREATE TABLE `item` (
  `itemId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `attackDamage` int(11) DEFAULT NULL,
  `abilityPower` int(11) DEFAULT NULL,
  `passiveEffect` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `item`
--

INSERT INTO `item` (`itemId`, `name`, `cost`, `attackDamage`, `abilityPower`, `passiveEffect`) VALUES
(4001, 'Infinity Edge', 3400, 70, 0, 'Critical strikes deal extra damage'),
(4002, 'Rabaddon\'s Deathcap', 3600, 0, 120, 'Increase AP by 35%'),
(4003, 'Berserker\'s Greaves', 1100, 0, 0, 'Increases attack speed.'),
(4004, 'Redemption', 2100, 0, 0, 'Invincible for 2.5 seconds.'),
(4005, 'Void Staff', 2800, 0, 70, '40% Magic Penetration'),
(4006, 'Chemtech Purifier', 3000, 45, 0, 'Treatment for 60% additional serious injuries'),
(4007, 'Sunfire Aegis', 3200, 0, 0, 'Deal 15-30 magic damage/s to nearby enemies'),
(4008, 'Rapid Firecannon', 2500, 30, 0, 'Gain 150 range on next attack every 3s'),
(4009, 'Zhonya\'s Hourglass', 2600, 0, 70, 'Stasis active (120s CD)'),
(4010, 'Bloodthirster', 3500, 55, 0, '20% Lifesteal'),
(4011, 'Knight\'s Vow', 2700, 25, 0, 'Damage transfer + movement speed bonus'),
(4012, 'Warmog\'s Armor', 3000, 0, 0, 'Regen 5% max HP/s after 6s out of combat'),
(4013, 'Locket of the Iron Solari', 3200, 0, 80, 'Group Shield + Dual Anti-Aura'),
(4014, 'Mortal Reminder', 2500, 25, 0, 'Inflict 40% Grievous Wounds'),
(4015, 'Titanic Hydra', 3800, 0, 150, 'AP increases by 2% per 100 AP'),
(4016, 'Phantom Dancer', 2600, 25, 0, 'Gain 7% movespeed and ghosting'),
(4017, 'Iceborn Gauntlet', 3000, 40, 0, 'Create slowing field on attack'),
(4018, 'Nashor\'s Tooth', 3000, 0, 80, 'Attacks deal 15 + 20% AP magic damage'),
(4019, 'Dead Man\'s Plate', 2900, 0, 0, 'Gain up to 60 MS and crushing blow'),
(4020, 'Runaan\'s Hurricane', 2800, 25, 0, 'Attacks hit 2 additional targets'),
(4021, 'Horizon Focus', 3300, 0, 0, 'Gain 100 Armor/MR when 3+ enemies nearby'),
(4022, 'Luden\'s Tempest', 3200, 0, 90, 'Echo deals 100 + 15% AP damage'),
(4023, 'Black Cleaver', 3100, 40, 0, 'Shred 24% armor on physical damage'),
(4024, 'Silvermere Dawn', 2500, 0, 70, 'Magic damage applies 60% Grievous Wounds'),
(4025, 'Zeke\'s Convergence', 2400, 0, 0, 'Allied attacks burn for 30-70 magic damage'),
(4026, 'Essence Reaver', 3300, 55, 0, 'Spells refund 3% missing mana on hit'),
(4027, 'Stormrazor', 3100, 65, 0, 'Every 3rd attack deals 50 bonus magic damage'),
(4028, 'Hextech Gunblade', 3400, 40, 80, 'Heal 15% of damage dealt'),
(4029, 'Frozen Mallet', 3100, 30, 0, 'Basic attacks slow by 20% for 1.5s'),
(4030, 'Wit\'s End', 2900, 40, 0, 'Steals 15-80 magic resist on hit');

-- --------------------------------------------------------

--
-- 表的结构 `itembuild`
--

CREATE TABLE `itembuild` (
  `buildId` int(11) NOT NULL,
  `effectiveness` text DEFAULT NULL,
  `patchVersion` varchar(20) DEFAULT NULL,
  `buildOrder` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `itembuild`
--

INSERT INTO `itembuild` (`buildId`, `effectiveness`, `patchVersion`, `buildOrder`) VALUES
(1, 'Suitable for Mages,highly effective, suitable for high - output scenarios', '13.19', 'First buy Suction Blue Knife Solves Energy/Mana Consumption\r\nAnother storm, razor-enhanced combo burst\r\nLater technology gun improves blood-sucking battery life\r\n'),
(2, 'Suitable for assassin,moderately effective, can handle various situations', '13.19', 'First buy Wisdom Last Blade to Improve Clear Field Speed and Magic Resistance\r\nThen Ice Hammer enhances Gank retention\r\nStorm Razor Replenishes Mid-Term Damage\r\n'),
(3, 'Shooter outfits,Suitable for team fights and continuous output', '13.19', 'The first Stormrazor increases burst damage and attack speed • Essence Reaver solves mana endurance issues • Hextech Gunblade mid-stage enhances mixed damage and bloodsucking • Wit\'s End targets enemy mages • Frozen Mallet late enhances survival'),
(4, 'Tank,Enhances defense against physical damage', '13.19', 'Ice Hammer provides the ability to stick\r\nStorm Razor Enhanced Transformation Outbreak\r\nSmart Edge Against AP Order\r\n'),
(5, 'Support package for team gain and recovery', '13.19', 'First buy Ice Hammer Offers Survival and Control\r\nBackward Wisdom End Blade Against AP Down Combination\r\n');

-- --------------------------------------------------------

--
-- 表的结构 `itembuilditems`
--

CREATE TABLE `itembuilditems` (
  `buildId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `slotPosition` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `itembuilditems`
--

INSERT INTO `itembuilditems` (`buildId`, `itemId`, `slotPosition`, `quantity`) VALUES
(1, 4002, 1, 1),
(1, 4005, 2, 1),
(1, 4009, 6, 1),
(1, 4018, 5, 1),
(1, 4021, 4, 1),
(1, 4022, 1, 1),
(2, 4003, 1, 1),
(2, 4015, 4, 1),
(2, 4017, 5, 1),
(2, 4026, 6, 1),
(2, 4027, 3, 1),
(2, 4030, 2, 1),
(3, 4001, 1, 1),
(3, 4008, 2, 1),
(3, 4010, 3, 1),
(3, 4020, 5, 1),
(3, 4024, 6, 1),
(3, 4026, 4, 1),
(4, 4007, 1, 1),
(4, 4012, 3, 1),
(4, 4019, 5, 1),
(4, 4023, 6, 1),
(4, 4029, 2, 1),
(4, 4030, 4, 1),
(5, 4004, 2, 1),
(5, 4006, 4, 1),
(5, 4009, 1, 1),
(5, 4011, 5, 1),
(5, 4013, 6, 1),
(5, 4025, 3, 1);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `itembuildpopularity`
-- （参见下面的实际视图）
--
CREATE TABLE `itembuildpopularity` (
`role` enum('Mage','Fighter','Tank','Assassin','Marksman','Support')
,`championName` varchar(255)
,`itemName` varchar(255)
,`buildCount` bigint(21)
);

-- --------------------------------------------------------

--
-- 表的结构 `match`
--

CREATE TABLE `match` (
  `matchId` int(11) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `gameMode` enum('Summoner''s Rift','ARAM','Other') DEFAULT NULL,
  `patchVersion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `match`
--

INSERT INTO `match` (`matchId`, `startTime`, `duration`, `gameMode`, `patchVersion`) VALUES
(4001, '2025-03-28 10:00:00', '00:28:00', 'Summoner\'s Rift', '14.1'),
(4002, '2025-03-28 10:30:00', '00:30:00', 'Summoner\'s Rift', '14.1'),
(4003, '2025-03-28 11:00:00', '00:29:00', 'Summoner\'s Rift', '14.1'),
(4004, '2025-03-28 11:30:00', '00:30:00', 'Summoner\'s Rift', '14.1'),
(4005, '2025-03-28 12:00:00', '00:28:00', 'Summoner\'s Rift', '14.1'),
(4006, '2025-03-28 12:30:00', '00:29:00', 'Summoner\'s Rift', '14.1'),
(4007, '2025-03-28 13:00:00', '00:28:00', 'Summoner\'s Rift', '14.1'),
(4008, '2025-03-28 13:30:00', '00:30:00', 'Summoner\'s Rift', '14.1'),
(4009, '2025-03-28 14:00:00', '00:28:00', 'Summoner\'s Rift', '14.1'),
(4010, '2025-03-28 14:30:00', '00:30:00', 'Summoner\'s Rift', '14.1'),
(4011, '2025-03-28 15:00:00', '00:29:00', 'Summoner\'s Rift', '14.1'),
(4012, '2025-03-28 15:30:00', '00:28:00', 'Summoner\'s Rift', '14.1'),
(4013, '2025-03-28 16:00:00', '00:30:00', 'Summoner\'s Rift', '14.1');

-- --------------------------------------------------------

--
-- 表的结构 `matchparticipant`
--

CREATE TABLE `matchparticipant` (
  `participantId` int(11) NOT NULL,
  `kills` int(11) DEFAULT NULL,
  `deaths` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `goldEarned` int(11) DEFAULT NULL,
  `minionsKilled` int(11) DEFAULT NULL,
  `damageDealt` int(11) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL,
  `teamId` int(11) DEFAULT NULL,
  `matchId` int(11) DEFAULT NULL,
  `championId` int(11) DEFAULT NULL,
  `buildId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `matchparticipant`
--

INSERT INTO `matchparticipant` (`participantId`, `kills`, `deaths`, `assists`, `goldEarned`, `minionsKilled`, `damageDealt`, `playerId`, `teamId`, `matchId`, `championId`, `buildId`) VALUES
(10000, 10, 3, 8, 16843, 243, 43027, 1001, 2001, 4001, 1, 1),
(10001, 8, 1, 4, 15565, 222, 35509, 1002, 2001, 4001, 10, 1),
(10002, 9, 10, 29, 13939, 177, 45345, 1003, 2001, 4001, 6, 2),
(10003, 5, 5, 8, 12765, 203, 49272, 1004, 2002, 4001, 10, 2),
(10004, 4, 3, 2, 12861, 162, 57446, 1005, 2001, 4001, 3, 2),
(10005, 8, 5, 0, 13398, 134, 24039, 1006, 2002, 4001, 3, 3),
(10006, 13, 6, 7, 9006, 93, 34860, 1007, 2001, 4001, 5, 3),
(10007, 2, 0, 19, 8783, 70, 24856, 1008, 2002, 4001, 5, 4),
(10008, 6, 2, 7, 9473, 55, 15997, 1009, 2002, 4001, 9, 4),
(10009, 23, 3, 8, 11743, 52, 18723, 1010, 2002, 4001, 7, 4),
(10010, 27, 9, 10, 16714, 253, 36343, 1001, 2001, 4002, 8, 1),
(10011, 18, 5, 7, 18872, 292, 36710, 1002, 2001, 4002, 1, 1),
(10012, 15, 8, 9, 18541, 261, 45568, 1003, 2001, 4002, 3, 1),
(10013, 6, 9, 10, 15050, 170, 45680, 1004, 2002, 4002, 1, 2),
(10014, 9, 5, 6, 14807, 175, 54018, 1005, 2002, 4002, 3, 2),
(10015, 8, 6, 4, 14250, 198, 48110, 1006, 2001, 4002, 5, 2),
(10016, 14, 9, 5, 14464, 282, 42775, 1007, 2002, 4002, 5, 1),
(10017, 15, 11, 3, 13730, 296, 42807, 1008, 2001, 4002, 5, 1),
(10018, 12, 11, 6, 17917, 295, 44684, 1009, 2002, 4002, 9, 1),
(10019, 11, 6, 11, 13258, 225, 51948, 1010, 2002, 4002, 7, 2),
(10020, 11, 7, 11, 11906, 227, 47242, 1001, 2001, 4003, 8, 2),
(10021, 12, 8, 11, 16527, 191, 56750, 1002, 2001, 4003, 9, 2),
(10022, 7, 4, 17, 12133, 123, 23390, 1003, 2001, 4003, 10, 3),
(10023, 6, 4, 16, 10331, 125, 27044, 1004, 2001, 4003, 2, 3),
(10024, 9, 4, 13, 10934, 116, 26986, 1005, 2001, 4003, 3, 3),
(10025, 5, 1, 19, 10765, 48, 20811, 1006, 2002, 4003, 1, 4),
(10026, 3, 3, 20, 11008, 43, 24183, 1007, 2002, 4003, 2, 4),
(10027, 3, 1, 18, 10989, 41, 22769, 1008, 2002, 4003, 5, 4),
(10028, 13, 8, 6, 14277, 258, 40396, 1009, 2002, 4003, 10, 1),
(10029, 12, 9, 4, 13381, 219, 47048, 1010, 2002, 4003, 7, 1),
(10030, 12, 8, 4, 16053, 277, 43204, 1001, 2001, 4004, 3, 1),
(10031, 10, 8, 12, 13529, 187, 41373, 1002, 2001, 4004, 6, 2),
(10032, 11, 7, 11, 16660, 190, 54498, 1003, 2002, 4004, 3, 2),
(10033, 12, 5, 8, 11549, 172, 42843, 1010, 2001, 4004, 7, 2),
(10034, 7, 4, 14, 13302, 141, 32004, 1005, 2001, 4004, 3, 3),
(10035, 7, 4, 17, 10861, 112, 22809, 1006, 2002, 4004, 4, 3),
(10036, 6, 5, 16, 11769, 94, 25630, 1007, 2002, 4004, 10, 3),
(10037, 4, 1, 20, 8272, 37, 24709, 1008, 2002, 4004, 5, 4),
(10038, 4, 3, 21, 9068, 37, 20390, 1009, 2002, 4004, 6, 4),
(10039, 3, 3, 22, 8135, 55, 24112, 1009, 2001, 4011, 7, 4),
(10040, 14, 11, 6, 13003, 226, 40123, 1001, 2001, 4005, 5, 1),
(10041, 13, 8, 3, 19315, 248, 45880, 1002, 2002, 4005, 10, 1),
(10042, 13, 10, 4, 14172, 266, 47060, 1003, 2001, 4005, 6, 1),
(10043, 9, 6, 11, 11217, 211, 54764, 1010, 2001, 4012, 7, 2),
(10044, 9, 7, 12, 13297, 205, 46989, 1005, 2001, 4005, 3, 2),
(10045, 11, 8, 8, 14890, 165, 40492, 1006, 2002, 4005, 6, 2),
(10046, 7, 3, 15, 11705, 124, 28042, 1007, 2002, 4005, 1, 3),
(10047, 9, 3, 13, 12924, 102, 23394, 1008, 2002, 4005, 5, 3),
(10048, 6, 5, 16, 9913, 96, 29399, 1009, 2002, 4005, 4, 3),
(10049, 5, 2, 19, 9141, 43, 15225, 1010, 2001, 4005, 7, 4),
(10050, 6, 3, 22, 8641, 58, 23834, 1001, 2001, 4006, 9, 4),
(10051, 6, 3, 18, 10482, 71, 15713, 1002, 2001, 4006, 5, 4),
(10052, 14, 8, 7, 19021, 208, 47828, 1003, 2001, 4006, 3, 1),
(10053, 13, 12, 5, 13102, 250, 42390, 1004, 2001, 4006, 8, 1),
(10054, 14, 12, 3, 19590, 222, 39861, 1005, 2001, 4006, 3, 1),
(10055, 10, 6, 9, 16586, 204, 52480, 1006, 2002, 4006, 8, 2),
(10056, 10, 6, 8, 11417, 188, 43417, 1007, 2002, 4006, 7, 2),
(10057, 12, 7, 9, 13559, 199, 56425, 1008, 2002, 4006, 5, 2),
(10058, 6, 4, 17, 10229, 133, 21334, 1009, 2002, 4006, 1, 3),
(10059, 7, 5, 17, 9745, 113, 34163, 1010, 2002, 4006, 7, 3),
(10060, 7, 3, 13, 10432, 121, 22076, 1001, 2001, 4007, 10, 3),
(10061, 4, 1, 21, 11467, 32, 20817, 1002, 2001, 4007, 1, 4),
(10062, 3, 3, 18, 10756, 30, 23019, 1003, 2002, 4007, 2, 4),
(10063, 4, 3, 20, 11882, 53, 19516, 1004, 2001, 4007, 5, 4),
(10064, 14, 12, 4, 18808, 279, 42195, 1005, 2001, 4007, 3, 1),
(10065, 12, 12, 4, 13119, 264, 37713, 1010, 2002, 4007, 7, 1),
(10066, 13, 12, 6, 19755, 228, 42792, 1007, 2002, 4007, 3, 1),
(10067, 11, 5, 8, 15491, 164, 53541, 1008, 2002, 4007, 5, 2),
(10068, 12, 5, 9, 15989, 160, 42773, 1009, 2002, 4007, 1, 2),
(10069, 11, 8, 11, 12879, 162, 56253, 1010, 2001, 4013, 7, 2),
(10070, 6, 3, 14, 12058, 123, 24039, 1001, 2001, 4008, 1, 3),
(10071, 7, 3, 16, 11418, 122, 29050, 1002, 2002, 4008, 1, 3),
(10072, 9, 5, 17, 9919, 87, 34939, 1003, 2001, 4008, 5, 3),
(10073, 4, 2, 20, 10255, 43, 18862, 1004, 2001, 4008, 10, 4),
(10074, 5, 3, 21, 7638, 53, 15128, 1005, 2001, 4008, 3, 4),
(10075, 4, 1, 19, 10134, 34, 20995, 1006, 2002, 4008, 6, 4),
(10076, 12, 10, 4, 17965, 274, 44218, 1007, 2002, 4008, 9, 1),
(10077, 12, 8, 6, 18789, 229, 49643, 1008, 2002, 4008, 5, 1),
(10078, 15, 9, 5, 13047, 210, 42596, 1009, 2001, 4008, 2, 1),
(10079, 10, 7, 12, 12295, 194, 43090, 1010, 2002, 4008, 7, 2),
(10080, 12, 8, 11, 11547, 229, 53812, 1001, 2002, 4009, 8, 2),
(10081, 9, 8, 9, 13846, 174, 41578, 1002, 2001, 4009, 8, 2),
(10082, 7, 4, 14, 11466, 96, 30008, 1003, 2001, 4009, 4, 3),
(10083, 7, 3, 17, 12239, 96, 23683, 1004, 2001, 4009, 9, 3),
(10084, 7, 5, 17, 11570, 138, 29429, 1005, 2001, 4009, 3, 3),
(10085, 3, 2, 20, 10202, 45, 21598, 1006, 2002, 4009, 2, 4),
(10086, 5, 1, 20, 8752, 68, 23150, 1007, 2002, 4009, 9, 4),
(10087, 6, 3, 18, 10776, 46, 18904, 1008, 2002, 4009, 5, 4),
(10088, 14, 12, 7, 19710, 262, 38483, 1009, 2002, 4009, 4, 1),
(10089, 15, 12, 5, 15074, 278, 35527, 1010, 2001, 4009, 7, 1),
(10090, 12, 10, 4, 18749, 200, 43124, 1001, 2001, 4010, 1, 1),
(10091, 11, 6, 9, 15228, 221, 47622, 1002, 2001, 4010, 6, 2),
(10092, 11, 5, 8, 12249, 221, 57303, 1003, 2002, 4010, 5, 2),
(10093, 11, 8, 9, 14790, 195, 58457, 1004, 2001, 4010, 8, 2),
(10094, 8, 3, 16, 13616, 139, 27056, 1005, 2001, 4010, 3, 3),
(10095, 8, 5, 16, 13039, 123, 30776, 1006, 2002, 4010, 10, 3),
(10096, 7, 3, 13, 12534, 106, 31618, 1007, 2001, 4010, 3, 3),
(10097, 5, 3, 18, 10679, 47, 20687, 1008, 2002, 4010, 5, 4),
(10098, 4, 2, 21, 10890, 39, 20867, 1009, 2002, 4010, 1, 4),
(10099, 4, 3, 21, 8906, 37, 20869, 1010, 2002, 4010, 7, 4),
(10100, 6, 3, 22, 8641, 58, 23834, 1003, 2001, 4011, 8, 4),
(10101, 6, 3, 18, 10482, 71, 15713, 1008, 2001, 4011, 5, 4),
(10102, 14, 8, 7, 19021, 208, 47828, 1004, 2001, 4011, 3, 1),
(10103, 13, 12, 5, 13102, 250, 42390, 1005, 2001, 4011, 3, 1),
(10104, 14, 12, 3, 19590, 222, 39861, 1001, 2001, 4011, 10, 1),
(10105, 10, 6, 9, 16586, 204, 52480, 1002, 2002, 4011, 8, 2),
(10106, 10, 6, 8, 11417, 188, 43417, 1007, 2002, 4011, 7, 2),
(10107, 12, 7, 9, 13559, 199, 56425, 1008, 2002, 4012, 5, 2),
(10108, 6, 4, 17, 10229, 133, 21334, 1010, 2001, 4011, 1, 3),
(10109, 7, 5, 17, 9745, 113, 34163, 1006, 2002, 4011, 3, 3),
(10110, 7, 3, 13, 10432, 121, 22076, 1006, 2001, 4007, 10, 3),
(10111, 4, 1, 21, 11467, 32, 20817, 1005, 2001, 4012, 3, 4),
(10112, 3, 3, 18, 10756, 30, 23019, 1006, 2001, 4012, 6, 4),
(10113, 4, 3, 20, 11882, 53, 19516, 1004, 2001, 4004, 5, 4),
(10114, 14, 12, 4, 18808, 279, 42195, 1007, 2001, 4012, 6, 1),
(10115, 12, 12, 4, 13119, 264, 37713, 1009, 2001, 4012, 7, 1),
(10116, 13, 12, 6, 19755, 228, 42792, 1002, 2001, 4012, 3, 1),
(10117, 11, 5, 8, 15491, 164, 53541, 1003, 2001, 4012, 6, 2),
(10118, 12, 5, 9, 15989, 160, 42773, 1001, 2001, 4012, 1, 2),
(10119, 11, 8, 11, 12879, 162, 56253, 1004, 2001, 4005, 7, 2),
(10120, 6, 3, 14, 12058, 123, 24039, 1002, 2001, 4013, 1, 3),
(10121, 7, 3, 16, 11418, 122, 29050, 1009, 2001, 4013, 1, 3),
(10122, 9, 5, 17, 9919, 87, 34939, 1008, 2001, 4013, 5, 3),
(10123, 4, 2, 20, 10255, 43, 18862, 1006, 2001, 4013, 10, 4),
(10124, 5, 3, 21, 7638, 53, 15128, 1001, 2001, 4013, 3, 4),
(10125, 4, 1, 19, 10134, 34, 20995, 1005, 2001, 4013, 3, 4),
(10126, 12, 10, 4, 17965, 274, 44218, 1004, 2001, 4012, 9, 1),
(10127, 12, 8, 6, 18789, 229, 49643, 1003, 2001, 4013, 8, 1),
(10128, 15, 9, 5, 13047, 210, 42596, 1004, 2001, 4013, 2, 1),
(10129, 10, 7, 12, 12295, 194, 43090, 1007, 2001, 4013, 7, 2);

-- --------------------------------------------------------

--
-- 表的结构 `player`
--

CREATE TABLE `player` (
  `playerId` int(11) NOT NULL,
  `summonerName` varchar(255) NOT NULL,
  `accountLevel` int(11) DEFAULT NULL,
  `rankedTier` enum('Bronze','Silver','Gold','Platinum','Diamond','Master','Grandmaster','Challenger') DEFAULT NULL,
  `cladKp` int(11) DEFAULT NULL,
  `registrationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `player`
--

INSERT INTO `player` (`playerId`, `summonerName`, `accountLevel`, `rankedTier`, `cladKp`, `registrationDate`) VALUES
(1001, 'ProPlayer1', 257, 'Challenger', 85, '2020-03-15'),
(1002, 'SuppMain', 182, 'Diamond', 62, '2021-07-22'),
(1003, 'TopOrFeed', 155, 'Platinum', 45, '2022-01-10'),
(1004, 'AceJungler', 245, 'Master', 78, '2023-01-05'),
(1005, 'MidLanePro', 231, 'Grandmaster', 83, '2023-02-18'),
(1006, 'BotDuoKing', 219, 'Challenger', 91, '2023-03-12'),
(1007, 'WardSlayer', 198, 'Diamond', 67, '2023-04-25'),
(1008, 'BaronCaller', 185, 'Diamond', 59, '2023-05-30'),
(1009, 'DragonTimer', 173, 'Platinum', 52, '2023-06-14'),
(1010, 'GGPushMid', 162, 'Gold', 48, '2023-07-01');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `playerchampionstats`
-- （参见下面的实际视图）
--
CREATE TABLE `playerchampionstats` (
`summonerName` varchar(255)
,`championName` varchar(255)
,`avgKills` decimal(13,2)
,`avgDeaths` decimal(13,2)
,`avgAssists` decimal(13,2)
,`gamesPlayed` bigint(21)
);

-- --------------------------------------------------------

--
-- 表的结构 `playerskin`
--

CREATE TABLE `playerskin` (
  `playerSkinId` int(11) NOT NULL,
  `playerId` int(11) DEFAULT NULL,
  `skinId` int(11) DEFAULT NULL,
  `skinLevel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `playerskin`
--

INSERT INTO `playerskin` (`playerSkinId`, `playerId`, `skinId`, `skinLevel`) VALUES
(1, 1001, 125, 'Ultimate'),
(2, 1001, 137, 'Ultimate'),
(3, 1001, 110, 'Legendary'),
(4, 1005, 113, 'Legendary'),
(5, 1005, 138, 'Legendary'),
(6, 1005, 131, 'Legendary'),
(7, 1004, 116, 'Ultimate'),
(8, 1004, 119, 'Legendary'),
(9, 1004, 135, 'Legendary'),
(10, 1007, 123, 'Epic'),
(11, 1007, 129, 'Epic'),
(12, 1007, 134, 'Epic'),
(13, 1009, 118, 'Rare'),
(14, 1009, 124, 'Standard'),
(15, 1009, 136, 'Standard'),
(16, 1010, 112, 'Epic'),
(17, 1010, 127, 'Standard'),
(18, 1010, 133, 'Standard'),
(19, 1001, 111, 'Mythic'),
(20, 1005, 111, 'Mythic'),
(21, 1004, 111, 'Mythic'),
(22, 1001, 128, 'Legendary'),
(23, 1006, 137, 'Ultimate'),
(24, 1006, 125, 'Ultimate');

-- --------------------------------------------------------

--
-- 表的结构 `skin`
--

CREATE TABLE `skin` (
  `skinId` int(11) NOT NULL,
  `championId` int(11) DEFAULT NULL,
  `skinName` varchar(255) DEFAULT NULL,
  `skinLevel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `skin`
--

INSERT INTO `skin` (`skinId`, `championId`, `skinName`, `skinLevel`) VALUES
(110, 1, 'Super Galaxy Annie', 'Legendary'),
(111, 1, 'Hextech Annie', 'Mythic'),
(112, 1, 'Panda Annie', 'Epic'),
(113, 2, 'Dunkmaster Darius', 'Legendary'),
(114, 2, 'God-King Darius', 'Epic'),
(115, 2, 'Academy Darius', 'Rare'),
(116, 3, 'Solar Eclipse Leona', 'Ultimate'),
(117, 3, 'Mecha Kingdoms Leona', 'Epic'),
(118, 3, 'Pool Party Leona', 'Rare'),
(119, 4, 'Star Guardian Ahri', 'Legendary'),
(120, 4, 'K/DA Ahri', 'Epic'),
(121, 4, 'Dynasty Ahri', 'Rare'),
(122, 5, 'Demacia Vice Garen', 'Legendary'),
(123, 5, 'Steel Legion Garen', 'Epic'),
(124, 5, 'Rugged Garen', 'Standard'),
(125, 6, 'Pulsefire Ezreal', 'Ultimate'),
(126, 6, 'SSG Ezreal', 'Epic'),
(127, 6, 'Explorer Ezreal', 'Standard'),
(128, 7, 'Spirit Blossom Thresh', 'Legendary'),
(129, 7, 'High Noon Thresh', 'Epic'),
(130, 7, 'Deep Terror Thresh', 'Rare'),
(131, 8, 'Battle Queen Katarina', 'Legendary'),
(132, 8, 'Death Sworn Katarina', 'Epic'),
(133, 8, 'Mercenary Katarina', 'Standard'),
(134, 9, 'Dark Star Malphite', 'Epic'),
(135, 9, 'Mecha Malphite', 'Legendary'),
(136, 9, 'Coral Reef Malphite', 'Standard'),
(137, 10, 'Elementalist Lux', 'Ultimate'),
(138, 10, 'Cosmic Lux', 'Legendary'),
(139, 10, 'Steel Legion Lux', 'Epic');

-- --------------------------------------------------------

--
-- 表的结构 `team`
--

CREATE TABLE `team` (
  `teamId` int(11) NOT NULL,
  `teamName` varchar(255) DEFAULT NULL,
  `formation` varchar(50) DEFAULT NULL,
  `bars` int(11) DEFAULT NULL,
  `side` enum('Blue','Red') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `team`
--

INSERT INTO `team` (`teamId`, `teamName`, `formation`, `bars`, `side`) VALUES
(2001, 'Blue Squad', 'Standard', 3, 'Blue'),
(2002, 'Red Legion', 'Split Push', 2, 'Red');

-- --------------------------------------------------------

--
-- 视图结构 `champion_combinations`
--
DROP TABLE IF EXISTS `champion_combinations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `champion_combinations`  AS SELECT least(`mp1`.`championId`,`mp2`.`championId`) AS `championId1`, greatest(`mp1`.`championId`,`mp2`.`championId`) AS `championId2`, count(0) AS `combinationCount` FROM (`matchparticipant` `mp1` join `matchparticipant` `mp2` on(`mp1`.`matchId` = `mp2`.`matchId` and `mp1`.`participantId` < `mp2`.`participantId` and `mp1`.`championId` <> `mp2`.`championId`)) GROUP BY least(`mp1`.`championId`,`mp2`.`championId`), greatest(`mp1`.`championId`,`mp2`.`championId`) ORDER BY count(0) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- 视图结构 `itembuildpopularity`
--
DROP TABLE IF EXISTS `itembuildpopularity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itembuildpopularity`  AS SELECT `c`.`role` AS `role`, `c`.`name` AS `championName`, `i`.`name` AS `itemName`, count(0) AS `buildCount` FROM ((((`matchparticipant` `mp` join `champion` `c` on(`mp`.`championId` = `c`.`championId`)) join `itembuild` `ib` on(`mp`.`buildId` = `ib`.`buildId`)) join `itembuilditems` `ibi` on(`ib`.`buildId` = `ibi`.`buildId`)) join `item` `i` on(`ibi`.`itemId` = `i`.`itemId`)) GROUP BY `c`.`role`, `c`.`name`, `i`.`name` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- 视图结构 `playerchampionstats`
--
DROP TABLE IF EXISTS `playerchampionstats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `playerchampionstats`  AS SELECT `p`.`summonerName` AS `summonerName`, `c`.`name` AS `championName`, round(avg(`mp`.`kills`),2) AS `avgKills`, round(avg(`mp`.`deaths`),2) AS `avgDeaths`, round(avg(`mp`.`assists`),2) AS `avgAssists`, count(0) AS `gamesPlayed` FROM ((`matchparticipant` `mp` join `player` `p` on(`mp`.`playerId` = `p`.`playerId`)) join `champion` `c` on(`mp`.`championId` = `c`.`championId`)) GROUP BY `p`.`summonerName`, `c`.`name` HAVING count(0) > 10 ORDER BY `p`.`summonerName` ASC, count(0) DESC ;

--
-- 转储表的索引
--

--
-- 表的索引 `champion`
--
ALTER TABLE `champion`
  ADD PRIMARY KEY (`championId`);

--
-- 表的索引 `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemId`);

--
-- 表的索引 `itembuild`
--
ALTER TABLE `itembuild`
  ADD PRIMARY KEY (`buildId`);

--
-- 表的索引 `itembuilditems`
--
ALTER TABLE `itembuilditems`
  ADD PRIMARY KEY (`buildId`,`itemId`),
  ADD KEY `itemId` (`itemId`);

--
-- 表的索引 `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`matchId`);

--
-- 表的索引 `matchparticipant`
--
ALTER TABLE `matchparticipant`
  ADD PRIMARY KEY (`participantId`),
  ADD KEY `playerId` (`playerId`),
  ADD KEY `teamId` (`teamId`),
  ADD KEY `matchId` (`matchId`),
  ADD KEY `championId` (`championId`),
  ADD KEY `buildId` (`buildId`);

--
-- 表的索引 `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`playerId`),
  ADD UNIQUE KEY `summonerName` (`summonerName`);

--
-- 表的索引 `playerskin`
--
ALTER TABLE `playerskin`
  ADD PRIMARY KEY (`playerSkinId`),
  ADD KEY `playerId` (`playerId`),
  ADD KEY `skinId` (`skinId`);

--
-- 表的索引 `skin`
--
ALTER TABLE `skin`
  ADD PRIMARY KEY (`skinId`),
  ADD KEY `championId` (`championId`);

--
-- 表的索引 `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamId`);

--
-- 限制导出的表
--

--
-- 限制表 `itembuilditems`
--
ALTER TABLE `itembuilditems`
  ADD CONSTRAINT `itembuilditems_ibfk_1` FOREIGN KEY (`buildId`) REFERENCES `itembuild` (`buildId`) ON DELETE CASCADE,
  ADD CONSTRAINT `itembuilditems_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`) ON DELETE CASCADE;

--
-- 限制表 `matchparticipant`
--
ALTER TABLE `matchparticipant`
  ADD CONSTRAINT `matchparticipant_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `player` (`playerId`) ON DELETE SET NULL,
  ADD CONSTRAINT `matchparticipant_ibfk_2` FOREIGN KEY (`teamId`) REFERENCES `team` (`teamId`) ON DELETE SET NULL,
  ADD CONSTRAINT `matchparticipant_ibfk_3` FOREIGN KEY (`matchId`) REFERENCES `match` (`matchId`) ON DELETE CASCADE,
  ADD CONSTRAINT `matchparticipant_ibfk_4` FOREIGN KEY (`championId`) REFERENCES `champion` (`championId`) ON DELETE SET NULL,
  ADD CONSTRAINT `matchparticipant_ibfk_5` FOREIGN KEY (`buildId`) REFERENCES `itembuild` (`buildId`) ON DELETE SET NULL;

--
-- 限制表 `playerskin`
--
ALTER TABLE `playerskin`
  ADD CONSTRAINT `playerskin_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `player` (`playerId`) ON DELETE CASCADE,
  ADD CONSTRAINT `playerskin_ibfk_2` FOREIGN KEY (`skinId`) REFERENCES `skin` (`skinId`) ON DELETE CASCADE;

--
-- 限制表 `skin`
--
ALTER TABLE `skin`
  ADD CONSTRAINT `skin_ibfk_1` FOREIGN KEY (`championId`) REFERENCES `champion` (`championId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
