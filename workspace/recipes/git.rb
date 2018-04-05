include_recipe 'git'

home_dir = ::File.join('/', 'home', node['workspace']['user'])
user_config_overrides_path = ::File.join(home_dir, '.gitconfig')

file user_config_overrides_path do
  owner node['workspace']['user']
end

user = data_bag_item('users', node['workspace']['user'])
comment = user['comment']

name, _, _, _, email = comment.split(',')

git_config 'user.name' do
  value name
end

git_config 'user.email' do
  value email
end
