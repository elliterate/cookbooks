action :create do
  script_name = ::File.basename(new_resource.source)
  home_dir = ::File.join('/', 'home', node['workspace']['user'])
  bash_it_custom_dir = ::File.join(home_dir, '.bash_it', 'custom')

  template ::File.expand_path(script_name, bash_it_custom_dir) do
    source new_resource.source
    owner node['workspace']['user']
    variables new_resource.variables
    only_if { script_name =~ /\.bash$/ && ::File.directory?(bash_it_custom_dir) }
    cookbook new_resource.cookbook
  end
end
