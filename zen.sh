# defaults for basic zen modules
	function zen_events() { 
		echo "" 
	}
	function zen_profile() { 
		echo "" 
	}

	function zen_source() {
		#{
			source ~/zen/zen.sh

			for f in ~/zen/plugins/*; do
				source $f
				echo $f
			done

			for f in ~/zen/config/*; do
				source $f
			done
		#} 2>/dev/null
	}

# core
	function zen()
	{
		case $1 in
			# interactive shell aka zem mode
			"")
				# clear screen
					printf "\033c"

				# load all plugins and configuration
					zen_source

				# enable history
					shopt -s histappend

				# start event
					zen_events start

				# flags for communication between plugins and the core
					zen_alive=true
					zen_restart=false

				# interactive shell
					while ($zen_alive && ! $zen_restart)
					do
						read -e -p "Zen> " action context arguments
						history -s "$action $context $arguments"

						if [[ $action = zen && -z $context ]]; then
							echo "Can it be more zen than this?"
							continue
						else
							zen $action $context $arguments
						fi
					done

					if [[ $zen_restart ]]; then
						zen_restart=false
						zen
						return
					fi
			;;

			# interpret commands
			*)
				action=$1
				context=$2
				arguments=${@:2}

				echo "action: $action"
				echo "context: $context"
				echo "arguments: $arguments"

				{
					# action from profile
					eval "zen_profile $action $context"
				} 2>/dev/null || {
					# action based context
					eval "zen_$context $action $arguments"
				} 2>/dev/null || {
					# context based actions 
					eval "zen_$action $context $arguments"
				} 2>/dev/null || {
					# shell commands
					eval "$action $context"
				} 
			;;

		esac
	}

