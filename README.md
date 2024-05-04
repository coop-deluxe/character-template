# Character Template for Coop Deluxe
This is a character template that uses the original Fast64 blend file and expands upon it to take advantage of the fewer limitations the PC Port has. Not only does it rename the offsets with appropriate names, but also contains multiple heads for the unused eyestates.

*Fast64-Coop is required for this. Blend file. You can download it from here:* https://github.com/coop-deluxe/fast64
Recommended to use Blender ver. 3.6 as ver. 4 breaks Fast64.

To install it, head to the icon on the upper left and switch to *Preferences* then head to *Add-ons*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/323b6719-3ae4-4f55-a3aa-8295cc4adb8c)


## How to Rig Your Model!
To rig the body parts, you must have the mesh triangulated. 

**Step 1:** Set to `Object Mode`. Have all the body parts joined using *Ctrl + J*. While holding *Shift* firstly click on the mesh, then the armature, and make sure it's in that order, then hit *Ctrl + P* and click `With Empty Groups`.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/870c46ed-a287-435e-a4a3-f4a545b6d597)

**Step 2:** Select just the mesh and set it to `Edit Mode`, then *Right Click* and click on `Separate` then select `Loose Parts`.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/932de11e-4653-4b06-9e57-12ced70bf917)

**Step 3:** Pick a body part, then switch to `Edit Mode`. Press *A* to select the entire mesh and head to the Object Data section, before selecting the appropriate Vertex Group. Then click `Assign`. Repeat the process.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/6be71c7f-94b7-498b-81b0-9ae359667df5)

**Step 4:** Set up your EyeStates by finding the `Eye State Switch` bone! You can also replace a switch option with an entirely new model for the head instead of a texture. 

Eye states are as follows:
* Switch Option 1: Half-Closed Eyes
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

**Step 1:** Hover to the right side on the toolbar and look into *GeoLayout Exporter*. Then select the directory. Either you place the files under *"sm64coopdx/mods/character_mod/actors"* or *dynos/packs*. However, if you prefer exporting to DynOS Packs, you must have it named one of the following depending on what character you want to replace (Note that you can always rename the *_geo.bin* files):
* Mario: `mario`, `mario_geo`
* Luigi: `luigi`, `luigi_geo`
* Toad: `toad_player`, `toad_player_geo`
* Wario: `wario`, `wario_geo`
* Waluigi: `waluigi`, `waluigi_geo`

![image](https://github.com/coop-deluxe/character-template/assets/140215214/bd156f5a-0788-4257-92d1-f7f4851a478c)

**Step 2:** Click the *Mario Armature* and *Export Armature GeoLayout*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/249ffdb6-a017-44a8-bf40-bb4f4758e4f8)

**Step 3:** Open the game to build the model into a .bin file.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/f097634a-a319-4991-ba9c-fc8cf14c0fc0)

The model has now been built and is ready to use for modding! Any change to the model must have the old .bin file deleted!

## How to Set Color Lighting to Material!
Make sure all the mesh has the materials all shared AND organized.
A program such as Visual Code is needed to manually edit the files.

The game has eight recoloring slots for recolorability, though the metal cap one just uses the cap color:

* `CAP`
* `SHIRT`
* `SKIN`
* `HAIR`
* `PANTS`
* `GLOVES`
* `SHOES`
* `METAL` (Returns the `CAP` constant)

**Step 1:** Open the `geo.inc.c` file and scroll to the bottom. 

Type in the following lines in between. These will activate recolorability for most materials. You **MUST** have them in for recolorability to work:
```
GEO_ASM(LAYER_OPAQUE + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_ALPHA + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_TRANSPARENT + 3, geo_mario_set_player_colors),
```

![image](image.png)

**Step 2:** Open the `model.inc.c` file and head to 3/4 of the code. Replace the highlighted code with ``gsSPCopyLightsPlayerPart(???),`` to add in the coloring! Replace the ``???`` with the recoloring slot you want the material to use.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/65b2ec99-3604-4cee-b38f-bb00c631a79c)

**Step 3:** Delete any old `.bin` file and restart the game to create a new one! And you're set!

## How to create Custom Animations!
Wanna add your custom animations to your character? Here's how!

