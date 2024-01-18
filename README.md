# Character Template for Coop Deluxe
This is a character template that uses the original Fast64 blend file and expands upon it to take advantage of the less limitations the PC Port has. Not only does it renames the offsets with appropiate names, but also contains multiple heads for the unused eyestates.

*Fast64-Coop is required for this .Blend file. You can download it from here:* https://github.com/Agent-11/fast64-coop

To install it, head to the icon on the upper left and switch to *Preferences* then head to *Add-ons*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/323b6719-3ae4-4f55-a3aa-8295cc4adb8c)


## How to Rig Your Model!
In order to rig the body parts, you must have the mesh traingulated. 

**Step 1:** Set to *Object Mode*. Have all the body parts joined using *Ctrl + J*. Hold *Shift* and first click the mesh THEN the armature. *Ctrl + P* and click *With Empty Groups*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/870c46ed-a287-435e-a4a3-f4a545b6d597)

**Step 2:** Select just the mesh and set to *Edit Mode*. Then **Right Click*, *Separate* and select *Loose Parts*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/932de11e-4653-4b06-9e57-12ced70bf917)

**Step 3:** Pick a body part, then switch to *Edit Mode*. Press *A* to select the entire mesh and head to the Object Data section, before selecting the appropiate Vertex Group. Then click *Assign*. Repeat the proccess.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/6be71c7f-94b7-498b-81b0-9ae359667df5)

**Step 4:** Set up your EyeStates by finding the *Eye Material Switch* bone! You can also replace the *Eye Switch* with an *Extra Head Armature*. 

Eyestates are as followed:
* Switch Option 1: Half Closed Eyes
* Switch Option 2: Closed Eyes
* Switch Option 3: Left Eyes
* Switch Option 4: Right Eyes
* Switch Option 5: Up Eyes
* Switch Option 6: Down Eyes
* Switch Option 7: Dead Eyes

![image](https://github.com/coop-deluxe/character-template/assets/140215214/79615fe8-48df-4d7d-9bfb-55fbf3b0a1ed)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/5e25c3f9-fcaa-4791-ad22-0b5768bf3139)

And you're done! You are now ready to export the model!

## How to Export!
You must have all the mesh parented and assigned vertex groups for the export to happen.

**Step 1:** Hover to the right side on the toolbar and look into *GeoLayout Exporter*. Then select the directory. Either you place the files under *"sm64coopdx/Mods/character_mod/actors"* or *DynOS/Packs*. However if you prefer exporting to DynOS Packs, you must have it under *mario* and *mario_geo*. You can always rename the .bin file after it is build.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/bd156f5a-0788-4257-92d1-f7f4851a478c)

**Step 2:** Click the *Mario Armature* and *Export Armature GeoLayout*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/249ffdb6-a017-44a8-bf40-bb4f4758e4f8)

**Step 3:** Open the game to build the model into a .bin file.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/f097634a-a319-4991-ba9c-fc8cf14c0fc0)

And the model has now been built and ready for use for modding! Any change to the model must have the old .bin file deleted!

## How to Set Color Lighting to Material!
Make sure all the mesh has the materials all shared AND organized.
A program such as Visual Code is needed to manually edit the files.

The game consists of seven body parts to recolor:

* CAP
* SHIRT
* SKIN
* HAIR
* PANTS
* GLOVES
* SHOES

**Step 1:** Open the *geo.inc.c* file and scroll to the bottom. 

Type in ``GEO_ASM(0, geo_mario_set_player_colors),`` and ``GEO_ASM(LAYER_TRANSPARENT + 3, geo_mario_set_player_colors),`` in between. These will activate the coloring for both applyed shaded material and transparent material. You *MUST* have both in at the same time!

![image](https://github.com/coop-deluxe/character-template/assets/140215214/3c99c5d1-3178-4386-8aa4-952005380a4b)

**Step 2:** Open the *model.inc.c* file and head to 3/4 of the code. Replace the higlighted code with ``gsSPCopyLightsPlayerPart(???),`` to add in the coloring! Replace the ``???`` with the body part you want to recolor.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/65b2ec99-3604-4cee-b38f-bb00c631a79c)

**Step 3:** Delete any old .bin file and open the game to create a new! And you're set!

## Common Error Fixes!

**Metal Head Bug**
This is a Fast64 bug that occurs due to an update that changed how the materials work.

There are four *constants* for Cap Switches in order: 
* Vanish
* Metal + Vanish
* Metal

Only the custom head ``GEO_BRANCH`` with a clear name should be deleted.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/53a14448-3fe6-49d1-9f1b-fc50fc80950c)

**Floating Small/Lower Tall Character Bug**

If your character is floating or phasing through the floor, you can always edit the height of the character.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/1a6058de-9398-42fe-bda1-60f5b07c5235)

You MUST do this to only the first one of these AND do the same for the other Cap Switches.

**Model's placement is... off**





