function zen_bash()
{
	case $1 in
		"open")
			# directory
			if [ -d "$2" ]; then
				times=1
				if [[ ! -z "$3" ]]; then
					times="$3"
				fi

				for i in `seq 1 $times`
				do
					cd "$2"
				done

			# file
			elif [ -f "$2" ]; then
				zen_vim edit "$2"

			# alternate inside stack 
			elif [[ "$2" =~ [0-9] ]]; then 
				zen_session "$2"
			else
				echo "Impossible to open `$2`"
				return 2 
			fi
		;;

		"list")
			dirs -v

			case $2 in
				"time")
					ls -t
				;;
				
				"size")
				;;

				"name")
					ls -a
				;;

				"name_desc")
				;;
				
				*)
					ls -a
				;;
			esac
		;;

		"config")
			zen_vim source ~/.bash_profile
		;;

		"clear")
			printf "\033c"
		;;

		"create")
			if [[ "$2" == *"/" ]]; then
				mkdir "$2"
			else
				touch "$2"
			fi
			zen_bash open "$2"
		;;

		"remove")
			read -p "Are you sure you want to delete? (y/n)" answer
			if [[ "$answer" == "y" ]]; then
				rm -rf "$2"
				echo "'$2' successfully deleted!"
			else
				echo "Delete action aborted."
			fi
		;;

		*)
			#echo "$1"
			return 2
		;;
	esac
}

