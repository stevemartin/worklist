require "capistrano-rbenv"
set :application, 'Worklist'
set :repo_url, 'ssh://git@bitbucket.org/damien_m/worklist.git'

set :rbenv_type, :local
set :rbenv_ruby, '2.4.0'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/var/www/workli.st'
set :branch, 'sm-r5-upgrade'

# set :bundle_gemfile, -> { release_path.join('Gemfile') }
# set :bundle_dir, -> { shared_path.join('bundle') }
# set :bundle_flags, '--deployment --quiet'
# set :bundle_without, %w{development test}.join(' ')
# set :bundle_binstubs, -> { shared_path.join('bin') }
# set :bundle_roles, :all
# set :bundle_bins, %w{}

# SSHKit.config.command_map[:rake] = "RAILS_ENV=production source \"/home/deploy/.rvm/environments/ruby-2.0.0-p247@worklist\" && rake"
# SSHKit.config.command_map[:bundle] = "RAILS_ENV=production source \"/home/deploy/.rvm/environments/ruby-2.0.0-p247@worklist\" && bundle"
# before 'deploy', 'install_rvm'

# namespace :db do
#   task :write_config do
#     on roles(:db) do
#       within release_path do
#         execute "cp #{release_path}/config/database.yml.example #{release_path}/config/database.yml"
#       end
#     end
#   end

#   task :migrate do
#     on roles(:all) do
#       within release_path do
#         execute :rake, "db:migrate RAILS_ENV=production"
#       end
#     end
#   end

#   task :create do
#     on roles(:all) do
#       within release_path do
#         execute :rake, "db:create RAILS_ENV=production"
#       end
#     end
#   end

#   task :rollback do
#     on roles(:db) do
#       within release_path do
#         execute :rake, "db:rollback"
#       end
#     end
#   end
# end

# namespace :bundle do
#   task :install do
#     on roles :all do
#       within release_path do
#         execute :bundle, 'install --without test development'
#       end
#     end
#   end
# end


# namespace :deploy do
#   namespace :assets do
#     task :precompile do
#        on roles :all, :except => { :no_release => true } do
#           within release_path do
#             execute :rake, 'assets:precompile'
#           end
#        end
#     end
#   end

#   # before :backup_manifest, 'deploy:assets:create_manifest_json'
#   # task :create_manifest_json do
#   #   on roles :web do
#   #     within release_path do
#   #       execute :mkdir, release_path.join('assets_manifest_backup')
#   #     end
#   #   end
#   # end

#   puma_ctrl = "pumactl -S #{shared_path}/tmp/sockets/puma.state -P #{shared_path}/tmp/pids/"
#   desc 'Start application'
#   task :start do
#     on roles(:app) do
#       within release_path do
#         execute :bundle, "exec #{puma_ctrl} start -d -e production -b 'unix://#{shared_path}/tmp/sockets/puma.sock'"
#       end
#     end
#   end

#   task :stop do
#     on roles(:app) do
#       within release_path do
#         execute :bundle, "exec #{puma_ctrl} stop -e production"
#       end
#     end
#   end

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # binding.pry
#       within release_path do
#         execute :bundle, "exec #{puma_ctrl} restart"
#       end
#     end
#   end

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       within release_path do
#         # execute :rake, 'tmp:cache:clear'
#       end
#     end
#   end


#   after :finishing, 'deploy:cleanup'

# end

# # before 'deploy', 'rvm:install_rvm'
# # before 'deploy', 'rvm:install_ruby'

# after 'deploy:updated', 'db:migrate'
# before 'deploy:updated', 'bundle:install'
# after 'bundle:install', 'deploy:assets:precompile'
# after 'db:migrate', 'deploy:stop', 'deploy:start'
