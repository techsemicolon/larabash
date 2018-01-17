# larabash

Simple bash to with commands to make your development easy

## Installation


``` bash
$ git clone https://github.com/techsemicolon/larabash.git larabash
$ cd larabash
$ cp laravel.sh /path/to/laravel-root
$ cd /path/to/laravel-root
$ chmod 775 laravel.sh
```

## Getting started with usase


``` bash
$ cd /path/to/laravel-root
$ ./laravel.sh command-name
```

Where command-name is the identified of the command. For example if you want to run help command which lists all the available commands with description, you can run

``` bash
$ cd /path/to/laravel-root
$ ./laravel.sh help
```

To simplify things, you can make an alias of the command : 

``` bash
$ cd /path/to/laravel-root
$ alias larabash="./laravel.sh"
```
And then directly run

``` bash
$ cd /path/to/laravel-root
$ larabash help
```

## Available Commands

| Command               	                   | Description 
|:-----------------------------------------|:-----------|
| help                 | Get all commands available with description                             | 
| search-app           | Search String passed as second arg inside app folder                    | 
| search-view          | Search String passed as second arg inside views folder                  | 
| search-vendor        | Search String passed as second arg inside vendor packages               | 
| get-packages         | Get organized list of all packages installed via composer               | 
| get-app-dir          | Get tree hierarchy of app folder recursively                            | 
| get-recent-changes   | Get files changes in last 24 hours                                      | 
| get-env              | Get details of your .env file                                           | 
| get-stats            | Get current project stats like current git branch, last commit etc      | 
 


