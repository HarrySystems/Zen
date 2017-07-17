# defaults for basic zen modules
	function zen_events() { 
		echo "" 
	}
	function zen_profile() { 
		echo "" 
	}

# core
	function zen()
	{
		# clear screen
			printf "\033c"

		# load all plugins
			#{
				for f in ~/zen/plugins/*
				do
					source $f
				done

				for f in ~/zen/config/*
				do
					source $f
				done
			#} &>/dev/null

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

				if [[ $action != zen ]]; then
					#{
					#	# shell commands
					#	echo "1"
					#	eval "$action $context"
					#} 2>/dev/null || 
					{
						# action based context
						#echo "2"
						eval "zen_$context $action $arguments"
					} 2>/dev/null || {
						# context based actions 
						#echo "3"
						eval "zen_$action $context $arguments"
					} 2>/dev/null || {
						# command from profile
						#echo "4"
						eval "zen_profile $action $context"
					} 2>/dev/null || {
						# shell commands
						#echo "5"
						eval "$action $context"
					} 
				else
					echo "Can it be more zen than this?"
				fi
			done

			if [[ $zen_restart ]]; then
				zen_restart=false
				zen
				return
			fi
	}

