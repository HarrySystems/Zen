function zen_vim()
{
	case $1 in
		"edit")
			# store current path
			pwd=$(pwd)

			# open root local directory
			cd ~/

			{
				# open vim from external path
				if [[ "$2" == "/"* || "$2" == *":"* || "$2" == "~/"* ]]; then
					vim "$2"

				# open vim from local path
				else
					vim "$pwd/$2"
				fi
			} 2>/dev/null

			# go back to original path
			if [[ -d "$pwd" ]]; then
				cd "$pwd"
			fi
		;;

		"config")
			zen_vim edit ~/.vimrc
		;;

		"source")
			zen_vim edit "$2"
			source "$2"
		;;

		*)
			return 2
		;;
	esac
}

