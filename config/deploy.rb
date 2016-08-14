lock '3.5.0'

set :application, 'ieltscollege'
set :repo_url, 'git@gitlab.puresolutions.international:ruby/ieltscollege.git'
set :rbenv_ruby, '2.2.0'
set :deploy_to, '/home/sofa/ieltscollege'

set :scm, :git
set :pty, true
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :keep_releases, 5

namespace :deploy do
  after :restart, :'passenger:restart'
end