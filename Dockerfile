FROM python:3
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
CMD [ "--bind", "0.0.0.0:$PORT", "app:app"]
