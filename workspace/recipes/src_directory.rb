include_recipe 'workspace::volume'

volume_options = node['workspace']['volume']

if volume_options
  persistent_src_directory = ::File.join(volume_options['mount_point'], 'src')

  directory persistent_src_directory do
    owner node['workspace']['user']
    recursive true
  end

  link node['workspace']['src_directory'] do
    to persistent_src_directory
    owner node['workspace']['user']
  end
else
  directory node['workspace']['src_directory'] do
    owner node['workspace']['user']
    mode 0755
    recursive true
  end
end
