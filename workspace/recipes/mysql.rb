mysql_client 'default'

mysql_service 'default' do
  initial_root_password 'ilikerandompasswords'
  action [:create, :start]
end

execute 'remove root mysql user password' do
  command "mysqladmin -h127.0.0.1 -uroot -pilikerandompasswords password '' || true"
end
