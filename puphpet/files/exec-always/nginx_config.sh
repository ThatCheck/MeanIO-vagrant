# config nginx for mean
rm -v /etc/nginx/sites-available/*
rm -v /etc/nginx/sites-enabled/*
cp -v '/vagrant/puphpet/files/misc/nginx/nginx_config.config' '/etc/nginx/sites-available/mean.dev.conf'
cp -v '/vagrant/puphpet/files/misc/nginx/nginx_config.config' '/etc/nginx/sites-enabled/mean.dev.conf'
service nginx restart