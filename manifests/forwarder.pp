class log::forwarder {

	class { 'beaver': }

	file_fragment { 'logstash_version_fragment' :
		tag     => "beaver_config_${::fqdn}",
		content => "logstash_version:1\n",
		order   => 11,
	}  

	beaver::output::redis { 'redis_out':
		host => hiera('beaver::redis::host', 'localhost'),
	}

}