**Step 1:** Check your Animation Pointers file that is included in the ZIP file. It will help you identify which animation belongs to which action.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/f9124c96-05d3-4099-9bb4-c534a211a3fd)

**Step 2:** Set it to `Dope Sheet`, then set it to `Action Editor`.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/c73b8276-c5b8-412c-8c98-b608ccdad269)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/03b49722-3feb-4312-9086-808a5c2f1785)

**Step 3:** Go to Pose Properties and set the layer to ONLY the first one. The first one is to move the limbs, while the 2nd is for functions such as switch, scale, etc.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/062aaf43-4fa2-4345-8f7d-45f990c5337d)

**Step 4:** Because of the game's current limitations, you can only move and rotate the bones, so any scaling effect **will not** show in-game. Select a bone and start with one frame. Then press I and select `Location & Rotation`, this will insert a new frame on the current frame.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/894e4607-41d2-49ff-ae06-538c8170ca9d)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/441ff2a8-478f-4a6a-b15f-f46349a49545)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/55c2bfd4-2968-4c26-85c2-520f8b65a39f)

**Step 5:** Move to another frame and move the limb to how you want it, and then press I and `Location & Rotation` yet again.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/ca8fc6d1-553b-45c0-932d-417edb61276b)

Repeat the process with the rest of the limbs and animate your characters. 
NOTE: Animations C3, C4, and C5 are all a part of the idle animation. For the custom idle animations to not break, you must have each animation start on frame 0 and end on frame 29. You can also set up the manual range of the frames.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/72ea7b96-0499-4a32-9230-312e745ee4f5)

## How to add Custom Animations!
There are two ways of adding them.

### DynOS
This one is easy, but you can only replace existing animations with this.

**Step 1:** Head to `Action Editor` and select the animation.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/e0910bfb-a2f5-4594-bf0d-b6edaa188371)

**Step 2:** Head to the SM64 tab and find the `Animation Exporter`. Make sure you have the directory under `dynos/pack/[DYNOS NAME]`.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/f0f26d03-ed12-4658-8565-cab090995fc0)

**Step 3:** Once the animations are exported, head to the animations C files and open them to manually edit them. Table and Anim MUST be edited!

![image](https://github.com/coop-deluxe/character-template/assets/140215214/a9bd91f7-2cc9-497a-8042-1d425b3b72a9)

**Step 4:** Delete the white highlighted ``mario_`` parts so that the animations can work.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/cd29d849-fe5a-4a7a-9501-07516ede8247)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/b2a6b271-974c-4e7c-aa2a-3727bca0ce3a)

**Step 5:** Once that's saved, delete the old `.bin` file and open the game to generate a new one!

