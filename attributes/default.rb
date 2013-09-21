# # # # # #
# default #
# # # # # #
default['datadog']['databag'] = Chef::EncryptedDataBagItem.load("dop_datadog", "default")

default['datadog']['agent_version'] = "3.9.0-90"

default['datadog']['api_key'] = node['datadog']['databag']['api_key']
default['datadog']['application_key'] = node['datadog']['databag']['application_key']
default['datadog']['tags'] = []
default['datadog']['notify'] = []

default['datadog']['redis']['host'] = node['datadog']['databag']['redis']['host']
default['datadog']['redis']['port'] = node['datadog']['databag']['redis']['port']

default['datadog']['mysql']['server'] = node['datadog']['databag']['mysql']['server']
default['datadog']['mysql']['port'] = node['datadog']['databag']['mysql']['port']
default['datadog']['mysql']['user'] = node['datadog']['databag']['mysql']['user']
default['datadog']['mysql']['password'] = node['datadog']['databag']['mysql']['password']

default['datadog']['pagespeed']['user'] = node['datadog']['databag']['pagespeed']['user']
default['datadog']['pagespeed']['password'] = node['datadog']['databag']['pagespeed']['password']

default['datadog']['php']['user'] = node['datadog']['databag']['php']['user']
default['datadog']['php']['password'] = node['datadog']['databag']['php']['password']

default['datadog']['php']['ping']['user'] = node['datadog']['databag']['php']['user']
default['datadog']['php']['ping']['password'] = node['datadog']['databag']['php']['password']