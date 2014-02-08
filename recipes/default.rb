#
# Cookbook Name:: dop_datadog
# Recipe:: default
#

directory node['datadog']['conf_dir'] do
  recursive true
  action :create
end

include_recipe "datadog::dd-agent"
include_recipe "datadog::dd-handler"
include_recipe "datadog::dogstatsd-ruby"

logrotate_app "datadog" do
  cookbook "logrotate"
  path "#{node["datadog"]["log_dir"]}/*.log"
  frequency "daily"
  rotate 2
  options ["missingok", "compress", "delaycompress", "notifempty", "sharedscripts"]
  create "640 dd-agent adm"
end