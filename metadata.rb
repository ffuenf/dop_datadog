maintainer       "Achim Rosenhagen"
maintainer_email "a.rosenhagen@ffuenf.de"
license          "Apache 2.0"
description      "installs/configures dop_datadog"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             "dop_datadog"
version          "1.0.3"

%w{ debian }.each do |os|
  supports os
end

%w{ 
  dop_base
  datadog
}.each do |ressource|
  depends ressource
end