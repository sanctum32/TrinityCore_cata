-- Added rain weather to Gilneas City
-- Proof: https://youtu.be/1IW4f1mhEy0?si=HIc30howbymeSA9-&t=606
DELETE FROM `game_weather` WHERE `zone`=4755;
INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`, `ScriptName`) VALUES
(4755, 25, 0, 0, 25, 0, 0, 25, 0, 0, 25, 0, 0, '');

-- Quest texts
DELETE FROM `quest_request_items` WHERE `ID` = 14093;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14093, 0, 0, 'Have the worgen been dealt with?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14098;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14098, 0, 0, 'Have you succeeded, $n?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14266;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14266, 0, 0, 'You\'re a quick study, $N. Don\'t get overconfident, though.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14218;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14218, 0, 0, 'We must take out as many of them as we can, $N.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14222;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14222, 0, 0, 'We can do this, $N.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14347;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14347, 0, 0, 'These blaggards aren\'t so tough now, are they?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14348;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14348, 0, 0, 'They just keep coming, don\'t they?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14369;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14369, 0, 0, 'Did you take care of the Forsaken scum, $N?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14382;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14382, 0, 0, 'You\'re back, $N. How\'s the situation outside?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14368;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14368, 0, 0, 'I... I don\'t know if I can go on without them.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14386;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14386, 0, 0, 'Is it done yet, $N?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14416;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14416, 0, 0, 'You\'re back, $N.', 0);

-- Respawn time correction
-- 180s (3 min) respawn, old value - 7200s (2 hours)
UPDATE `creature` SET `spawntimesecs`=180 WHERE  `guid`=255728 AND `id`=36399;
UPDATE `creature` SET `spawntimesecs`=180 WHERE  `guid`=255724 AND `id`=36397;
update `creature` SET `spawntimesecs`=180 where `id` IN (36283, 36312, 36440);

-- Condition for spell "Toss Keg"(69094)
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 17) AND (`SourceEntry` IN (69094));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(17, 0, 69094, 0, 0, 31, 1, 3, 36231, 0, 0, 'Should target only Horrid Abomination (36231)');

-- Drowning Watchman - should be spell clickable
UPDATE `creature_template` SET `npcflag` = `npcflag` | 16777216 WHERE `entry` = 36440;

-- TODO: need to confirm
UPDATE `quest_template` SET `Flags` = `Flags`|65536 WHERE `ID` = 14375;

-- Quest chains
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14403;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14398;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397, `ExclusiveGroup` = 0 WHERE `ID` = 14406;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14416 WHERE `ID` = 14463;

-- Duplicate warrior trainer gossip
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 10694;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10694, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, NULL, 0, 15595);
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 15) AND (`SourceGroup` IN (10694));

