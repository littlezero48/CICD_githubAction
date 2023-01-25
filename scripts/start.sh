#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILENAME=$(ls -tr $PROJECT_ROOT/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_FILEPATH="$PROJECT_ROOT/build/libs/$JAR_FILENAME"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# jar 파일 실행
echo "$TIME_NOW > $JAR_FILENAME 파일 실행" >> $DEPLOY_LOG
nohup java -jar $JAR_FILEPATH > $APP_LOG 2> $ERROR_LOG &                          # 계속 실행되게 nohup으로 실행

CURRENT_PID=$(ps -ef | grep "$JAR_FILENAME" | grep -v 'grep' | awk '{print $2}')  # nohup이 진행되고 나서야 프로세스 아이디를 얻기 가능
echo "$TIME_NOW > 실행된 프로세스 아이디 : $CURRENT_PID" >> $DEPLOY_LOG