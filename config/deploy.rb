# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'obtc'
set :repo_url, 'https://eneifertdev1:usedforreleasingsoftware@github.com/eneifert/obtc.git'
set :deploy_to, '/home/eneifert/webapps'


role :web, "eneifert@wf-178-79-142-229.webfaction.com"
role :app, "eneifert@wf-178-79-142-229.webfaction.com"
role :db,  "eneifert@wf-178-79-142-229.webfaction.com", :primary => true 

namespace :webfaction do 

	task :deploy do 
		on roles(:app) do

			item = {dir: "obtc2", env: "production"}
			tmp_deploy_to = "#{deploy_to}/#{item[:dir]}"
			tmp_full_app_path = "#{tmp_deploy_to}/obtc"

			# set up the path variables
			env_var_cmd = "cd #{tmp_deploy_to} && export PATH=$PWD/bin:$PATH && export GEM_HOME=$PWD/gems && export RUBYLIB=$PWD/lib &&"	      	      

			# pull the code and get rid of any changes						
			execute "cd #{tmp_full_app_path} && git config --global user.email \"eneifertdev1@gmail.com\""
			execute "cd #{tmp_full_app_path} && git config --global user.name \"Eneifert Dev 1\""
			# execute "cd #{tmp_full_app_path} && git stash save --keep-index"
			# execute "cd #{tmp_full_app_path} && git stash drop"
			execute "cd #{tmp_full_app_path} && git pull #{repo_url}"

			# update the gems
			execute "#{env_var_cmd} cd #{tmp_full_app_path} && bundle install"

			# migrate the db
			execute "#{env_var_cmd} cd #{tmp_full_app_path} && rake db:migrate RAILS_ENV=#{item[:env]}"
			execute "#{env_var_cmd} cd #{tmp_full_app_path} && rake db:seed RAILS_ENV=#{item[:env]}"			

			# bundle the assets
			execute "#{env_var_cmd} cd #{tmp_full_app_path} && RAILS_ENV=#{item[:env]} bundle exec rake assets:precompile"

			# restart the server
			execute "$HOME/webapps/#{item[:dir]}/nginx/sbin/nginx -p $HOME/webapps/#{item[:dir]}/nginx/ -s reload"
			
	    end		
	end

end

namespace :deploy do

  puts "============================================="
  puts "SIT BACK AND RELAX WHILE CAPISTRANO ROCKS ON"
                                                                                                                                                                                                                                                                                                                             
  puts "============================================="

end