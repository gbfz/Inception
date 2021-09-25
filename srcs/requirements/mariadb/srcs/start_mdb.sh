# Start mysql server without giving it control of tty
mysqld -u root &

# Wait for mysql server to start
echo "Starting mysql database..."; sleep 5

# Create database if it doesn't exist
echo "create database if not exists ${WP_BASE};" | mysql -u root --skip-password

# Manage users with root access
echo "create user if not exists 'root'@'%' identified by '${SQL_R_PASS}'; grant all privileges on *.* to 'root'@'%'; flush privileges;" | mysql -u root --skip-password

echo "alter user 'root'@'localhost' identified by '${SQL_R_PASS}'; grant all privileges on *.* to 'root'@'localhost'; flush privileges;" | mysql -u root --skip-password
# ^^^

# Create 'ordinary' users with access to wordpress db
echo "create user if not exists '${SQL_USER}'@'%' identified by '${SQL_PASS}'; grant all privileges on ${WP_BASE}.* to '${SQL_USER}'@'%'; flush privileges;" | mysql -u root --password=${SQL_R_PASS}

echo "create user if not exists '${SQL_USER}'@'localhost' identified by '${SQL_PASS}'; grant all privileges on ${WP_BASE}.* to '${SQL_USER}'@'localhost'; flush privileges;" | mysql -u root --password=${SQL_R_PASS}
# ^^^

# Delete anonymous users
echo "delete from mysql.user where user=''; flush privileges;" | mysql -u root --password=${SQL_R_PASS}

# Delete test database
echo "drop database if exists test;" | mysql -u root --password=${SQL_R_PASS}

# :)
echo "Done starting mysql database!"
