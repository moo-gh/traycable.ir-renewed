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