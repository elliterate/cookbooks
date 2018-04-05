users_manage node['workspace']['user']

include_recipe 'chef-dk'
include_recipe 'mosh'
include_recipe 'rbenv::user'
include_recipe 'vim::config'
include_recipe 'workspace::bash_it'
include_recipe 'workspace::dotfiles'
include_recipe 'workspace::nodejs'
include_recipe 'workspace::projects'
include_recipe 'workspace::pyenv'
include_recipe 'workspace::selenium'
