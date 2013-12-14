fs
==

__freesound.org command line tool. It's pretty shit right now but improvements will happen.__

I mainly use this with [https://github.com/yaxu/tidal](tidal), so it only searches for wav files right now. I may allow other filetypes in the future with an options flag.

---

###Installation

*These instructions are currently for OS X. Linux version coming soon.*

You better have Ruby installed.

You'll also need to have a [freesound.org API key](http://www.freesound.org/api/apply/). Once you have that, run `export FREESOUND_API_KEY=whateveryourapikeyis`, or stick that line in whichever dotfile you use for that sort of thing. 

Preparations complete, clone the repo to somewhere: `git clone git@github.com:revdan/fs.git`

`cd` to that folder, and install the gems `commander`, `freesound`, `awesome_print`, and `httparty`. I'd recommend [RVM](https://rvm.io/) if you don't already use it.

Last of all, let's make an alias so we don't have to be in this folder to run it: `alias fs=~/path/to/fs/fstool`

Test it works: `fs grep dubstep`

---

###Usage

####grep
   
    fs grep <keywords>
   
Search for a wav file using the given keywords. Returns `id :: title`.

This will include all, rather than combinations of keywords. For example, `fs grep dubstep 140` will most likely find dubstep samples at 140BPM, rather than dubstep _or_ 140BPM samples. If you want to search for two things, do two searches.

####info

    fs info <id>
    
Prints all the attributes for a given sample.

####play

    fs play <id>
    
Plays a lower-quality preview of the sample.

####dl

    fs dl <id>
    
Downloads the original wav file. It will ask for a directory but at the moment only supports directories below the current one. I'd recommend running this in your base `samples` directory, so you can create subdirectories grouped by names of your choosing. Again, this is on my list of things to improve.

Happy hacking! :musical_keyboard:
