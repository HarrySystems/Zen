## This is the `dev` module. It simply provides helpers to walk around the source code.
function zen_dev()
{
	case $1 in
		"config")
			zen_dev edit ~/zen/config/$2.sh
		;;

		"plugin")
			zen_dev edit ~/zen/plugins/$2.sh
		;;

		"core")
			zen_dev edit ~/zen/zen.sh
		;;

		"edit")
			if [[ ! -z "$2" ]]; then
				zen_vim edit $2
				source $2
				zen_dev restart
			fi
		;;

		"restart")
			zen_restart=true
		;;

		*)
			return 2
		;;
	esac
}
