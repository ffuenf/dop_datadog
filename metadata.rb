maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache 2.0'
description 'installs/configures dop_datadog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name 'dop_datadog'
version '1.2.7'

%w(debian, ubuntu).each do |os|
  supports os
end

depends 'datadog', '>= 2.1.0'
