include_recipe 'vim'

node['vim-config']['user_installs'].each do |vim_user|
  home_dir = ::File.join('/', 'home', vim_user['user'])
  config_dir = ::File.join(home_dir, '.vim')

  git config_dir do
    repository node['vim-config']['git_url']
    revision node['vim-config']['git_ref']
    user vim_user['user']
    enable_submodules true
    action :sync
  end

  link "#{home_dir}/.vimrc" do
    to "#{config_dir}/vimrc"
  end
end
