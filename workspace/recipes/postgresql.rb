postgresql_client_install 'client'

postgresql_server_install 'server'

postgresql_user node['workspace']['user'] do
  user node['workspace']['user']
  superuser true
end

postgresql_access node['workspace']['user'] do
  access_type 'local'
  access_db 'all'
  access_user node['workspace']['user']
  access_method 'ident'
end

postgresql_ident node['workspace']['user'] do
  mapname node['workspace']['user']
  system_user node['workspace']['user']
  pg_user node['workspace']['user']
end
