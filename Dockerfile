FROM python:3.11-alpine
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python", "-m", "flask", "--app", "./main.py", "run"]