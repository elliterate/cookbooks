include_recipe 'rbenv::user_install'

node['rbenv']['user_installs'].each do |vim_user|
  home_dir = ::File.join('/', 'home', vim_user['user'])
  rbenv_dir = ::File.join(home_dir, '.rbenv')

  git rbenv_dir do
    repository node['rbenv']['git_url']
    revision node['rbenv']['git_ref']
    user vim_user['user']
    action :sync
  end

  plugins_dir = ::File.join(rbenv_dir, 'plugins')

  directory plugins_dir do
    user vim_user['user']
    group vim_user['user']
    mode 0755
  end

  ruby_build_dir = ::File.join(plugins_dir, 'ruby-build')

  git ruby_build_dir do
    repository node['ruby-build']['git_url']
    revision node['ruby-build']['git_ref']
    user vim_user['user']
    action :sync
  end
end
