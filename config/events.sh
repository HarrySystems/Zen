function zen_events()
{
	case $1 in
		"start")
			zen_bash list
		;;
	esac
}
