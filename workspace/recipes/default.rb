users_manage node['workspace']['user']

include_recipe 'pyenv::user'
include_recipe 'rbenv::user'
include_recipe 'vim::config'
