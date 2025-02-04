# mod-manager-batch

This is a script built for the game ReadyOrNot. Depending on the user selection, it moves your modded `.pak` files into or out of your `paks` directory.
This will allow you to easily enable or disable mods with a simple script so you don't have to manually cut and paste the pak files.

The script looks for each standard pak that comes with the game, ignores them, and then moves all other pak files into a `mods` directory within the `content` directory.

## Installation

1. Download the `.bat` file to your windows PC
2. Move the `.bat` file to the content directory of Ready Or Not `C:\Program Files (x86)\Steam\steamapps\common\Ready Or Not\ReadyOrNot\Content`
3. Run the `.bat` file as administrator and follow the instructions to enable/disable files
4. (Optional but recommended) Create a shortcut on your desktop to the `.bat` file for easy use.


# To Do's

The new Enable Online-Safe mod functionality needs some validation of the mod state to make sure we have online mods enabled before removing others.
We can either set up a check for the specific mods and if not there, move them in. Or we can enable all then run the online-safe logic.