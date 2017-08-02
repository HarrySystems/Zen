function zen_profile()
{
	case $1 in
		# GIT
			"commit")
				zen_git "$@" 
			;;

		# VIM
			"edit")
				zen_vim "$@" 
			;;

		# BASH
			"create")
				zen_bash "$@"
				zen_profile list
			;;

			"remove")
				zen_bash "$@"
			;;

			"list")
				clear
				zen_bash list
			;;

			"open")
				zen_bash "$@"
				zen_profile list
			;;

		# SESSION
			"pop")
				zen_session "$@"
				zen_profile list
			;;

			"push")
				zen_session "$@"
				zen_profile list
			;;

		# DEV
			"core")
				zen_zen "$@"
			;;

			"plugin")
				zen_zen "$@"
			;;
			
			"config")
				zen_zen "$@"
				zen_bash list 
			;;

		# navigation and general commands
			*)
				if [[ -d $@ || -f $@ || $@ =~ [0-9] ]]; then 
					zen_profile open "$@"
				else
					if [ -d $@ ]; then
						zen_profile open $@
					else
						return 2
					fi
				fi
			;;
	esac
}
