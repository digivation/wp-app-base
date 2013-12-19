# Digivation's WordPress Skeleton + WP-Stack Mod

This is a fork+merge of Mark Jaquith's [WordPress Skeleton](https://github.com/markjaquith/WordPress-Skeleton) and [WP-Stack](https://github.com/markjaquith/WP-Stack) projects. Seeing as how Mark's projects have not been updated lately, I have taken his baseline, combined the projects, and made a few modifications. I recently deployed a site running WP v3.8 and this modified skeleton, so things should work properly for modern installs. Please note, my deployments have been WP single-site, with no memcached, running Nginx + PHP-FPM + APC. The plugins under mu-plugins will need to be enabled for Nginx (uncomment the lines as needed).

This project REQUIRES v2.x of Capistrano - will not work on v3.x (yet) - I wasted a few hours learning this.

Don't forget to update wp-config.php with your unique salt values (see the comments in the file).

Modify the config files under /config/ to your needs.

Set up additional submodules to pull in versions of your theme, plugins, etc - or develop with all plugins and theme work in a single repo, as you see fit.

Further questions? Let me know! Pull requests are welcome, improvements would be awesome.

Future modifications? Port to Capistrano v3.x ...

# ORIGINAL README

## Assumptions

* WordPress as a Git submodule in `/wp/`
* Custom content directory in `/content/` (cleaner, and also because it can't be in `/wp/`)
* `wp-config.php` in the root (because it can't be in `/wp/`)
* All writable directories are symlinked to similarly named locations under `/shared/`.

## Questions & Answers

**Q:** Will you accept pull requests?  
**A:** Maybe — if I think the change is useful. I primarily made this for my own use, and thought people might find it useful. If you want to take it in a different direction and make your own customized skeleton, then just maintain your own fork.

**Q:** Why the `/shared/` symlink stuff for uploads?  
**A:** For local development, create `/shared/` (it is ignored by Git), and have the files live there. For production, have your deploy script (Capistrano is my choice) look for symlinks pointing to `/shared/` and repoint them to some outside-the-repo location (like an NFS shared directory or something). This gives you separation between Git-managed code and uploaded files.

**Q:** What version of WordPress does this track?  
**A:** The latest stable release. Send a pull request if I fall behind.

**Q:** What's the deal with `local-config.php`?  
**A:** It is for local development, which might have different MySQL credentials or do things like enable query saving or debug mode. This file is ignored by Git, so it doesn't accidentally get checked in. If the file does not exist (which it shouldn't, in production), then WordPress will used the DB credentials defined in `wp-config.php`.

**Q:** What is `memcached.php`?  
**A:** This is for people using memcached as an object cache backend. It should be something like: `<?php return array( "server01:11211", "server02:11211" ); ?>`. Programattic generation of this file is recommended.

**Q:** Does this support WordPress in multisite mode?  
**A:** It will, starting with WordPress 3.5 (due out in December, 2012). Earlier versions of WordPress don't support Multisite when WordPress is in a subdirectory.
