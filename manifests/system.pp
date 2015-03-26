class log::system {

	class { 'collectd':
		purge        => true,
		recurse      => true,
		purge_config => true,
	}

	include collectd::plugin::cpu

	include collectd::plugin::cpufreq

	class { 'collectd::plugin::df':
		mountpoints    => ['/u'],
		fstypes        => ['nfs','tmpfs','autofs','gpfs','proc','devpts'],
		ignoreselected => true,
	}

	include collectd::plugin::disk

	class { 'collectd::plugin::interface':
		interfaces     => ['eth0'],
	}

	include collectd::plugin::load

	include collectd::plugin::memory

	# collectd::plugin::mysql::database { 'betadase':
	#   host        => 'localhost',
	#   username    => 'stahmna',
	#   password    => 'secret',
	#   port        => '3306',
	#   masterstats => true,
	# }
	# include collectd::plugin::swap
	# include collectd::plugin::vmem

	$http_url = hiera('log::broker', 'localhost')

	class { 'collectd::plugin::write_http':
		urls => {
			"http://${http_url}/" => {
				format => 'command',
			},
		}
	}

	class { 'collectd::plugin::logfile':
		log_level => 'warning',
		log_file => '/var/log/collectd.log'
	}

}