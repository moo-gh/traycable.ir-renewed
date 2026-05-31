### www.traycable.ir
#### powered by wordpress


#### For taking backup

```bash
mkdir -p ~/backups/traycable-$(date +%F)
```

```bash
docker exec traycable_mysql mysqldump \
  -u "$(grep DB_USER .env | cut -d= -f2)" \
  -p"$(grep DB_PASSWORD .env | cut -d= -f2)" \
  "$(grep DB_NAME .env | cut -d= -f2)" \
  > ~/backups/traycable-$(date +%F)/database.sql

tar -czf ~/backups/traycable-$(date +%F)/wordpress-files.tar.gz \
  -C /var/www/traycable.ir .
```

#### For checking versions

Run on the server from `/var/www/traycable.ir`:

```bash
grep wp_version /var/www/traycable.ir/wp-includes/version.php
grep "Version:" /var/www/traycable.ir/wp-content/themes/karauos/style.css | head -1
grep "Version:" /var/www/traycable.ir/wp-content/plugins/elementor/elementor.php
grep "Version:" /var/www/traycable.ir/wp-content/plugins/elementor-pro/elementor-pro.php
```

Check PHP and ionCube inside the container:

```bash
docker exec traycable_app php -v
docker exec traycable_app php -v | grep -i ioncube
```
