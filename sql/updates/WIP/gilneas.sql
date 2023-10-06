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
(14266, 0, 0, 'You\'re a quick study, $n. Don\'t get overconfident, though.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14218;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14218, 0, 0, 'We must take out as many of them as we can, $n.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14222;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14222, 0, 0, 'We can do this, $n.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14347;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14347, 0, 0, 'These blaggards aren\'t so tough now, are they?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14348;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14348, 0, 0, 'They just keep coming, don\'t they?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14369;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14369, 0, 0, 'Did you take care of the Forsaken scum, $n?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14382;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14382, 0, 0, 'You\'re back, $n. How\'s the situation outside?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14368;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14368, 0, 0, 'I... I don\'t know if I can go on without them.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14386;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14386, 0, 0, 'Is it done yet, $n?', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14416;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14416, 0, 0, 'You\'re back, $n.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14275;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14275, 0, 0, 0, 0, 0, 0, 0, 0, '$n!  I knew you had to be around here.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14276;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14276, 0, 0, 'You\'re a fast learner.  We\'ll show these worgen whi the real hunters are.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14276;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14276, 0, 0, 0, 0, 0, 0, 0, 0, 'Excellent work, $n.  These worgen will regret ever setting foot in our lands.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14269;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14269, 0, 0, 0, 0, 0, 0, 0, 0, 'Oh, hey! There you are!', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14272;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14272, 0, 0, 'Keep your head down and maybe the worgen will go for some other poor fool instead of us.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14272;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14272, 0, 0, 0, 0, 0, 0, 0, 0, 'Don\'t get ahead of yourself now. Just remember who taught you everything you know.$B$BAnd now let\'s see if we can get out of this city with our skins attached.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14278;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14278, 0, 0, 0, 0, 0, 0, 0, 0, 'The Light is with you, $n. It\'s still quite a relief to see you.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14279;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14279, 0, 0, 'You are learning swiftly, my dear.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14279;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14279, 0, 0, 0, 0, 0, 0, 0, 0, 'You are blessed, $n. The Light shines upon you, even in these dark times.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14281;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14281, 0, 0, 'I always knew you were a quick study!', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14273;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14273, 0, 0, 0, 0, 0, 0, 0, 0, 'A darkness has descended over our lands. And not our kind of darkness, if you know what I mean.', 0);

DELETE FROM `quest_request_items` WHERE `ID` = 14274;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(14274, 0, 0, 'You\'re doing well, $n.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14274;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14274, 0, 0, 0, 0, 0, 0, 0, 0, 'Yes! You can feel the power, can\'t you?', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14285;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14285, 0, 0, 0, 0, 0, 0, 0, 0, 'You\'ve done well in coming here. If we Gilneans stick together we might yet defeat this terrible enemy.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14290;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14290, 0, 0, 0, 0, 0, 0, 0, 0, 'You\'ve done well in coming here.  If we Gilneans stick together we might yet defeat this terrible enemy.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14289;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14289, 0, 0, 0, 0, 0, 0, 0, 0, 'You\'ve done well in coming here. If we Gilneans stick together we might yet defeat this terrible enemy.', 0);

DELETE FROM `quest_offer_reward` WHERE `ID` = 14287;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `EmoteDelay1`, `Emote2`, `EmoteDelay2`, `Emote3`, `EmoteDelay3`, `Emote4`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(14287, 0, 0, 0, 0, 0, 0, 0, 0, 'You\'ve done well in coming here. If we Gilneans stick together we might yet defeat this terrible enemy.', 0);

-- Respawn time correction
-- 180s (3 min) respawn, old value - 7200s (2 hours)
update `creature` SET `spawntimesecs`=180 where `id` IN
(
    36283,  -- Forsaken Catapult
    36312,  -- Dark Ranger Thyala
    36440,  -- Drowning Watchman
    36540,  -- Mountain Horse
    36397,  -- Captain Anson
    36399   -- Captain Morris
);

-- Condition for spell "Toss Keg"(69094)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 69094;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(17, 0, 69094, 0, 0, 31, 1, 3, 36231, 0, 0, 'Should target only Horrid Abomination (36231)');

-- Drowning Watchman - should be spell clickable
UPDATE `creature_template` SET `npcflag` = `npcflag` | 16777216 WHERE `entry` = 36440;

-- Quest chains
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14403;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14398;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 /*, `ExclusiveGroup` = 0*/ WHERE `ID` = 14406;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14416 WHERE `ID` = 14463;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14400/*, `ExclusiveGroup` = 0*/ WHERE `ID` = 14401;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` = 14465;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14401 WHERE `ID` = 14402;

-- Duplicate warrior trainer gossip
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 10694;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10694, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, NULL, 0, 15595);
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 15) AND (`SourceGroup` IN (10694));

-- corrected phase for "Grandma's Good Clothes"
UPDATE `gameobject` SET `PhaseId`=183 WHERE  `guid`=236357 AND `id`=196472;

-- Hunter trainer - Gilneas city
UPDATE `creature_trainer` SET `MenuID`=10697, `OptionID`=1 WHERE  `CreatureID`=44461 AND `MenuID`=0 AND `OptionID`=3;
UPDATE `creature_trainer` SET `MenuID`=10697, `OptionID`=1 WHERE  `CreatureID`=35874 AND `MenuID`=0 AND `OptionID`=3;
DELETE FROM `gossip_menu_option` WHERE `MenuID`=10697 AND `OptionID`=1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcflag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10697, 1, 3, 'Train me!', 3266, 5, 16, 0, 0, 0, 0, NULL, 0, 0);

-- Rogue trainer - Gilneas city
UPDATE `creature_trainer` SET `MenuID`=10699, `OptionID`=1 WHERE  `CreatureID`=44464 AND `MenuID`=0 AND `OptionID`=3;
UPDATE `creature_trainer` SET `MenuID`=10699, `OptionID`=1 WHERE `CreatureID`=35871 AND `MenuID`=0 AND `OptionID`=3;
DELETE FROM `gossip_menu_option` WHERE `MenuID`=10699 AND `OptionID`=1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcflag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10699, 1, 3, 'Train me!', 3266, 5, 16, 0, 0, 0, 0, NULL, 0, 0);

-- Mage trainer - Gilneas city
DELETE FROM `gossip_menu_option` WHERE  `MenuID`=10698 AND `OptionID`=1;

-- Warlock trainer - Gilneas city
UPDATE `creature_trainer` SET `MenuID`=10702, `OptionID`=1 WHERE  `CreatureID`=44469 AND `MenuID`=0 AND `OptionID`=3;
UPDATE `creature_trainer` SET `MenuID`=10702, `OptionID`=1 WHERE  `CreatureID`=35869 AND `MenuID`=0 AND `OptionID`=3;
DELETE FROM `gossip_menu_option` WHERE `MenuID`=10702 AND `OptionID`=1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcflag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10702, 1, 3, 'Train me!', 3266, 5, 16, 0, 0, 0, 0, NULL, 0, 0);

UPDATE creature_template SET AIName='', ScriptName='npc_lorna_crowley_gilneas_p1' WHERE entry=35378;

-- ---------------------
-- Quest 14416
-- ---------------------

-- 68916 Mountain Horse Dummy
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=68916;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 68916, 0, 0, 31, 0, 3, 36540, 0, 0, 0, 0, '', 'Mountain Horse Dummy - Can target Mountain Horse'),
(13, 1, 68916, 0, 1, 31, 0, 3, 36555, 0, 0, 0, 0, '', 'Mountain Horse Dummy - Can target Mountain Horse');

-- 68908 Rope in Horse
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=68908;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 68908, 0, 0, 31, 1, 3, 36540, 0, 0, 0, 0, '', 'should target only Mountain Horse');

 -- Mountain Horse smart ai
SET @ENTRY := 36540;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryOrGuid` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 8, 0, 100, 0, 68903, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On spell  Round Up Horse (68903) hit - Self: Despawn instantly');

 -- Mountain Horse smart ai
SET @ENTRY := 36555;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 0, 11, 68940, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Mountain Horse - On Just Summoned - Cast Rope Channel'),
(@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mountain Horse - On Just Summoned (linked) - set react state to passive'),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Mountain Horse - On Just Summoned (linked) - follow invoker');

UPDATE creature SET ScriptName='npc_gilneas_mountain_horse_qtrigger', phaseId=183, phaseGroup=0 WHERE guid=255604 AND id=35374;

DELETE FROM `spell_script_names` WHERE `spell_id`=68916 AND `ScriptName`='spell_gilneas_mountain_horse_dummy';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(68916, 'spell_gilneas_mountain_horse_dummy');

-- -------------------------
-- Last Chance at Humanity
-- -------------------------
-- Quest should instantly point to reward window
-- UPDATE quest_template set flags=0x00000008|0x00040000 WHERE id=14375;

-- Quest giver flag should be added in timed action
UPDATE creature_template SET npcflag=npcflag &~ 2 WHERE entry=36332;

DELETE FROM `smart_scripts` WHERE `entryorguid`=3633000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3633000, 9, 0, 0, 0, 0, 100, 0, 1200, 1200, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Set Walk'),
(3633000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, -1840.08, 2293.04, 42.53, 0, 'Move to Pos'),
(3633000, 9, 2, 0, 0, 0, 100, 0, 5300, 5300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text');
DELETE FROM `smart_scripts` WHERE `entryorguid`=36330 AND `source_type`=0 AND `id`=2 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36330, 0, 2, 0, 34, 0, 100, 0, 8, 1, 0, 0, 0, 69, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, -1821.92, 2295.05, 42.1705, 0, 'On Movement Inform - move to position');
DELETE FROM waypoints WHERE entry = 36330;

-- Rogue trainer
DELETE FROM `gossip_menu_option` WHERE `MenuID`=10843 AND `OptionID`=1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcflag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10843, 1, 3, 'Train me!', 3266, 5, 16, 0, 0, 0, 0, NULL, 0, 0);
DELETE FROM `creature_trainer` WHERE `CreatureID`=36630 AND `MenuID`=10843 AND `OptionID`=1;
INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES
(36630, 33, 10843, 1);

-- Warlock trainer
UPDATE `creature_trainer` SET `MenuID`=10840, `OptionID`=1 WHERE  `CreatureID`=36652 AND `MenuID`=0 AND `OptionID`=3;
DELETE FROM `gossip_menu_option` WHERE `MenuID`=10840 AND `OptionID`=1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcflag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(10840, 1, 3, 'Train me!', 3266, 5, 16, 0, 0, 0, 0, NULL, 0, 0);
