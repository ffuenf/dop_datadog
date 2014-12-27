# # # # #
# nginx #
# # # # #
default['datadog']['nginx']['status_url'] = 'http://example.com/nginx_status/'
default['datadog']['nginx']['user'] = node['datadog']['databag']['nginx']['user']
default['datadog']['nginx']['password'] = node['datadog']['databag']['nginx']['password']
