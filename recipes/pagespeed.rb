#
# Cookbook Name:: dop_datadog
# Recipe:: pagespeed
#

cookbook_file "#{node['datadog']['checks_dir']}/pagespeed.py" do
  source 'datadog_pagespeed.py'
  cookbook 'dop_datadog'
  owner 'root'
  group 'root'
  mode 0644
end

template "#{node['datadog']['conf_dir']}/pagespeed.yaml" do
  owner 'root'
  group 'root'
  mode 0644
  source 'datadog.pagespeed.yaml.erb'
  cookbook 'dop_datadog'
  variables(
    datadog: node['datadog']
  )
end
