Many months have passed and you forgot how this works hayyaa...
ok, let's start again.


1. We use JSON TO DART MODEL - a vscode extension that automates json serialization, meaning
we only have to give the json structure of the model and it will generate the class with all the
useful methods like copywith etc. for us.

2. The code generation works from top to bottom, so we have to put some numbering on .jsonc files,
A-model has a field model-B then model-B should be generated first.

3. JSON TO DART MODEL has Settings. Go to File > Preferences > Settings > Extensions > JSON TO DART 

4. Generator can't predict if you want to have INT or DOUBLE when you use a number as value, 
so you have to put a decimal e.g 0.01 to tell that you want a double not an int.

5. To reference already existing model as a value to another model field use:
"address.address": {}
if it's a list
"addresses.address": [{}]

