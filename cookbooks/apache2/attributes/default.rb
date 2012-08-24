#
# Cookbook Name:: apache2
# Attributes:: apache
#
# Some of below is borrowed from the opscode apache2 cookbook
# but in general I didn't like that they switched from the centos/redhat
# way to the ubuntu way of managing apache
#
# Copyright 2011, E Camden Fisher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Where the various parts of apache are
case platform
  when "redhat","centos","fedora","suse"
    set[:apache][:dir]        = "/etc/httpd"
    set[:apache][:log_dir]    = "/var/log/httpd"
    set[:apache][:user]       = "apache"
    set[:apache][:binary]     = "/usr/sbin/httpd"
    set[:apache][:icondir]    = "/var/www/icons/"
    set[:apache][:cache_dir]  = "/var/cache/httpd"
    set[:apache][:pidfile]    = "/var/run/httpd.pid"
  when "debian","ubuntu"
    set[:apache][:dir]        = "/etc/apache2"
    set[:apache][:log_dir]    = "/var/log/apache2"
    set[:apache][:user]       = "www-data"
    set[:apache][:binary]     = "/usr/sbin/apache2"
    set[:apache][:icondir]    = "/usr/share/apache2/icons"
    set[:apache][:cache_dir]  = "/var/cache/apache2"
    set[:apache][:pidfile]    = "/var/run/apache2.pid"
  when "arch"
    set[:apache][:dir]        = "/etc/httpd"
    set[:apache][:log_dir]    = "/var/log/httpd"
    set[:apache][:user]       = "http"
    set[:apache][:binary]     = "/usr/sbin/httpd"
    set[:apache][:icondir]    = "/usr/share/httpd/icons"
    set[:apache][:cache_dir]  = "/var/cache/httpd"
    set[:apache][:pidfile]    ="/var/run/httpd/httpd.pid"
  else
    set[:apache][:dir]        = "/etc/apache2"
    set[:apache][:log_dir]    = "/var/log/apache2"
    set[:apache][:user]       = "www-data"
    set[:apache][:binary]     = "/usr/sbin/apache2"
    set[:apache][:icondir]    = "/usr/share/apache2/icons"
    set[:apache][:cache_dir]  = "/var/cache/apache2"
    set[:apache][:pidfile]    = "logs/httpd.pid"
end

###
# These settings need the unless, since we want them to be tunable,
# and we don't want to override the tunings.
###

# General settings
default[:apache][:listen_ports] = [ "80" ]
default[:apache][:ssl_ports] = [ "443" ]
default[:apache][:contact] = "root"
default[:apache][:timeout] = 300
default[:apache][:keepalive] = "On"
default[:apache][:keepaliverequests] = 100
default[:apache][:keepalivetimeout] = 5
default[:apache][:namevhost] = "On"
default[:apache][:namevhosts] = [ "127.0.0.1:80", "*:80" ]

# Security
default[:apache][:servertokens] = "Prod"
default[:apache][:serversignature] = "On"
default[:apache][:traceenable] = "On"
default[:apache][:serverstatus] = "On"
default[:apache][:serverinfo] = "Off"

# Prefork Attributes
default[:apache][:prefork][:startservers] = 5
default[:apache][:prefork][:minspareservers] = 5
default[:apache][:prefork][:maxspareservers] = 10
default[:apache][:prefork][:serverlimit] = 20
default[:apache][:prefork][:maxclients] = 20
default[:apache][:prefork][:maxrequestsperchild] = 10000

# Worker Attributes
default[:apache][:worker][:startservers] = 4
default[:apache][:worker][:maxclients] = 1024
default[:apache][:worker][:minsparethreads] = 64
default[:apache][:worker][:maxsparethreads] = 192
default[:apache][:worker][:threadsperchild] = 64
default[:apache][:worker][:maxrequestsperchild] = 0