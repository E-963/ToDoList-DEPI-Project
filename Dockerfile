FROM python:3-alpine

WORKDIR /app

COPY . .
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN addgroup -S app && adduser -S app -G app && chown -R app:app .

USER app

EXPOSE 3000

CMD [ "gunicorn" ,"--bind", "0.0.0.0:3000", "wsgi"]
