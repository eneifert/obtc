set :application, "obtc"
set :repository,  "eric.neifert@gmail.com:eneifert/obtc.git"

set :scm, :git
set :deploy_to, '/home/eneifert/webapps/obtc/obtc'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :web, "eneifert.webfactional.com"
role :app, "eneifert.webfactional.com"
role :db,  "eneifert.webfactional.com", :primary => true

set :user, "eneifert"
set :scm_username, "eneifert"
set :use_sudo, false
default_run_options[:pty] = true

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end