group { 'puppet'        : ensure => present }
exec  { 'apt-get update': command => '/usr/bin/apt-get update' }

# Install Rails dependencies
package { 'ruby1.9.3'         : ensure => present, require  => Exec['apt-get update'] }
package { 'build-essential'   : ensure => present, require  => Exec['apt-get update'] }
package { 'libmysqlclient-dev': ensure => present, require  => Exec['apt-get update'] }
package { 'sqlite3'           : ensure => present, require  => Exec['apt-get update'] }
package { 'libsqlite3-dev'    : ensure => present, require  => Exec['apt-get update'] }
package { 'bundler'           : ensure => present, provider => 'gem', require => Package['ruby1.9.3'] }

# Install Git and AppFog tooling
package { 'git': ensure => present, require  => Exec['apt-get update'] }
package { 'af' : ensure => present, provider => 'gem', require => Package['ruby1.9.3'] }

# Allow gem to run as normal user
file { '/var/lib/gems' : ensure => 'directory', owner => 'vagrant', require => Package['ruby1.9.3'] }
file { '/usr/local/bin': ensure => 'directory', owner => 'vagrant', require => Package['ruby1.9.3'] }
