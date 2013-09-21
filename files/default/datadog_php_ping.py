import re
import urllib2
import base64

from util import headers
from checks import AgentCheck

class PhpPing(AgentCheck):
    """Monitors php-fpm status via ping-url

    Requires php-fpm pools to have the status option.
    See http://www.php.net/manual/de/install.fpm.configuration.php#ping.path for more details

    """

    def __init__(self, name, init_config, agentConfig, instances=None):
        AgentCheck.__init__(self, name, init_config, agentConfig, instances)
        self.assumed_url = {}

    def check(self, instance):
        if 'php_ping_url' not in instance:
            raise Exception('php instance missing "php_ping_url" value.')

        url = self.assumed_url.get(instance['php_ping_url'], instance['php_ping_url'])

        tags = instance.get('tags', [])

        req = urllib2.Request(url, None,
            headers(self.agentConfig))
        if 'php_ping_user' in instance and 'php_ping_password' in instance:
            auth_str = '%s:%s' % (instance['php_ping_user'], instance['php_ping_password'])
            encoded_auth_str = base64.encodestring(auth_str)
            req.add_header("Authorization", "Basic %s" % encoded_auth_str)
        request = urllib2.urlopen(req)
        response = request.read()
        
        metric_count = 0
        parsed = re.search(r'pong', response)
        if parsed:
            metric_count += 1
            self.gauge("php.ping", 1, tags=tags)

        if metric_count == 0:
            if self.assumed_url.get(instance['php_ping_url'], None) is None and url[-5:] != '?auto':
                self.assumed_url[instance['php_ping_url']]= '%s?auto' % url
                self.warning("Assuming url was not correct. Trying to add ?auto suffix to the url")
                self.check(instance)
            else:
                raise Exception("No metrics were fetched for this instance. Make sure that %s is the proper url." % instance['php_ping_url'])

    @staticmethod
    def parse_agent_config(agentConfig):
        if not agentConfig.get('php_ping_url'):
            return False

        return {
            'instances': [{'php_ping_url': agentConfig.get('php_ping_url')}]
        }