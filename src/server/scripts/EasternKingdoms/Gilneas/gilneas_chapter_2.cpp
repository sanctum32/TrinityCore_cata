/*
* This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "gilneas.h"
#include "ScriptMgr.h"
#include "CombatAI.h"
#include "MotionMaster.h"
#include "MoveSplineInit.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "PassiveAI.h"
#include "PhasingHandler.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "SpellScript.h"
#include "TemporarySummon.h"
#include "Vehicle.h"
#include "GameObjectAI.h"
#include "GameObject.h"

namespace Gilneas::Chapter2
{
enum GilneasInvasionCamera
{
    CINEMATIC_FORSAKEN_INVASION = 168
};

struct go_gilneas_invasion_camera : public GameObjectAI
{
    go_gilneas_invasion_camera(GameObject* go) : GameObjectAI(go) { }

    bool OnReportUse(Player* player) override
    {
        player->SendCinematicStart(CINEMATIC_FORSAKEN_INVASION);
        return true;
    }
};

enum HorridAbomination
{
    // Horrid Abomination
    SPELL_KEG_PLACED                    = 68555,
    SPELL_ABOMINATION_KILL_ME           = 68558,
    SPELL_RANDOM_CIRCUMFERENCE_POISON   = 42266,
    SPELL_RANDOM_CIRCUMFERENCE_BONE     = 42267,
    SPELL_RANDOM_CIRCUMFERENCE_BONE_2   = 42274,
    SPELL_HORRID_ABOMINATION_EXPLOSION  = 68560,
    SPELL_RESTITCHING                   = 68864,

    QUEST_HORRID_ABOMINATION_CREDIT     = 36233,

    SAY_KEG_PLACED                      = 0,
    EVENT_ABOMINATION_KILL_ME           = 1,

    // Prince Liam Greymane
    SPELL_SHOOT                         = 68559
};

struct npc_gilneas_horrid_abomination : public ScriptedAI
{
    npc_gilneas_horrid_abomination(Creature* creature) : ScriptedAI(creature),
        _allowEvents(false)
    {
    }

    void Reset() override
    {
        _playerGUID.Clear();
        _allowEvents = false;
        me->GetMotionMaster()->MoveRandom(6.0f);
    }

    void SpellHit(WorldObject* caster, SpellInfo const* spell) override
    {
        switch (spell->Id)
        {
            case SPELL_KEG_PLACED:
                Talk(SAY_KEG_PLACED);
                me->AttackStop();
                me->SetReactState(REACT_PASSIVE);
                me->GetMotionMaster()->InitDefault();
                me->StopMoving();
                _playerGUID = caster->GetGUID();
                _allowEvents = true;
                _events.ScheduleEvent(EVENT_ABOMINATION_KILL_ME, 2s);
                break;
            case SPELL_SHOOT:
                if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                    player->KilledMonsterCredit(QUEST_HORRID_ABOMINATION_CREDIT);

                me->RemoveAurasDueToSpell(SPELL_KEG_PLACED);

                for (uint8 i = 0; i < 11; i++)
                    DoCastSelf(SPELL_RANDOM_CIRCUMFERENCE_POISON, true);

                for (uint8 i = 0; i < 6; i++)
                    DoCastSelf(SPELL_RANDOM_CIRCUMFERENCE_BONE, true);

                for (uint8 i = 0; i < 4; i++)
                    DoCastSelf(SPELL_RANDOM_CIRCUMFERENCE_BONE_2, true);

                DoCastSelf(SPELL_HORRID_ABOMINATION_EXPLOSION, true);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->DespawnOrUnsummon(5s);
                break;
            default:
                break;
        }
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage) override
    {
        if (damage >= me->GetHealth())
        {
            damage = 0;
            if (!me->HasUnitState(UNIT_STATE_CASTING) && !me->HasAura(SPELL_RESTITCHING))
                DoCastSelf(SPELL_RESTITCHING);
        }
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim() && !_allowEvents)
            return;

        _events.Update(diff);

        if (_events.ExecuteEvent() == EVENT_ABOMINATION_KILL_ME)
        {
            DoCastAOE(SPELL_ABOMINATION_KILL_ME, true);
        }

        DoMeleeAttackIfReady();
    }

private:
    EventMap _events;
    ObjectGuid _playerGUID;
    bool _allowEvents;
};

enum SaveTheChildren
{
    SAY_CHILD_RESCUED                   = 0,

    SPELL_GILNEAS_QUEST_SAVE_JAMES      = 68596,
    SPELL_GILNEAS_QUEST_SAVE_CYNTHIA    = 68597,
    SPELL_GILNEAS_QUEST_SAVE_ASHLEY     = 68598,

    NPC_CYNTHIA                         = 36287,
    NPC_ASHLEY                          = 36288,
    NPC_JAMES                           = 36289,

    POINT_BASEMENT_1                    = 1,
    POINT_BASEMENT_2                    = 2,
};

Position const JamesEscapePos = { -1913.021f, 2558.333f, 1.511007f };

Position const AshleyEscapePos[] =
{
    { -1923.283f, 2552.308f, 12.73581f }, // Ashley Point 1
    { -1920.023f, 2558.055f, 7.076692f }  // Ashley Point 2
};

Position const CynthiaEscapePos[] =
{
    { -1969.23f,  2517.465f, 2.580818f }, // Cynthia Point 1
    { -1947.472f, 2515.521f, 2.318746f }, // Cynthia Point 2
    { -1926.536f, 2519.312f, 2.246772f }  // Cynthia Point 3
};

// 68597 Gilneas - Quest - Save Cynthia
// 68598 Gilneas - Quest - Save Ashley
class spell_gilneas_quest_save_the_children : public SpellScript
{
    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo({ SPELL_GILNEAS_QUEST_SAVE_JAMES });
    }

    void HandleDummy(SpellEffIndex effIndex)
    {
        if (Unit* caster = GetCaster())
        {
            if (Player* player = caster->ToPlayer())
            {
                Unit* target = GetHitUnit();
                player->Talk(GetSpellInfo()->Effects[effIndex].BasePoints, CHAT_MSG_SAY, 0.0f, target);
                player->KilledMonsterCredit(target->GetEntry());
            }
        }
    }

    void Register() override
    {
        if (m_scriptSpellId == SPELL_GILNEAS_QUEST_SAVE_JAMES)
            OnEffectHitTarget.Register(&spell_gilneas_quest_save_the_children::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        else
            OnEffectHitTarget.Register(&spell_gilneas_quest_save_the_children::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
    }
};

struct npc_gilneas_save_the_children : public ScriptedAI
{
    npc_gilneas_save_the_children(Creature* creature) : ScriptedAI(creature)
    {
    }

    void Reset() override
    {
        playerGUID.Clear();
        scheduler.CancelAll();
        if (me->GetEntry() == NPC_CYNTHIA)
        {
            scheduler.Schedule(1s, [this](TaskContext cry)
            {
                me->HandleEmoteCommand(EMOTE_ONESHOT_CRY);
                cry.Repeat(1s, 1500ms);
            });
        }
    }

    void SpellHit(WorldObject* caster, SpellInfo const* spell) override
    {
        switch (spell->Id)
        {
            case SPELL_GILNEAS_QUEST_SAVE_JAMES:
            case SPELL_GILNEAS_QUEST_SAVE_CYNTHIA:
            case SPELL_GILNEAS_QUEST_SAVE_ASHLEY:

                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                playerGUID = caster->GetGUID();
                scheduler.CancelAll();
                scheduler.Schedule(2500ms, [this](TaskContext const& /*task*/)
                {
                    Talk(SAY_CHILD_RESCUED, ObjectAccessor::GetPlayer(*me, playerGUID));
                    scheduler.Schedule(me->GetEntry() == NPC_JAMES ? 3600ms : 2300ms, [this](TaskContext const& /*task*/)
                    {
                        switch (me->GetEntry())
                        {
                            case NPC_JAMES:
                                me->GetMotionMaster()->MovePoint(0, JamesEscapePos, true);
                                me->DespawnOrUnsummon(5200ms);
                                break;
                            case NPC_ASHLEY:
                                me->GetMotionMaster()->MovePoint(POINT_BASEMENT_1, AshleyEscapePos[0], true);
                                me->DespawnOrUnsummon(3800ms);
                                break;
                            case NPC_CYNTHIA:
                                me->GetMotionMaster()->MovePoint(POINT_BASEMENT_1, CynthiaEscapePos[0], true);
                                me->DespawnOrUnsummon(8500ms);
                                break;
                            default:
                                break;
                        }
                    });
                });
                break;
            default:
                break;
        }
    }

    void MovementInform(uint32 type, uint32 id) override
    {
        if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
            return;

        switch (id)
        {
            case POINT_BASEMENT_1:
                if (me->GetEntry() == NPC_ASHLEY)
                    me->GetMotionMaster()->MovePoint(0, AshleyEscapePos[1], true);
                else
                    me->GetMotionMaster()->MovePoint(POINT_BASEMENT_2, CynthiaEscapePos[1], true);
                break;
            case POINT_BASEMENT_2:
                me->GetMotionMaster()->MovePoint(0, CynthiaEscapePos[2], true);
                break;
            default:
                break;
        }
    }

    void UpdateAI(uint32 diff) override
    {
        scheduler.Update(diff);
    }

