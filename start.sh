#!/bin/bash


sed -i "s/DEBUG = True/DEBUG = $DRF_DEBUG_MODE/g" conduit/settings.py
sed -i "s/os\.path\.join(BASE_DIR, 'db\.sqlite3')/os.path.join(BASE_DIR, 'databases', 'db.sqlite3')/g" conduit/settings.py
sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = '$DRF_ALLOWED_HOSTS'.split(',')/g" conduit/settings.py
# Locally it takes time for the DB to be live...
sleep 5
echo "Running python manage.py makemigrations"
python manage.py makemigrations
echo "Running python manage.py migrate"
python manage.py migrate
echo "Creating admin user..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@myproject.com', 'Changeme123')" | python manage.py shell
python manage.py runserver 0.0.0.0:8000