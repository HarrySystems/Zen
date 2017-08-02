function zen_git()
{
	case $1 in
		"log")
		;;

		"commit")
			if [[ -z "$3" ]]; then
				git commit -m "$2"
			else
				git $@
			fi
		;;

		"push")
			git push --follow-tags --force
		;;

		*)
			git $@
			#return 2
		;;
	esac
}
