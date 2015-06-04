# config nginx for mean
rm -r /etc/nginx/sites-available/*
rm -r /etc/nginx/sites-enabled/*
cp -v '/vagrant/puphpet/files/misc/nginx/nginx_config.conf' '/etc/nginx/sites-available/mean.dev.conf'
cp -v '/vagrant/puphpet/files/misc/nginx/nginx_config.conf' '/etc/nginx/sites-enabled/mean.dev.conf'
service nginx restart