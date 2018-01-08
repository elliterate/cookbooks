if platform?('ubuntu')
  include_recipe 'apt'
end

users_manage node['workspace']['user']

include_recipe 'pyenv::user'
include_recipe 'rbenv::user'
include_recipe 'vim::config'
include_recipe 'workspace::bash_it'
include_recipe 'workspace::dotfiles'
include_recipe 'workspace::projects'
