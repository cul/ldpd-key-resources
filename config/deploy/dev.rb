server 'all-nginx-dev1.cul.columbia.edu', user: fetch(:remote_user), roles: %w(app db web)
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