private:
    TaskScheduler scheduler;
    ObjectGuid playerGUID;
};

enum ForsakenCatapult
{
    NPC_FORSAKEN_MACHINIST  = 36292,

    SPELL_FIERY_BOULDER     = 68591,
    SPELL_LAUNCH_INTERNAL   = 96114,
    SPELL_LAUNCH_INTERNAL_2 = 96185,
    SPELL_LAUNCH            = 66251,

    EVENT_FIERY_BOULDER     = 1,
    EVENT_CHECK_AREA        = 2,

    SEAT_0                  = 0,

    SAY_WARN_OUT_OF_AREA    = 0,

    AREA_ID_DUSKMIST_SHORE  = 5720
};

struct npc_gilneas_forsaken_catapult : public VehicleAI
{
    npc_gilneas_forsaken_catapult(Creature* creature) : VehicleAI(creature),
        _preparedDespawn(false)
    {
    }

    void Reset() override
    {
        _preparedDespawn = false;
        _events.ScheduleEvent(EVENT_FIERY_BOULDER, 1ms, 7s);
    }

    void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
    {
        if (!passenger)
            return;

        if (passenger->GetEntry() == NPC_FORSAKEN_MACHINIST)
        {
            if (apply)
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                passenger->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

                if (Creature* creature = passenger->ToCreature())
                    creature->SetReactState(REACT_PASSIVE);
            }
            else
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFaction(FACTION_FRIENDLY);
                _events.CancelEvent(EVENT_FIERY_BOULDER);
            }
        }
        else if (passenger->GetTypeId() == TYPEID_PLAYER && !apply)
            me->DespawnOrUnsummon(9s);
        else if (passenger->GetTypeId() == TYPEID_PLAYER && apply)
            _events.ScheduleEvent(EVENT_CHECK_AREA, 1ms);
    }

    void SpellHit(WorldObject* /*caster*/, SpellInfo const* spell) override
    {
        if (spell->Id == SPELL_LAUNCH_INTERNAL)
            DoCastSelf(SPELL_LAUNCH_INTERNAL_2, true);
    }

    void SetTargetDestination(Position pos)
    {
        _targetPos = pos;
    }

    void SpellHitTarget(WorldObject* target, SpellInfo const* spell) override
    {
        Unit* unitTarget = target->ToUnit();
        if (unitTarget == nullptr || spell->Id != SPELL_LAUNCH || unitTarget->GetVehicleCreatureBase() == nullptr)
            return;

        Position pos = unitTarget->GetPosition();
        pos.m_positionZ += 6.0f;
        unitTarget->ExitVehicle(&pos);
        unitTarget->GetMotionMaster()->MoveJump(_targetPos, 58.62504f, 12.75955f);
    }

    void UpdateAI(uint32 diff) override
    {
        _events.Update(diff);

        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_FIERY_BOULDER:
                    DoCastAOE(SPELL_FIERY_BOULDER);
                    _events.Repeat(7s, 8s);
                    break;
                case EVENT_CHECK_AREA:
                    if (me->GetAreaId() != AREA_ID_DUSKMIST_SHORE)
                    {
                        if (!_preparedDespawn)
                        {
                            if (Vehicle* vehicle = me->GetVehicleKit())
                                if (Unit* passenger = vehicle->GetPassenger(SEAT_0))
                                    Talk(SAY_WARN_OUT_OF_AREA, passenger);

                            _preparedDespawn = true;
                        }
                        else
                            me->DespawnOrUnsummon();

                        _events.Repeat(10s);
                    }
                    else
                    {
                        if (_preparedDespawn)
                        {
                            _preparedDespawn = false;
                            _events.Repeat(2s);
                        }
                        else
                            _events.Repeat(2s);
                    }
                    break;
                default:
                    break;
            }
        }

    }
