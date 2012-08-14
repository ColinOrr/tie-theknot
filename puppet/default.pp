group { 'puppet': ensure => present }

# Install Rails dependencies
package { 'ruby1.9.3': ensure => present }
package { 'build-essential': ensure => present }
package { 'libmysqlclient-dev': ensure => present }
package { 'sqlite3': ensure => present }
package { 'libsqlite3-dev': ensure => present }
package { 'bundler': ensure => present, provider => 'gem', require => Package['ruby1.9.3'] }

# Allow gem to run as normal user
file { '/var/lib/gems': ensure => 'directory', owner => 'vagrant', require => Package['ruby1.9.3'] }
file { '/usr/local/bin': ensure => 'directory', owner => 'vagrant', require => Package['ruby1.9.3'] }
