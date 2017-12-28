directory node['workspace']['src_directory'] do
  user node['workspace']['user']
  recursive true
  mode 0755
end
