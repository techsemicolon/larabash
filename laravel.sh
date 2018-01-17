#!/bin/bash

case $1 in


    'search-app')

		if [ -z "$2"]
		  then
		    echo -e "\e[91m No arguments supplied"
		else
	        Result=`grep -ril $2 app/`
	        echo -e "\033[0;33m-----------------------------------------------------------"
			echo -e "\033[0;33mString \033[1;34m'$2'\033[0;33m was found in following files inside app directory"
	        echo -e "\033[0;33m-----------------------------------------------------------"
	        echo -e "\033[0;32m$Result"
	        echo -e "\033[0;33m-----------------------------------------------------------"
		fi;;


    'search-view')
        
        if [ -z "$2"]
		  then
		    echo -e "\e[91m No arguments supplied"
		else
	        Result=`grep -ril $2 resources/`
	        echo -e "\033[0;33m-----------------------------------------------------------"
			echo -e "\033[0;33mString \033[1;34m'$2'\033[0;33m was found in following files inside resources directory"
	        echo -e "\033[0;33m-----------------------------------------------------------"
	        echo -e "\033[0;32m$Result"
	        echo -e "\033[0;33m-----------------------------------------------------------"
        fi;;

    'search-vendor')
    	
    	 if [ -z "$2"]
		  then
		    echo -e "\e[91m No arguments supplied"
		else
	        Result=`grep -ril $2 vendor/`
	        echo -e "\033[0;33m-----------------------------------------------------------"
			echo -e "\033[0;33mString \033[1;34m'$2'\033[0;33m was found in following files inside vendor directory"
	        echo -e "\033[0;33m-----------------------------------------------------------"
	        echo -e "\033[0;32m$Result"
	        echo -e "\033[0;33m-----------------------------------------------------------"
        fi;;
    
    'get-packages')

		echo -e 
	    echo -e "\033[0;33m  ---------------------------------------------------------"
	    printf " | %-20s | %-30s %s | \n" "Author" "Package Name" 
	    echo -e "\033[0;33m  ---------------------------------------------------------"
	    echo -en "\e[0m"

		for dir in vendor/*/*
			do

			packageDetails=${dir/vendor\//''}
			packageNamespace=${packageDetails/\/*/''}
			packageName=${packageDetails/*\//''}

			printf " | %-20s | %-30s %s | \n" $packageNamespace $packageName 
		    echo -e "  ---------------------------------------------------------"
		done
		echo -e ;;

	'get-app-dir')
		
		echo -e
		ls -R app/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//---/g' -e 's/^/   /' -e 's/-/|/'
		echo -e ;;

	'get-recent-changes')

		ChangesInApp=`find app/  -mtime -1 | sort -r | head`
		ChangesInConfig=`find config/  -mtime -1 | sort -r | head`
		ChangesInDatabase=`find database/  -mtime -1 | sort -r | head`
		ChangesInResources=`find resources/  -mtime -1 | sort -r | head`
		ChangesInTests=`find tests/  -mtime -1 | sort -r | head`

		echo -e
		echo -e "\033[0;33m---------------------------"
		echo -e " Recently modified App Files \033[0;33m"
		echo -e "\033[0;33m---------------------------"
		echo -e "\033[0;32m$ChangesInApp"
		echo -e

		echo -e "\033[0;33m---------------------------"
		echo -e " Recently modified Config Files \033[0;33m"
		echo -e "\033[0;33m---------------------------"
		echo -e "\033[0;32m$ChangesInConfig"
		echo -e

		echo -e "\033[0;33m---------------------------"
		echo -e " Recently modified Database Files \033[0;33m"
		echo -e "\033[0;33m---------------------------"
		echo -e "\033[0;32m$ChangesInDatabase"
		echo -e

		echo -e "\033[0;33m---------------------------"
		echo -e " Recently modified Resource Views \033[0;33m"
		echo -e "\033[0;33m---------------------------"
		echo -e "\033[0;32m$ChangesInResources"
		echo -e

		echo -e "\033[0;33m---------------------------"
		echo -e " Recently modified Tests \033[0;33m"
		echo -e "\033[0;33m---------------------------"
		echo -e "\033[0;32m$ChangesInTests"
		echo -e
		;;

	'get-env')
		
		envFile=`cat .env | sed '/^\s*$/d' | sed '/^#/d'`
		echo -e "\033[0;33m-----------------------------------------------------------"
		echo -e "\033[0;33m Environment file (.env)"
        echo -e "\033[0;33m-----------------------------------------------------------"
        echo -e "\033[0;32m$envFile"
        echo -e "\033[0;33m-----------------------------------------------------------";;

	'get-stats')

		BranchGrep=`git branch | grep '*'`
		BranchName=${BranchGrep/\*?/''}

		lastCommit=`git log -1`
		echo -e
		echo -e "\033[0;33m  Git Branch"
		echo -e "\033[0;34m  $BranchName"
		echo -e
		echo -e "\033[0;33m  Last Commit"
		echo -e "\033[0;34m  $lastCommit"
		echo -e
		echo -e "\033[0;33m  Laravel Version"
		echo -e "\033[0;34m" `php artisan --version`
		echo -e;;

	'help')
		
		echo -e "\033[0;33m  ------------------------------------------------------------------------------------------------"
	    printf " | %-20s | %-70s %s | \n" "Command" "Description" 
	    echo -e "\033[0;33m  ------------------------------------------------------------------------------------------------"
	    echo -en "\e[0m"
		printf " | %-20s | %-70s %s | \n" 'search-app' 'Search String passed as second arg inside app folder'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'search-view' 'Search String passed as second arg inside views folder'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'search-vendor' 'Search String passed as second arg inside vendor packages'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'get-packages' 'Get organized list of all packages installed via composer'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'get-app-dir' 'Get tree hierarchy of app folder recursively'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'get-recent-changes' 'Get files changes in last 24 hours'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'get-env' 'Get details of your .env file'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'get-stats' 'Get current project stats like current git branch, last commit etc'
		echo -e "  ------------------------------------------------------------------------------------------------"
		printf " | %-20s | %-70s %s | \n" 'help' 'Get all commands available with description'
		echo -e "  ------------------------------------------------------------------------------------------------";;

	*)
	echo -e "\e[91m  Invalid command";;
esac

# Reset terminal output to default color
echo -en "\e[0m"