## AK Auto Sort

A keyword based, balanced sorting mod. Configure any containers you want. Once configured, it's one button to sort all your items into all configured containers. Should be compatible with any mod created containers or items. Balanced in that it only sorts into containers when you're in the same cell with them.


## Requirements

[SKSE](https://skse.silverlock.org/)
[JContainers](https://www.nexusmods.com/skyrimspecialedition/mods/16495?tab=description)

## Usage

Install with vortex

When you load your save you should get an Auto Sort Tool (misc object) and Auto Sort (Lesser Power).

When you add the Sort Tool to a chest, it will pop up a configuration menu. You can start/stop tracking that container, and add/remove keywords.

Now cast the spell and watch items drain out of your inventory.

NOTE: Chest config is not stored as part of your save, but instead in config files at `C:\Users\Dragonborn\Documents\My Games\Skyrim Special Edition\JCUser\ak_auto_store`. This means that configs persist across saves (and also that you can back them up).

## How it Works (technical breakdown)

One Quest does all the logic. The sort tool has a script that when added to a container passes that container reference to the quest. So there are no scripts added to containers, no custom containers etc. Tracking a chest is done by adding it's reference to the quest (which then saves it with JContainer). This means other than adding items to chests, I'm not touching them, and they should be safe regardless of uninstalls etc.

Here's a performance breakdown, with 260 items in the player inventory and a single chest. I was/am frustrated with how slow this is and made a custom tool to parse the papyrus profile logs to see if I could identify bottlenecks. (Average Total is wait time + process time, which is effectively no difference). KeywordsMatch and hasKeyword increases for each chest added.

| Name                | Count | Average Wait | Average Total | Total Time |
| ------------------- | ----- | ------------ | ------------- | ---------- |
| StartStackProfiling | 1     | 0            | 64766         | 64766      |
| GetNthForm          | 260   | 23           | 23            | 6091       |
| IsEquipped          | 260   | 18           | 18            | 4703       |
| IsObjectFavorited   | 250   | 16           | 16            | 4157       |
| keywordsMatch       | 245   | 0            | 16            | 4064       |
| HasKeyword          | 245   | 16           | 16            | 4047       |
| GetItemCount        | 20    | 27           | 27            | 544        |
| RemoveItem          | 20    | 16           | 18            | 370        |
| Notification        | 1     | 17           | 17            | 17         |
| getObj              | 245   | 0            | 0             | 1          |
| asFormArray         | 245   | 0            | 0             | 1          |
| StopStackProfiling  | 1     | 0            | -84798        | -84798     |

## FAQ

Q: The Auto Sort Tool is not coming back to my inventory
A: This bug drives me nuts. Just drop the tool outside a container and it should fix it (for a while).

Q: Items aren't being sorted
A: Did you track chests and add keywords? Are you in the same cell as the containers?

Q: Is this safe to uninstall?
A: I hope so, but no scripted mods are, I hear. See technical details and decide for yourself

Q: How many custom chests can I setup?
A: I'd keep it under 128 as that may cause papyrus to crash (I haven't tried it). (Same with number of keywords per chest)

Q: Can you help me / I have a mod idea
A: No, I don't mod anymore, and just built this for myself when playing skyrim again. I don't have time to answer messages / requests, but so long as you keep stuff on the nexus you're welcome to translate / port / change mods. Let me know so I can check them out if you do.

## Thank You

[Automatic Storage](https://www.nexusmods.com/skyrimspecialedition/mods/8224) For the idea of adding an item to a container to mark it without attaching a script to it.
[JContainers](https://www.nexusmods.com/skyrimspecialedition/mods/16495?tab=description): After finding this resource I rewrote nearly the whole mod. I'm so glad someone brought some sanity to the limitations of papyrus.
[Profiling Tool](https://papyrusprofilingparser.com/) For helping me to understand some of what makes papyrus so slow