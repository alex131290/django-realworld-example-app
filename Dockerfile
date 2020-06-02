FROM python:3.5.7
ENV PYTHONUNBUFFERED 1
ENV DRF_DEBUG_MODE False
ENV DRF_ALLOWED_HOSTS *
WORKDIR /app
COPY requirements.txt .
# RUN mkdir databases
# RUN echo '/databases' >> .gitignore
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
# RUN python manage.py makemigrations
# RUN python manage.py migrate
# RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@myproject.com', 'Changeme123')" | python manage.py shell
# CMD ["python", "manage.py", "runserver"]
CMD ["./start.sh"]
