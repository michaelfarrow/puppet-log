define log::forwarder::input(
	$type,
	$path = $name
) {

	beaver::input::file { "log_forwarder_input ${name}":
		file => $path,
		type => $type,
	}

}