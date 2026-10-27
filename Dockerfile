FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt \
    && useradd --create-home --uid 10001 app

COPY --chown=app:app app.py ./

USER app
EXPOSE 8004
CMD ["gunicorn", "--bind", "0.0.0.0:8004", "--workers", "2", "--access-logfile", "-", "app:app"]
