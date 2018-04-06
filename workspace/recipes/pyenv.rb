if platform?('ubuntu')
  # Ensure packages required by Python are present in the cache.
  include_recipe 'apt'
end

pyenv_user_install node['workspace']['user']
