# Puppet Log Module

```ruby
mod "puppetlabs/stdlib", "4.5.1"
mod "puppetlabs/concat", "1.2.0"

# dep: puppetlabs/stdlib
mod "ispavailability/beaver", "0.0.3"

# dep: puppetlabs/stdlib
# dep: puppetlabs/concat
mod "pdxcat/collectd", "3.2.0"

# dep: ispavailability/beaver
# dep: pdxcat/collectd
mod "weyforth/log",
	git: "https://github.com/weyforth/puppet-log.git",
	ref: "master"
```

