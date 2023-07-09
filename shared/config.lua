QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.Debug = true

-- Clipsets That Will Be Ignored by Walkstyle Reset --
Config.IgnoredClipsets = {
    'move_lester_caneup', -- Walking Stick
    'move_ped_crouched', -- Crouched
}

Config.Styles = {
    { name = 'Default', value = 'default' },
    { name = 'Alien', value = 'move_m@alien' },
    { name = 'Armored', value = 'anim_group_move_ballistic' },
    { name = 'Arrogant', value = 'move_f@arrogant@a' },
    { name = 'Brave', value = 'move_m@brave' },
    { name = 'Business', value = 'move_m@business@a' },
    { name = 'Business 2', value = 'move_m@business@b' },
    { name = 'Business 3', value = 'move_m@business@c' },
    { name = 'Casual', value = 'move_f@arrogant@a' },
    { name = 'Casual 2', value = 'move_m@casual@b' },
    { name = 'Casual 3', value = 'move_m@casual@c' },
    { name = 'Casual 4', value = 'move_m@casual@d' },
    { name = 'Casual 5', value = 'move_m@casual@e' },
    { name = 'Casual 6', value = 'move_m@casual@f' },
    { name = 'ChiChi', value = 'move_f@chichi' },
    { name = 'Chubby Male', value = 'move_chubby' },
    { name = 'Chubby Female', value = 'move_f@chubby@a' },
    { name = 'Confident', value = 'move_m@confident' },
    { name = 'Cop', value = 'move_m@business@a' },
    { name = 'Cop 2', value = 'move_m@business@b' },
    { name = 'Cop 3', value = 'move_m@business@c' },
    { name = 'Drunk', value = 'move_m@drunk@a' },
    { name = 'Drunk 2', value = 'move_m@drunk@slightlydrunk' },
    { name = 'Drunk 3', value = 'move_m@buzzed' },
    { name = 'Drunk 4', value = 'move_m@drunk@verydrunk' },
    { name = 'Femme', value = 'move_f@femme@' },
    { name = 'Fire', value = 'move_characters@franklin@fire' },
    { name = 'Fire 2', value = 'move_characters@michael@fire' },
    { name = 'Fire 3', value = 'move_m@fire' },
    { name = 'Flee', value = 'move_f@flee@a' },
    { name = 'Franklin', value = 'move_p_m_one' },
    { name = 'Gangster', value = 'move_m@gangster@generic' },
    { name = 'Gangster 2', value = 'move_m@gangster@ng' },
    { name = 'Gangster 3', value = 'move_m@gangster@var_e' },
    { name = 'Gangster 4', value = 'move_m@gangster@var_f' },
    { name = 'Gangster 5', value = 'move_m@gangster@var_i' },
    { name = 'Grooving', value = 'anim@move_m@grooving@' },
    { name = 'Guard', value = 'move_m@prison_gaurd' },
    { name = 'Heels', value = 'move_f@heels@c' },
    { name = 'Heels 2', value = 'move_f@heels@d' },
    { name = 'Hiking', value = 'move_m@hiking' },
    { name = 'Hipster', value = 'move_m@hipster@a' },
    { name = 'Hobo', value = 'move_m@hobo@a' },
    { name = 'Hurry', value = 'move_f@hurry@a' },
    { name = 'Injured', value = 'move_m@injured' },
    { name = 'Janitor', value = 'move_p_m_zero_janitor' },
    { name = 'Janitor 2', value = 'move_p_m_zero_janitor' },
    { name = 'Man Eater', value = 'move_f@maneater' },
    { name = 'Money', value = 'move_m@money' },
    { name = 'Muscle', value = 'move_m@muscle@a' },
    { name = 'Nonchalant', value = 'move_m@non_chalant' },
    { name = 'Posh', value = 'move_m@posh@' },
    { name = 'Posh 2', value = 'move_f@posh@' },
    { name = 'Quick', value = 'move_m@quick' },
    { name = 'Sad', value = 'move_m@sad@a' },
    { name = 'Sassy', value = 'move_m@sassy' },
    { name = 'Scared', value = 'move_f@scared' },
    { name = 'Shady', value = 'move_m@shadyped@a' },
    { name = 'Swagger', value = 'move_m@swagger' },
    { name = 'Tough', value = 'move_m@tough_guy@' },
    { name = 'Tough 2', value = 'move_f@tough_guy@' },
    { name = 'Wide', value = 'move_m@bag' },
}

function XTDebug(type, debugTxt)
    if debugTxt == nil then debugTxt = '' end
    if Config.Debug then
        print("^2xT Debug ^7| "..type.." | ^2"..debugTxt)
    end
end