class log::forwarder {

	anchor { 'log::forwarder::begin': } ->

	if $cond_agentfqdn != '' {
		$host = $cond_agentfqdn
	} elsif $cond_masterfqdn != '' {
		$host = $cond_masterfqdn
	} else {
		$host = $::fqdn
	}

	class { 'beaver':
		hostname => $host,
	} ->

	file_fragment { 'logstash_version_fragment' :
		tag     => "beaver_config_${::fqdn}",
		content => "logstash_version:1\n",
		order   => 11,
	} ->

	beaver::output::redis { 'redis_out':
		host => hiera('log::broker', 'localhost'),
	} ->

	anchor { 'log::forwarder::end': }

}