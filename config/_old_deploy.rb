# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'obtc'

set :scm, :git
set :user, "eneifert"
set :repo_url, 'eric.neifert@gmail.com:eneifert/obtc.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/eneifert/webapps/obtc/obtc'
role :web, "eneifert.webfactional.com"
role :app, "eneifert.webfactional.com"
role :db,  "eneifert.webfactional.com", :primary => true

set :user, "eneifert"
set :scm_username, "eneifert"
set :use_sudo, false 
# default_run_options[:pty] = true

# Default value for :scm is :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end

  # after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

end
