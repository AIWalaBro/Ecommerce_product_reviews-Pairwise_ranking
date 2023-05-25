FROM python:3.10

COPY Requirements.txt .

RUN pip install -U spacy

RUN python -m spacy download en_core_web_sm

RUN pip install -r Requirements.txt

COPY . .

EXPOSE 5000
# EXPOSE $PORT

CMD gunicorn --workers=2 --bind 0.0.0.0:5000 app:app

