# # # # #
# mysql #
# # # # #
default['datadog']['mysql']['server'] = 'localhost'
default['datadog']['mysql']['port'] = 3306
default['datadog']['mysql']['user'] = node['datadog']['databag']['mysql']['user']
default['datadog']['mysql']['password'] = node['datadog']['databag']['mysql']['password']
