MongoDB Community Edition

* Download [files](https://www.mongodb.com/download-center/community)
* Open user main directory: `cd && open .`
* Rename download directory: `mongodb`
* Move directy to user home folder: `/user/mongodb`
* make a new directory called *mongodb-data* in user home directory `mkdir mongodb-data`
* open *bash_profile*: `cd && nano .bash_profile`
* Add to profile: `alias startmongo='cd && /Users/$USER/mongodb/bin/mongod --dbpath=/Users/$USER/mongodb-data'`
* Reboot Terminal: `cd && . .bash_profile`

to start run the command `startmongo`