![image](https://github.com/coop-deluxe/character-template/assets/140215214/1202ebb9-d97a-4e7f-b93b-e1fda67b6ea0)

And it's done!

NOTE: You don't need to re-export the `geo.inc.c` and and `model.inc.c` files as the animation files are their own thing. You ALSO don't need to replace the `table.inc.c` file once it's edited.

### Lua
With this, you can add any custom animation and have it be played without replacing a vanilla animation! But it takes `lua` knowledge and a lot of work to do so.

**Step 1:** Create a lua file and write ``smlua_anim_util_register_animation(``, then the name of the animation. For example:

![image](https://github.com/coop-deluxe/character-template/assets/140215214/fcd42c88-4fd3-4309-b82f-75bf5a366f82)

**Step 2** If the animation file is exported, open it and copy its contents. Here's the order of how it's done:

**Tables**

![image](https://github.com/coop-deluxe/character-template/assets/140215214/c24faa14-1c37-4ebb-a2fa-5ceba1897053)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/abd57621-3296-4829-a547-1eb8bf03ca36)

**Values**

![image](https://github.com/coop-deluxe/character-template/assets/140215214/27280621-9fc4-4289-bb95-163c829999a0)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/db1b9589-c5b8-4806-b043-14cbb54394e3)

**Indices**

![image](https://github.com/coop-deluxe/character-template/assets/140215214/281d1565-d189-40fe-b1ae-1e704b2cc3d7)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/08c2ad58-a499-4184-a279-d92b2e78b146)

Example of how it's set up:

```
smlua_anim_util_register_animation("luigi_run",
    0,
    0,
    0,
    0,
    71,
    {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    },
    {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    }
)
```

Lua Example:

![image](https://github.com/coop-deluxe/character-template/assets/140215214/f22291b4-8246-4807-a1bb-d913921a09dd)

And that's how it's done! You can either add the code in `main.lua` or add it in a completely different `animation.lua` file!

## Common Error Fixes!
Errors, they stink, but we've been through this before!

### Vertex Groups Issue

This one is classic, it's annoying when it pops up but not that hard to fix, so don't worry and follow this guide:

![image](https://github.com/coop-deluxe/character-template/assets/140215214/cf3674a3-0fec-436a-b8c0-2d9eb0ad7868)

This means one of three things:
* The mesh is assigned to two or more bones. 
* The mesh is assigned to two different armatures.
* There is an ungrouped vertex or vertices in one of the meshes.

To fix the first 2 issues, join the main armature's mesh and *right-click*, then hover over `Parent` and click on `Clear Parent and Keep transformation`.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/0d4d96be-eb45-42a1-9613-36f649b1cf66)

To fix the third issue, firstly select all used meshes and go into `Edit Mode`, then switch to vertex select and click on the `Select` tab, then hover over `Select All by Trait` and click on `Ungrouped Vertices`, it should select all ungrouped vertices, after that, go into the meshes with ungrouped vertices and select the ungrouped vertex or vertices, and lastly assign them to the appropriate vertex groups.

![image](https://github.com/coop-deluxe/character-template/assets/88401287/878e427a-28d6-41fd-b0f3-a1467c3c70f7)

That should do it!

### Metal Head Bug
This is a Fast64 bug that occurs due to an update that changed how the materials work.

There are four *constants* for Cap Switches in order: 
* Vanish
* Metal + Vanish
* Metal

Only the custom head ``GEO_BRANCH`` with a clear name should be deleted.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/53a14448-3fe6-49d1-9f1b-fc50fc80950c)

### Model is Off-Centered
Ever wonder why your model always was away from the shadow and you don't know how to fix it? Here's how!

* Select the mesh and set the 3D Cursor to the ROOT / Body bone.
* Then go into the `Object` tab at the top of the 3D viewer and hover over `Set Origin`.
* Lastly, click on `Origin to 3D Cursor` to snap the origin to the Root bone of your armature.
![image](https://github.com/coop-deluxe/character-template/assets/140215214/8dca5754-e42d-4ccf-9288-8a0a284a835e)

And that's it, now the model should be centered:

### Floating Short Characters and Sinking Tall Character

If your character is floating or sinking through the floor, you can easily fix it by following this guide:

**Step 1:** While you're in `Object Mode` select the armature to lower its origin point by firstly setting the action to the `In-Game Example (DO NOT EXPORT WITH THIS)` action, then go to the top right corner of the screen and click on the `Options` tab and check the `Origins` and `Parents` boxes (make sure to uncheck them when you're done), then move the origin point down using the move tool until it's exactly under your character's feet, the orange point should look something like this:
![image](https://github.com/coop-deluxe/character-template/assets/88401287/ea73b295-a831-42b1-b157-8d883e042326)
**Step 2:** Find the `Scale` bone in your armature and go into its bone properties
**Step 3:** Here is where it gets slightly more complicated, you will have to do some math here, and find the scale value (by default it should be 0.25) and change it depending on your character (taller = increase, shorter = decrease), and keep the new value noted (you might have to change it multiple times so that it displays correctly in-game):
![image](https://github.com/coop-deluxe/character-template/assets/88401287/1ca1c40a-d484-4c52-9a99-dd5acf877e20)
**Step 4:** Remember when I said that you will have to do some math, here is the formula:
`0.25/n * 212.766` where `n` is your new value, just put it in a calculator and get the result
**Step 5:** Lastly, in the `SM64` tab of Fast64, find the `SM64 File Settings` menu and find the `Blender to SM64 Scale` value, insert your value from the last step here.
![image](https://github.com/coop-deluxe/character-template/assets/88401287/45c3bcba-60da-400b-b672-0a80e3b74098)

Now your model should have most of its offsets fixed (some animations like ledge grabbing will still look like you're floating depending on the arm length)

### Metal Texture screws up Romhacks

![image](https://github.com/coop-deluxe/character-template/assets/140215214/c0032846-57f4-4c70-a2b4-66913f8c719a)

Due to how the new Metal Texture works, it messes up with the romhack textures. to fix this, open `model.inc.c` file, then replace the code in the screenshot entirely with this:

Original Code (At the VERY bottom!):
![image](https://github.com/coop-deluxe/character-template/assets/140215214/6cbc5b32-91cf-4f5d-b971-1df2a5f515c8)

New Code:

    Gfx mario_material_revert_render_settings[] = {
      gsDPPipeSync(),
      gsSPSetGeometryMode(G_LIGHTING),
      gsSPClearGeometryMode(G_TEXTURE_GEN),
      gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
      gsSPTexture(65535, 65535, 0, 0, 0),
      gsDPSetEnvColor(255, 255, 255, 255),
      gsDPSetAlphaCompare(G_AC_NONE),

      gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
      gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
      gsDPLoadBlock(7, 0, 0, 1023, 256),
      gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
      gsDPSetTileSize(0, 0, 0, 124, 124),

      gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
      gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 256, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
      gsDPLoadBlock(6, 0, 0, 1023, 256),
      gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 256, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
      gsDPSetTileSize(1, 0, 0, 124, 124),

      gsSPEndDisplayList(),
    };

NOTE: Make sure you replace ``mario`` with the correct default character you're replacing.

Default Characters:
``mario``
``luigi``
``toad_player``
``waluigi``
``wario``

![image](https://github.com/coop-deluxe/character-template/assets/140215214/3d3ff8a9-6e39-4b75-b565-588eecc4ac46)


## Miscellaneous
Want some tips based on what we learned? No problem!

### Disable Tilt Torso
Y'know how in BETA Mario's running animation his torso never tilts?

![image](https://github.com/coop-deluxe/character-template/assets/140215214/40d05041-4118-40bf-83ad-567b3d1ea925)

Well.. you can do something like that!
Head to `geo.inc.c` file of your model and locate it in search for ``GEO_ASM(0, geo_mario_tilt_torso),``, it should be located at the last constant of the file, then delete it! That's it!

![image](https://github.com/coop-deluxe/character-template/assets/140215214/1532d461-03ee-454c-8a8e-3c9ea1425030)

### Editing Aramature Anatomy
Is your character's body too different from Mario? Do this!

**Step 1:** Make sure you select the armature in *Object Mode*.

![1](https://github.com/coop-deluxe/character-template/assets/140215214/0dc495a7-2da0-4100-8169-2fdcb54c03ac)

**Step 2:** Head to the pose settings and select both layers.

![2](https://github.com/coop-deluxe/character-template/assets/140215214/26300bae-4633-4e85-8953-0b9b1de6283c)

**Step 3:** Set to `Edit Mode` and multi-select that one bone. Remember each offset bone has other bones attached to it. Perspective WILL help you with this!

![5](https://github.com/coop-deluxe/character-template/assets/140215214/0d3c396d-6bef-4f49-b820-0810c2a84438)
![6](https://github.com/coop-deluxe/character-template/assets/140215214/b37485ee-3231-4d65-a9a3-b1d08b3a5bad)

### Moving Your Model to a New Armature.
Is the main armature being a pain to you due to many errors but you're too scared to redo everything? TRY THIS!

**Step 1:** Click the meshes and *right-click*. Then hover to `Clear Parent` and select `Clear Parent and Keep Transformation`. Then, head to the `Modifiers` section and delete the Armature modifier. Do this to ALL of your meshes!

![2](https://github.com/coop-deluxe/character-template/assets/140215214/50d135e3-1fc8-47e2-9b65-9b53d11bae89)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/3d1d3f30-07c5-4c27-b064-3c3aab8849bd)

NOTE: As long as you have these vertex groups left alone, you SHOULD be fine once you head to the new armature.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/ee28ca3b-608a-4287-93f4-b40370f0715a)

**Step 2:** Multi-select all the unparented meshes and head to the `Select` tab. Click `Invert` and delete everything BUT the meshes. Once the meshes are left alone, copy and paste them into the new unbroken armature.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/263afd8b-b748-46f8-9e84-066b4b18edc6)
![image](https://github.com/coop-deluxe/character-template/assets/140215214/582682e2-2fe4-456d-bb3b-a1008b558c75)

**Step 3:** Make sure the meshes on the new template have the parent cleared AND the Armature modifier removed. Mult-select the mesh with the cleared parent and the removed modifier be deleted. Note: I'd recommend removing the vertex groups from those meshes as safekeeping. But that's up to you.

**Step 4:** Paste the old meshes on the new armature, then just parent them to the appropriate armature. That's pretty much it!

![4](https://github.com/coop-deluxe/character-template/assets/140215214/34d83929-fb24-48b1-a0a1-38694be7867e)

### Different Shades, Same Color
Does your character have two shades of the same color but more recolor slots? Follow this:

Make a material with the same color as the other. Set the 2nd Material to `Sm64 Decal`. Make an image with a transparent color of your choice (either white or black).

![Showcase](https://github.com/coop-deluxe/character-template/assets/140215214/9ffec240-c159-4fca-8fdd-608417fe86fa)

Here's the result! They BOTH use the CAP color!

![image (9)](https://github.com/coop-deluxe/character-template/assets/140215214/2ead971e-edf7-40ea-b422-4900e572a7a9)

You can download the textures here:

![25% White](https://github.com/coop-deluxe/character-template/assets/140215214/ea4e74a0-2262-4f82-a17e-1608f4e8da58)
![Half Transparent White](https://github.com/coop-deluxe/character-template/assets/140215214/a43b0bea-2dda-4e8e-a912-9162f18604ed)
![Transparent Black Half](https://github.com/coop-deluxe/character-template/assets/140215214/9382603a-8e51-412e-9de8-1adc8b0b88c6)
![Transparent Black](https://github.com/coop-deluxe/character-template/assets/140215214/45cc4cad-a6f2-4557-b84f-f0915722c024)

### Wings on Back
Do you want to change where the wings are on your character? It's easier than you may think, check this out:

**Step 1:** With your armature selected, go into `Pose Mode` and select the `Left/Right Wing` bones
**Step 2:** Select each one individually and go into the `Item` tab
**Step 3:** There will be locked locks beside the location fields, unlock them so you can move the wing bones
**Step 4:** Move your wing bones to where you want them and apply as rest pose, make sure to lock the bones again
**Step 5:** Go into `Edit Mode` and find the wing bones and once again select them individually
**Step 6:** Change both of their parents to the `Torso` bone
**Step 7:** Find the `Eye State Switch` bone and change its parent to the `1 C-Up Head Rotation` bone
**Step 8:** Find the `Capless Switch` bone and change its parent to the `Torso` bone, this is how the game handles the showing and hiding of wings on your head
**Step 9:** Find the `Head` bone and change its parent to the `Capless Switch` bone

Once you're done with that, the wings should be on Mario's back, but now the capless head is broken, so we need to fix it:

**Step 1:** Select the `Capless Head` armature and go into `Edit Mode`
**Step 2:** Create 3 new bones by hitting *Shift+A* 3 times
**Step 3:** Rename the first one to `Capless Head Color`
**Step 4:** Rename the second one to `0 Capless C-Up Head Rotation Function`
**Step 5:** Rename the third one to `1 Capless C-Up Head Rotation`
**Step 6:** Change the `0 Capless C-Up Head Rotation Function` and `1 Capless C-Up Head Rotation` bones' parents to `Capless Head Color` bone
**Step 7:** Change the `Capless Head Color` bone's parent to the `Capless Head Switch Option` bone
**Step 8:** Change the `Capless Head Eye State Switch` bone's parent to the `1 Capless C-Up Head Rotation`
**Step 9:** Go into `Pose Mode` and do the change the following
  * For the `0 Capless C-Up Head Rotation Function` change the geolayout command to `Function` and the `Function` field to `802773a4`
  * For the `1 Capless C-Up Head Rotation` change the geolayout command to `Rotate`

And now you're done, now you have wings on your character's back with no issues.

### Good luck!
