#
# Cookbook Name:: dop_datadog
# Recipe:: mysql
#

package 'python-mysqldb'
database_user = node['datadog']['mysql']['user']
database_password = node['datadog']['mysql']['password']
database_host = node['datadog']['mysql']['server']
database_port = node['datadog']['mysql']['port']
database_connection = {
  host: database_host,
  port: database_port,
  username: 'root',
  password: node['mysql']['server_root_password']
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
  host database_host
  privileges ['REPLICATION CLIENT']
  action :grant
end

template "#{node['datadog']['conf_dir']}/mysql.yaml" do
  owner 'root'
  group 'root'
  mode 0644
  source 'datadog.mysql.yaml.erb'
  cookbook 'dop_datadog'
  variables(
    datadog: node['datadog']
  )
end
