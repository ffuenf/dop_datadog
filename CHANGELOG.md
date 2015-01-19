# CHANGELOG for dop_datadog

This file is used to list changes made in each version of dop_datadog.

## 1.2.4 (January 19, 2015)

* add database port
* update test-suite

## 1.2.3 (December 27, 2014)

* remove nginx (use from standard cookbook)
* update testsuite

## 1.2.2 (December 12, 2014)

* add proper host to mysql user

## 1.2.1 (November 28, 2014)

* add password protected nginx status page config
* refactor password protection in general (also to match dop structure)
* add pagespeed template

## 1.2.0 (November 27, 2014)

* move host/port of redis/mysql out of databag

## 1.1.0 (September 2, 2014)

* update/integrate testsuites: test-kitchen, foodcritic, rubocop, travis-ci

## 1.0.5 (July 23, 2014)

* fix php_ping check
* fix php_status check
* fix pagespeed check
* fix nginx check

## 1.0.4 (July 14, 2014)

* update datadog-agent version

## 1.0.3 (March 10, 2013)

* fix checks.d dir attribute
* pin cookbook files to dop_datadog cookbook

## 1.0.2 (February 8, 2013)

* update datadog-agent version
* include logrotate

## 1.0.1 (October 6, 2013)

* modularized recipes

## 1.0.0  (September 21, 2013)

* Initial release of dop_datadog