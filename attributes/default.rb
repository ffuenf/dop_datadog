# # # # # #
# default #
# # # # # #
default['datadog']['databag'] = Chef::EncryptedDataBagItem.load("dop_datadog", "default")

default['datadog']['agent_version'] = "1:4.1.0-321"

default['datadog']['api_key'] = node['datadog']['databag']['api_key']
default['datadog']['application_key'] = node['datadog']['databag']['application_key']
default['datadog']['tags'] = []
default['datadog']['notify'] = []
default['datadog']['conf_dir'] = "/etc/dd-agent/conf.d"
default['datadog']['log_dir'] = "/var/log/datadog"

include_attribute "dop_datadog::mysql"
include_attribute "dop_datadog::php"
include_attribute "dop_datadog::pagespeed"
include_attribute "dop_datadog::redis"