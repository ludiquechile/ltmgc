ltmgc
=====

Ludique&#39;s TUIO multiplexer, gestures and calibration gateway

QT Project info : 

FOR WINDOWS : You will need to copy the dlls in the binary zip file to the build directory.

FOR MAC OSX : Compiles fine if you have an opencv installation. 
Change the lib and include paths for opencv in the .pro file.



How to use :

Multiplexer

Select the input TUIO port and start listening.
Fill the host and port of the outputs you need and check active on them.

Point Calibration

Listen to some TUIO port
Select the number of point you will be using for calibration (the final number is this one squared)
Select the number of TUIO updates for each point (number of frames)
Start the point calibration and follow the instructions in the "Instructions" dialog.

NOTE: Each frame is a client update so it depends on your TUIO server update interval.

Gestures

Gestures are sent as objects with the ID that appears next to them. 
Only input cursors are checked for gestures. 
The min and max duration define the timespan for a cursor to be considered for gestures.

Click "Add Gesture" to initialize a new gesture.
Listen to some TUIO port
Select the duration of a gesture action
Click "Train" beside the gesture Id. If you are receiving a cursor through your TUIO listener, 
and its duration was between the timespan selected, then a drawing of the gesture will appear. 
Your gesture is now trained. You can test recognition by looking at the checkbox on the right 
of the drawing when you do the gesture.
Now every server you have active in the Output TUIO zone gets your gestures.
The "How long to keep the object alive" represents the time to wait before removing the object from the servers. 
This span should be short (the program hangs while it waits)