#
# Cookbook Name:: dop_datadog
# Recipe:: redis
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