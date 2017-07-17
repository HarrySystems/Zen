function zen_job()
{
	case "$1" in
		"list")
			jobs -l | awk '{
				printf $1 " "
				printf $2 " "
				system("cat /proc/"$2"/cmdline | xargs -0 echo") 
			}'
		;;

		"")
			zen_jobs paths
		;;

		*)
			return 2
		;;
	esac
}

