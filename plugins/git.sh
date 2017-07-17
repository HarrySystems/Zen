function zen_git()
{
	case $1 in
		"log")
		;;

		"commit")
			git commit -m "$2"
		;;

		"push")
			git push --follow-tags --force
		;;

		"lazy")
			# commit or amend and push
		;;

		*)
			return 2
		;;
	esac
}
