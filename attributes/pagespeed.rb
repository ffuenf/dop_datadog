# # # # # # #
# pagespeed #
# # # # # # #
default['datadog']['pagespeed']['status_url'] = 'http://example.com/ngx_pagespeed_statistics'
default['datadog']['pagespeed']['user'] = node['datadog']['databag']['pagespeed']['user']
default['datadog']['pagespeed']['password'] = node['datadog']['databag']['pagespeed']['password']
