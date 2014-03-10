#
# Cookbook Name:: dop_datadog
# Recipe:: varnish
#

template "#{node['datadog']['conf_dir']}/varnish.yaml" do
  owner "root"
  group "root"
  mode 0644
  source "datadog.varnish.yaml.erb"
  cookbook "dop_datadog"
  variables({
    :datadog => node['datadog']
  })
end