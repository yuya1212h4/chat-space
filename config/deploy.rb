# config valid only for current version of Capistrano
lock '3.8.0'

# デプロイするアプリケーション名
set :application, 'chat-space'

# cloneするgitのリポジトリ
set :repo_url, 'git@github.com:yuya1212h4/chat-space.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/chat-space"

# シンボリックリンクをはるフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

set :rbenv_type, :user

# rubyのバージョン
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/key_pair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
