function zen_profile()
{
	case $1 in
		"go")
			zen_profile open ${@:2}
		;;

		"config")
			zen_zen "$@"
			zen_bash list 
		;;

		"edit")
			zen_vim "$@" 
		;;

		"create")
			zen_bash "$@"
			zen_profile list
		;;

		"remove")
			zen_bash "$@"
		;;

		"commit")
			zen_git "$@" 
		;;

		"clear")
			zen_bash "$@" 
		;;

		"edit")
			zen_vim "$@" 
		;;

		"list")
			zen_profile clear
			zen_bash list
		;;

		"open")
			zen_bash "$@"
			zen_profile list
		;;

		"pop")
			zen_session "$@"
			zen_profile list
		;;

		"push")
			zen_session "$@"
			zen_profile list
		;;

		"core")
			zen_zen "$@"
		;;

		"plugin")
			zen_zen "$@"
		;;

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
