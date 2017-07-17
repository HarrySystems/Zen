function zen_session()
{
	case $1 in
		"list")
			dirs -v
		;;

		"push")
			{
				echo "$2"
				if [[ -z "$2" ]]; then
					pushd "`pwd`"
				else
					pushd "+$2"
				fi
			} > /dev/null
		;;

		"pop")
			{
				if [[ -z "$2" ]]; then
					popd "+0"
				else
					popd "+$2"
				fi
			} > /dev/null
		;;

		*)
			
			# insert return 2 whan it wil be an error
			zen_session push "$1"
		;;
	esac
}
