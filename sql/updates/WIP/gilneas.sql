-- Added rain weather to Gilneas City
-- Proof: https://youtu.be/1IW4f1mhEy0?si=HIc30howbymeSA9-&t=606
DELETE FROM `game_weather` WHERE `zone`=4755;
INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`, `ScriptName`) VALUES
(4755, 25, 0, 0, 25, 0, 0, 25, 0, 0, 25, 0, 0, NULL);

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

UPDATE `quest_template` SET `Flags` = `Flags`|65536 WHERE `ID` = 14375;

-- Duplicate warrior trainer gossip
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 10694;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10694, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, NULL, 0, 15595);
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 15) AND (`SourceGroup` IN (10694));

