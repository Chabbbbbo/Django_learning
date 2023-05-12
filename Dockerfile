FROM python:3.11.1

# ensures that the python output 
# i.e. the stdout and stderr streams are sent straight to terminal 
ENV PYTHONUNBUFFERED 1 
# 에러 바로바로 보낸다...?

ARG DEV=false

# 로컬머신의 file 을 도커안 /app/에 넣겠다~는 의미
COPY requirements.txt /app/
COPY requirements.dev.txt /app/
COPY app /app/

# 이미지 안에 명령어 시작 dir -> 나머지 코드는 다 WORKDIR에서 돌아감
WORKDIR /app
RUN pip install -r requirements.txt

# install this only if it is dev mode
RUN if [ $DEV = true ]; then pip install -r requirements.dev.txt; fi

# 도커안에 8000 포트를 랩탑과 커뮤니케이션 하겠다는 것
EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app.wsgi"]