private:
    EventMap _events;
    Position _targetPos;
    bool _preparedDespawn;
};

// Quest 14416
enum TheHungryEattin
{
    SPELL_ROPE_VISUAL           = 68940,
    SPELL_MOUNTAIN_HORSE_DUMMY  = 68916,
    SPELL_MOUNTAIN_HORSE_CREDIT = 68917,
    NPC_MOUNTAIN_HORSE_CREDIT   = 36560,
};

struct npc_gilneas_mountain_horse_qtrigger : public PassiveAI
{
    npc_gilneas_mountain_horse_qtrigger(Creature* creature) : PassiveAI(creature)
    {
    }

    void Reset() override
    {
        scheduler.CancelAll();
        scheduler.Schedule(5500ms, [this](TaskContext castEvent)
        {
            DoCastSelf(SPELL_MOUNTAIN_HORSE_DUMMY, true);
            castEvent.Repeat();
        });
    }

    void UpdateAI(uint32 diff) override
    {
        scheduler.Update(diff);
    }

private:
    TaskScheduler scheduler;
};

// 68916 Mountain Horse Dummy
class spell_gilneas_mountain_horse_dummy : public SpellScript
{
    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        Creature* horse = GetHitCreature();
        if (horse == nullptr)
            return;

        if (Unit* owner = horse->GetCharmerOrOwner())
            owner->RemoveAurasDueToSpell(SPELL_ROPE_VISUAL);

