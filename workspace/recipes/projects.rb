include_recipe 'workspace::src_directory'

node['workspace']['projects'].each do |project_or_url|
  if project_or_url.is_a?(Hash)
    project = project_or_url
  else
    project = {'git_url' => project_or_url}
  end

  git_url = project.fetch('git_url')
  git_ref = project['git_ref'] || 'HEAD'

  project_name = project['name'] || ::File.basename(git_url, '.git')
  project_dir = ::File.join(node['workspace']['src_directory'], project_name)

  git project_dir do
    repository git_url
    revision git_ref
    user node['workspace']['user']
    action :checkout
  end
end
