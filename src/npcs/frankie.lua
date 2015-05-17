-- inculdes
local Dialog = require 'dialog'
local prompt = require 'prompt'
local Timer = require('vendor/timer')
local Quest = require 'quest'
local quests = require 'npcs/quests/frankiequest'

return {
  width = 24,
  height = 48,
  greeting = 'I am a big believer in hierarchy. Someone needs to say that I am in charge, and that person is me.',
  animations = {
    default = {
      'loop',{'1,1','1,1','1,1','2,1'},.25,
    },
  },
  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='Save Greendale!', ['option']={
      { ['text']='De-electrify pool' },
      { ['text']='Post warning signs' },
      { ['text']='Lost office key!', freeze = true },
      { ['text']='The Ass Crack Bandit' },
      { ['text']='Potatoes on rooftops', freeze = true },
      { ['text']='Bones in the parking lot', freeze = true },
      { ['text']='Cork-based Networking' },
      { ['text']='Peanut Costume', freeze = true },
      { ['text']='Pierce Hologram' },
    }},
    { ['text']='Are you the IT lady?' },
    { ['text']='How is Greendale?' },
  },
  talk_commands = {
    ['Peanut Costume']= function(npc, player)
      Quest:activate(npc, player, quests.peanutcostume)
      end,
    ['Bones in the parking lot']= function(npc, player)
      Quest:activate(npc, player, quests.bones)
      end,
    ['Lost office key!']= function(npc, player)
      Quest:activate(npc, player, quests.officekey)
      end,
    ['Potatoes on rooftops']= function(npc, player)
    --check if there are still potatoes on campus rooftops
      Quest:activate(npc, player, quests.potatoes, function()
          for _,node in pairs(npc.containerLevel.nodes) do
            if node.name == 'potato' then
              return true
            end
          end
          return false
        end)
      end,
  },
  talk_responses = {
    ['Save Greendale!']={
      "I am part of the {{green_light}}Save Greendale Committee{{white}}, but there's just too many things to do!",
      "I would be extremely grateful if you were to lend me a hand with my tasks.",
    },
    ['Are you the IT lady?']={
      "No, I'm not! People keep asking me that and I have no idea why.",
      "I'm sure the previous IT lady had a good reason to quit her job.",
    },
    ['How is Greendale?']={
      "This school is weird, gross, and passionate.",
      "But mostly weird and gross.",
    },
  },
}