        horse->CastSpell(horse, SPELL_MOUNTAIN_HORSE_CREDIT);

        if (Vehicle* vehicle = horse->GetVehicleKit())
            vehicle->RemoveAllPassengers();

        MotionMaster* motion = horse->GetMotionMaster();
        motion->Clear();
        motion->MoveIdle();

        horse->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
        horse->DespawnOrUnsummon(5s);
    }

    void Register()
    {
        OnEffectHitTarget.Register(&spell_gilneas_mountain_horse_dummy::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 68659 Launch
class spell_gilneas_launch : public SpellScript
{
    void TransferDestination(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            Creature* creature = caster->ToCreature();
            if (creature != nullptr && creature->IsAIEnabled())
                CAST_AI(npc_gilneas_forsaken_catapult, creature->AI())->SetTargetDestination(GetExplTargetDest()->GetPosition());
        }
    }

    void Register()
    {
        OnEffectLaunch.Register(&spell_gilneas_launch::TransferDestination, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 68591 Fiery Boulder
class spell_gilneas_fiery_boulder : public SpellScript
{
    void FilterTargets(std::list<WorldObject*>& targets)
    {
        targets.remove_if([caster = GetCaster()](WorldObject* object)
        {
            if (Unit* target = object->ToUnit())
                return (!caster->isInFront(target, float(M_PI * 0.3f)));

            return false;
        });

        if (!targets.empty())
            Trinity::Containers::RandomResize(targets, 1);
    }

    void Register() override
    {
        OnObjectAreaTargetSelect.Register(&spell_gilneas_fiery_boulder::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
    }
};

enum LeaderOfThePack
{
    NPC_ATTACK_MASTIFF = 36405
};

std::array<Position, 10> const AttackMastiffSummonPositions =
{{
    { -1944.483f, 2656.656f, 1.051441f,  1.691914f  },
    { -1956.602f, 2649.942f, 1.374257f,  1.441419f  },
    { -1973.627f, 2654.836f, -0.6995407f, 1.098437f },
    { -1983.201f, 2662.242f, -1.66652f,  0.8627869f },
    { -1994.557f, 2672.134f, -2.303949f, 0.5766099f },
    { -1949.314f, 2642.024f, 1.299083f,  1.580745f  },
    { -1972.606f, 2639.383f, 1.211673f,  1.217789f  },
    { -1997.009f, 2650.811f, -1.030188f, 0.8184887f },
    { -2006.259f, 2663.115f, -2.00431f,  0.5941383f },
    { -1945.504f, 2653.386f, 1.177739f,  1.675516f  }
}};

// 68682 Call Attack Mastiffs
class spell_gilneas_call_attack_mastiff : public SpellScript
{
    void HandleHit(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            for (Position const& spawnPos : AttackMastiffSummonPositions)
            {
                if (Creature* mastiff = caster->SummonCreature(NPC_ATTACK_MASTIFF, spawnPos, TEMPSUMMON_TIMED_DESPAWN, 1min))
                    mastiff->AI()->AttackStart(GetHitUnit());
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget.Register(&spell_gilneas_call_attack_mastiff::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 69027 Forcecast Cataclysm I
class spell_gilneas_forcecast_cataclysm_1 : public SpellScript
{
    void HandleForcecast(SpellEffIndex effIndex)
    {
        PreventHitDefaultEffect(effIndex);
        if (Unit* caster = GetCaster())
            caster->CastSpell(caster, GetSpellInfo()->Effects[effIndex].TriggerSpell, true);
    }

    void Register() override
    {
        OnEffectHitTarget.Register(&spell_gilneas_forcecast_cataclysm_1::HandleForcecast, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
    }
};

// 68638 Worgen Intro Completion
class spell_gilneas_worgen_intro_completion : public SpellScript
{
    void FilterTargets(std::list<WorldObject*>& targets)
    {
        targets.remove_if([caster = GetCaster()](WorldObject* target)
        {
            if (target->GetTypeId() != TYPEID_UNIT)
                return true;

            TempSummon* summon = target->ToUnit()->ToTempSummon();
            if (summon != nullptr && summon->GetSummoner() == caster)
                return false;

            return true;
        });
    }

    void Register() override
    {
        OnObjectAreaTargetSelect.Register(&spell_gilneas_worgen_intro_completion::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
    }
};

enum GaspingForBreath
{
    NPC_DROWNING_WATCHMAN_CREDIT        = 36450,

    SPELL_RESCUE_DROWNING_WATCHMAN      = 68735,
    SPELL_SAVE_DROWNING_MILITA_EFFECT   = 68737,
    SPELL_DROWNING_MILITA_DUMMY         = 68739,
    SPELL_DROWNING_VEHICLE_EXIT_DUMMY   = 68741
};

// 68737 Save Drowning Militia Effect
class spell_gilneas_save_drowning_milita_effect : public SpellScript
{
    void HandleScript(SpellEffIndex effIndex)
    {
        PreventHitDefaultEffect(effIndex);

        if (Player* player = GetHitPlayer())
            player->KilledMonsterCredit(NPC_DROWNING_WATCHMAN_CREDIT);
    }

    void Register() override
    {
        OnEffectHitTarget.Register(&spell_gilneas_save_drowning_milita_effect::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 68737 Drowning Vehicle Exit Dummy
class spell_gilneas_drowning_vehicle_exit_dummy : public SpellScript
{
    void HandleScript(SpellEffIndex effIndex)
    {
        PreventHitDefaultEffect(effIndex);

        if (Player* player = GetHitPlayer())
            player->RemoveAurasDueToSpell(SPELL_RESCUE_DROWNING_WATCHMAN);
    }

    void HandleHit(SpellEffIndex /*effIndex*/)
    {
        if (Unit* unit = GetHitUnit())
            unit->ExitVehicle();
    }

    void Register() override
    {
        OnEffectHitTarget.Register(&spell_gilneas_drowning_vehicle_exit_dummy::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        OnEffectHitTarget.Register(&spell_gilneas_drowning_vehicle_exit_dummy::HandleHit, EFFECT_1, SPELL_EFFECT_DUMMY);
    }
};

class at_gasping_for_breath : public AreaTriggerScript
{
public:
    at_gasping_for_breath() : AreaTriggerScript("at_gasping_for_breath") { }

    bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/) override
    {
        if (Vehicle* vehicle = player->GetVehicleKit())
            if (Unit* passenger = vehicle->GetPassenger(SEAT_0))
            {
                player->CastSpell(passenger, SPELL_DROWNING_MILITA_DUMMY);
                player->CastSpell(passenger, SPELL_DROWNING_VEHICLE_EXIT_DUMMY);
                player->CastSpell(nullptr, SPELL_SAVE_DROWNING_MILITA_EFFECT);
            }

        return true;
    }
};
}

void AddSC_gilneas_chapter_2()
{
    using namespace Gilneas::Chapter2;
    RegisterGameObjectAI(go_gilneas_invasion_camera);
    RegisterCreatureAI(npc_gilneas_horrid_abomination);
    RegisterCreatureAI(npc_gilneas_save_the_children);
    RegisterCreatureAI(npc_gilneas_forsaken_catapult);
    RegisterCreatureAI(npc_gilneas_mountain_horse_qtrigger);
    RegisterSpellScript(spell_gilneas_mountain_horse_dummy);
    RegisterSpellScript(spell_gilneas_quest_save_the_children);
    RegisterSpellScript(spell_gilneas_launch);
    RegisterSpellScript(spell_gilneas_fiery_boulder);
    RegisterSpellScript(spell_gilneas_call_attack_mastiff);
    RegisterSpellScript(spell_gilneas_forcecast_cataclysm_1);
    RegisterSpellScript(spell_gilneas_worgen_intro_completion);
    RegisterSpellScript(spell_gilneas_save_drowning_milita_effect);
    RegisterSpellScript(spell_gilneas_drowning_vehicle_exit_dummy);
    new at_gasping_for_breath();
}
