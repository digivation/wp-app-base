# Customize this file, and then rename it to config.rb

set :application, "website.name"
set :repository,  "git@git:/repo/path"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# good for those password protected SSH keys
set :ssh_options, { :forward_agent => true }

# Using Git Submodules?
set :git_enable_submodules, 1

# This should be the same as :deploy_to in production.rb
set :production_deploy_to, '/srv/www/website.name'

# The domain name used for your staging environment
set :staging_domain, 'staging.website.name'

# Database
# Set the values for host, user, pass, and name for both production and staging.
set :wpdb do
	{
		:production => {
			:host     => 'localhost',
			:user     => 'PRODUCTION DB USER',
			:password => 'PRODUCTION DB PASSWORD',
			:name     => 'PRODUCTION DB DATABASE',
		},
		:staging => {
			:host     => 'localhost',
			:user     => 'STAGING DB USER',
			:password => 'STAGING DB PASSWORD',
			:name     => 'STAGING DB DATABASE',
		}
	}
end

# You're not done! You must also configure production.rb and staging.rb
