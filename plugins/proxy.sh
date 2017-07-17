function zen_proxy()
{
	case $1 in 
		"config")
			zen_profile open ~/.proxy
		;;

		"load")
			source ~/.proxy
		;;

		*)
			return 2
		;;
	esac
}
