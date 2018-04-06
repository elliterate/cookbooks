bash_it_instance node['workspace']['user'] do
  theme node['workspace']['bash-it']['theme']
end

workspace_bash_it_custom_plugin 'custom/aliases.bash'
workspace_bash_it_custom_plugin 'custom/colors.bash'
workspace_bash_it_custom_plugin 'custom/editor.bash'
