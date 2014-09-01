#
# Cookbook Name:: dop_datadog
# Recipe:: nginx
#

cookbook_file "#{node['datadog']['checks_dir']}/nginx.py" do
  source 'datadog_nginx.py'
  cookbook 'dop_datadog'
  owner 'root'
  group 'root'
  mode 0644
end
