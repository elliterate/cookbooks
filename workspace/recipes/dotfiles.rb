require 'fileutils'

home_dir = ::File.join('/', 'home', node['workspace']['user'])
cache_dir = ::File.join(home_dir, '.cache')

directory cache_dir do
  user node['workspace']['user']
  recursive true
  mode '0755'
end

dotfiles_dir = ::File.join(cache_dir, 'dotfiles')

git dotfiles_dir do
  repository node['workspace']['dotfiles']['git_url']
  revision node['workspace']['dotfiles']['git_ref'] || 'HEAD'
  user node['workspace']['user']
  action :sync
end

dotfiles = Dir[::File.join(dotfiles_dir, '.[^.]*')]

# Exclude version control files.
dotfiles.reject! { |dotfile| File.basename(dotfile) == '.git' }

dotfiles.each do |dotfile|
  FileUtils.cp_r(dotfile, home_dir)
end
