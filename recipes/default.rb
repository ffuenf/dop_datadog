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