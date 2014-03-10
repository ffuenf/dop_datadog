#
# Cookbook Name:: dop_datadog
# Recipe:: php
#

cookbook_file "#{node['datadog']['checks_dir']}/php.py" do
  source "datadog_php.py"
  cookbook "dop_datadog"
  owner "root"
  group "root"
  mode 0644
end
cookbook_file "#{node['datadog']['checks_dir']}/php_ping.py" do
  source "datadog_php_ping.py"
  cookbook "dop_datadog"
  owner "root"
  group "root"
  mode 0644
end