#
# Cookbook Name:: dop_datadog
# Recipe:: default
#

include_recipe "datadog::dd-agent"
include_recipe "datadog::dd-handler"
include_recipe "datadog::dogstatsd-ruby"