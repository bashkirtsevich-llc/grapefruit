FROM python:3.6.3

WORKDIR /usr/src/app
RUN git clone https://github.com/bashkirtsevich/grapefruit-crawler.git .
RUN pip install -r requirements.txt

CMD [ "python", "./app.py" ]
