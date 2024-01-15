--FAST64 CHARACTER MODEL TEMPLATE FOR EXCOOP--

--This is a guide for beginners who started doing DynOS Models! Guide by AngelicMiracles

----------------------------------------
----------------BONE LIST---------------
----------------------------------------

000-offset              --Butt
000-offset.001          --Upper Body
000-displaylist         --Head
000-displaylist.001     --Left Wing
000-displaylist.002     --Right Wing
000-offset.003          --Right Upperarm
000-offset.004          --Right forearm
000-displaylist.003     --Right Hand
000-offset.006          --Left Upperarm
000-offset.007          --Left Forehead
000-displaylist.004     --Left Hand
000-offset.009          --Right Upperleg
000-offset.010          --Right Foreleg
000-offset.011          --Right Shoe
000-offset.012          --Left Upperleg
000-offset.013          --Leg Foreleg
000-displaylist.005     --Leg Shoe

----------------------------------------
-------------CAP ARMATURES--------------
----------------------------------------

--When exporting the Caps, make sure you export it as "mario_geo", with all Caps' C file codes combined into one!

----------------------------------------
-------ADDING RECOLORED BODY PARTS------
----------------------------------------

--Go to Geo.inc.c and place this over GEO_ASM(0, geo_mirror_mario_backface_culling), under GeoLayout mario_geo!
GEO_ASM(0, geo_mario_set_player_colors),
GEO_ASM(LAYER_TRANSPARENT + 3, geo_mario_set_player_colors),


--Use this with the existing CombineLERP for Metal or any Environment Maps
gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),

--This is to replace gdSPDefLights1 and add recolor to the body part.
--Current body parts are CAP, SHIRT, SKIN, PANTS, GLOVES, HAIR and SHOES! There's also METAL but it's the same as CAP.
gsSPCopyLightsPlayerPart(CAP),

--If your character is too tall or too short, search the code below in Geo.inc.c and edit the XYZ coords to set the character's high!
GEO_ANIMATED_PART(LAYER_OPAQUE, 128, 0, 0, NULL),

--Select the Armature Mesh then delete the existing Eye, Mustache and Sideburn materials with the skin color on it (Let's call it DECALS). 
--Then join the mesh and the transparent textures' mesh. (Don't forget to set the eyes in the Eye Switch bone for Cap and Capless!)

--If you want to use only the DECAL textures, delete the transparent texture mesh.

----------------------------------------
-----------------MISC-------------------
----------------------------------------

--Search this code everywhere in the Geo.inc.c below to remote if you want the torso to not tilt. (I.E. Beta Mario)
GEO_ASM(0, geo_mario_tilt_torso),


----------------------------------------
-------------FIXING ERRORS--------------
----------------------------------------

--If multiple heads for reactions have been added and the metal breaks, head to Geo.inc.c and delete all branches that say these:
GEO_BRANCH(1, mario_002_switch_opt0_001_switch_opt2_jump_mario_armature_002_switch_option_002_jump_mario_ExtraHead),
--Delete ONLY the ones under:
GEO_DISPLAY_LIST(LAYER_OPAQUE, mario_002_switch_option_???_mesh_layer_1_mat_override_metal_v3_003_0),

--IF your model is positioned away from the shadow, make sure the Origin of the armature is set to the 000-offset, the root bone.