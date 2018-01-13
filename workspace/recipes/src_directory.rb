include_recipe 'workspace::volume'

persistent_src_directory = ::File.join(node['workspace']['volume']['mount_point'], 'src')

directory persistent_src_directory do
  owner node['workspace']['user']
  recursive true
end

link node['workspace']['src_directory'] do
  to persistent_src_directory
  owner node['workspace']['user']
end
