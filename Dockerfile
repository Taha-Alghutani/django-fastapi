FROM python:3.11-slim

# تعيين متغيرات البيئة
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# تثبيت الأدوات المطلوبة
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app/

# جمع ملفات static (اختياري حسب المشروع)
# RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "test_fastapi.wsgi:application", "--bind", "0.0.0.0:8000"]
