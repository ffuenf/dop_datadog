#
# Cookbook Name:: dop_datadog
# Recipe:: default
#

include_recipe "datadog::dd-agent"
include_recipe "datadog::dd-handler"
include_recipe "datadog::dogstatsd-ruby"

cookbook_file "#{node['datadog']['checks_dir']}/nginx.py" do
  source "datadog_nginx.py"
  owner "root"
  group "root"
  mode 0644
end
cookbook_file "#{node['datadog']['checks_dir']}/pagespeed.py" do
  source "datadog_pagespeed.py"
  owner "root"
  group "root"
  mode 0644
end
cookbook_file "#{node['datadog']['checks_dir']}/php.py" do
  source "datadog_php.py"
  owner "root"
  group "root"
  mode 0644
end
cookbook_file "#{node['datadog']['checks_dir']}/php_ping.py" do
  source "datadog_php_ping.py"
  owner "root"
  group "root"
  mode 0644
end

#
# global datadog checks
#
package "python-redis"
template "#{node['datadog']['conf_dir']}/redisdb.yaml" do
  owner "root"
  group "root"
  mode 0644
  source "datadog.redisdb.yaml.erb"
  variables({
    :datadog => node['datadog']
  })
end
template "#{node['datadog']['conf_dir']}/varnish.yaml" do
  owner "root"
  group "root"
  mode 0644
  source "datadog.varnish.yaml.erb"
  variables({
    :datadog => node['datadog']
  })
end

package "python-mysqldb"
database_user = node['datadog']['mysql']['user']
database_password = node['datadog']['mysql']['password']
database_host = node['datadog']['mysql']['server']
database_connection = {
  :host => database_host,
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

# create the database user
mysql_database_user database_user do
  connection database_connection
  password database_password
  action :create
end

# grant all privileges to user on database
mysql_database_user database_user do
  connection database_connection
  privileges ["REPLICATION CLIENT"]
  action :grant
end

template "#{node['datadog']['conf_dir']}/mysql.yaml" do
  owner "root"
  group "root"
  mode 0644
  source "datadog.mysql.yaml.erb"
  variables({
    :datadog => node['datadog']
  })
end