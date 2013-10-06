#
# Cookbook Name:: dop_datadog
# Recipe:: pagespeed
#

cookbook_file "#{node['datadog']['checks_dir']}/pagespeed.py" do
  source "datadog_pagespeed.py"
  owner "root"
  group "root"
  mode 0644
end