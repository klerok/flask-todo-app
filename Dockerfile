FROM python:2.7-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir "Werkzeug==0.16.1" "SQLAlchemy==1.0.19"

COPY . .

EXPOSE 7345

CMD ["sh", "-c", "python manage.py db upgrade && python manage.py runserver --host 0.0.0.0 --port 7345"]
