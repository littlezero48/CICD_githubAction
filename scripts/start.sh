#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
# PROJECT_ROOT에 build/libs에서 SNAPSHOT.jar 이름 들어가는 파일의 풀네임을 검색
# tail은 그냥 실시간 로그 찍기 위해 추적
JAR_FILENAME=$(ls -tr $PROJECT_ROOT/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1) # jar파일명만 조회해 변수값으로 저장
JAR_FILEPATH="$PROJECT_ROOT/build/libs/$JAR_FILENAME"                              # 경로를 포함한 파일명을 변수값으로 저장

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# jar 파일 실행
echo "$TIME_NOW > $JAR_FILENAME 파일 실행" >> $DEPLOY_LOG
nohup java -jar $JAR_FILEPATH > $APP_LOG 2> $ERROR_LOG &                          # 계속 실행되게 nohup으로 실행

CURRENT_PID=$(ps -ef | grep "$JAR_FILENAME" | grep -v 'grep' | awk '{print $2}')                                           # nohup으로 실행 후 프로세스 아이디를 얻음
echo "$TIME_NOW > 실행된 프로세스 아이디 : $CURRENT_PID" >> $DEPLOY_LOG