function zen_proxy()
{
	case $1 in 
		"config")
			zen_profile open ~/.proxy
		;;

		"load")
			{
				source ~/.proxy
			} 2>/dev/null
		;;

		*)
			return 2
		;;
	esac
}
