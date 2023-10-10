-- --------------------------------------
-- WARNING! this still is in development and is not ready for final usage!
-- --------------------------------------

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
    36399,  -- Captain Morris
    34511,  -- Forsaken Invader (had 1 min respawn)
    36231,  -- Horrid Abomination (had 1 min respawn)
    36396,  -- Forsaken Sailor
    36236,  -- Forsaken Footsoldier
    36460   -- Forsaken Survivor
);

-- Condition for spell "Toss Keg"(69094)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 69094;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(17, 0, 69094, 0, 0, 31, 1, 3, 36231, 0, 0, 'Should target only Horrid Abomination (36231)');

-- Drowning Watchman - should be spell clickable
UPDATE `creature_template` SET `npcflag` = `npcflag` | 0x01000000 WHERE `entry` = 36440;

-- Quest chains
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14403;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 WHERE `ID` = 14398;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14397 /*, `ExclusiveGroup` = 0*/ WHERE `ID` = 14406;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14416 WHERE `ID` = 14463;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14400, `ExclusiveGroup` = 0 WHERE `ID` = 14401;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` = 14465;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14401 WHERE `ID` = 14402;
UPDATE `quest_template_addon` SET `PrevQuestID` = 14406 WHERE `ID` = 14416;

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

-- Duplicate spawns
delete from creature where id = 36440 AND guid IN (255801, 255806, 255822);

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

-- Chris Moller <Pie Vendor>
UPDATE `gossip_menu_option` SET `OptionType`=1, `OptionNpcflag`=1 WHERE  `MenuID`=11794 AND `OptionID`=1;
UPDATE `gossip_menu_option` SET `OptionType`=3, `OptionNpcflag`=128 WHERE  `MenuID`=11794 AND `OptionID`=0;

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
-- Last Chance at Humanity 14375
-- -------------------------
-- Quest should instantly point to reward window
-- UPDATE quest_template set flags=0x00000008|0x00040000 WHERE id=14375;

-- Quest giver flag should be added in timed action
UPDATE creature_template SET npcflag=npcflag &~ 2 WHERE entry=36332;

-- ------------------------------
-- Quest: Grandma's Cat 14401
-- ------------------------------
-- Chance - should be spell clickable
UPDATE `creature_template` SET `npcflag` = `npcflag` | 0x01000000 WHERE `entry` = 36459;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36459 AND `SourceEntry`=68743 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=9 AND `ConditionTarget`=0 AND `ConditionValue1`=14401 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 36459, 68743, 0, 0, 9, 0, 14401, 0, 0, 0, 0, 0, '', 'Should be clickable if quest "Grandma\'s Cat" is taken');

DELETE FROM `spell_scripts` WHERE `id`=68743 AND `effIndex`=0;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(68743, 0, 0, 5, 77, 16777216, 0, 0, 0, 0, 0);

-- Delete duplicate spawn of chance
delete from creature where guid=255872 and id=36459;

-- These spawns are going to be summoned by event script
delete from creature where guid=255956 and id=36461;
delete from creature where guid=255957 and id=36458;

-- Setted "Chance" respawn time to 5 mins
UPDATE `creature` SET `spawntimesecs`=300 WHERE `guid`=255958 AND id = 36459;

DELETE FROM `event_scripts` WHERE `id`=22401;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(22401, 0, 10, 36461, 300000, 0, -2111.533, 2329.9497, 7.3903494, 0.220381155610084533),
(22401, 4, 10, 36458, 300000, 0, -2098.3665, 2352.0747, 7.1606426, 4.926180839538574218);

-- Lucius
update creature_template set AIName='SmartAI', ScriptName='' where entry=36461;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36461 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36461, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0, 53, 1, 36461, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Lucius - On Just Summoned - start waypoint'),
(36461, 0, 1, 2, 40, 0, 100, 0, 2, 36461, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lucius - On Waypoint Reach - Say text'),
(36461, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 80, 3646100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lucius - On Waypoint Reach (linked) - trigger timed action list');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3646100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3646100, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lucius - Set emote state to NONE'),
(3646100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 41, 0, 300, 0, 0, 0, 0, 10, 255958, 36459, 0, 0, 0, 0, 0, 'Lucius - Force despawn npc "Chance"'),
(3646100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lucius - remove unit flag'),
(3646100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'Lucius - Attack nearest player');
DELETE FROM `waypoints` WHERE `entry`=36461;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `velocity`, `delay`, `smoothTransition`, `point_comment`) VALUES
(36461, 0, -2116.69, 2328.79, 7.49998, NULL, 0, 0, 0, NULL),
(36461, 1, -2111.53, 2329.95, 7.39035, NULL, 0, 0, 0, NULL),
(36461, 2, -2106.37, 2331.11, 7.28072, NULL, 0, 0, 0, NULL);
