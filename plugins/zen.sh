## This is the `dev` module. It simply provides helpers to walk around the source code.
function zen_zen()
{
	case $1 in
		"config")
			if [[ ! -z "$2" ]]; then
				if [[ -f "~/zen/config/$2.sh" ]]; then
					zen_zen edit ~/zen/config/$2.sh
				else
					return 2
				fi
			else
				ls ~/zen/config/
			fi
		;;

		"plugin")
			if [[ ! -z "$2" ]]; then
				zen_zen edit ~/zen/plugins/$2.sh
			else
				ls ~/zen/plugins/
			fi
		;;

		"core")
			zen_zen edit ~/zen/zen.sh
		;;

		"edit")
			if [[ ! -z "$2" ]]; then
				zen_vim edit $2
				source $2
				zen_zen restart
			fi
		;;

		"restart")
			zen_restart=true
		;;
		
		"exit")
			zen_alive=false
		;;

		*)
			return 2
		;;
	esac
}
