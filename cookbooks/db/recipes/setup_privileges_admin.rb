#
# Cookbook Name:: db
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rightscale_marker :begin

DATA_DIR = node[:db][:data_dir]

user = node[:db][:admin][:user]
log "  Adding #{user} with administrator privileges for ALL databases."

db DATA_DIR do
  privilege "administrator"
  privilege_username user
  privilege_password node[:db][:admin][:password]
  privilege_database "*.*"
  action :set_privileges
end

rightscale_marker :end
