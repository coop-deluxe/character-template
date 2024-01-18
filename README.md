# Character Template for Coop Deluxe
This is a character template that uses the original Fast64 blend file and expands upon it to take advantage of the less limitations the PC Port has. Not only does it renames the offsets with appropiate names, but also contains multiple heads for the unused eyestates.

*Fast64-Coop is required for this .Blend file. You can download it from here:* https://github.com/Agent-11/fast64-coop

To install it, head to the icon on the upper left and switch to *Preferences* then head to *Add-ons*.

![image](https://github.com/coop-deluxe/character-template/assets/140215214/323b6719-3ae4-4f55-a3aa-8295cc4adb8c)


## How to Rig Models
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
