#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE=$(ls $PROJECT_ROOT/*SNAPSHOT.jar | tail -n 1)    # tail은 그냥 실시간 로그 찍기 위해 추적

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# build 파일 복사
echo "$TIME_NOW > $JAR_FILE 파일 복사" >> $DEPLOY_LOG
cp $PROJECT_ROOT/build/libs/*.jar $JAR_FILE

# jar 파일 실행
echo "$TIME_NOW > $JAR_FILE 파일 실행" >> $DEPLOY_LOG
nohup java -jar $JAR_FILE > $APP_LOG 2> $ERROR_LOG &                          # 계속 실행되게 nohup으로 실행

CURRENT_PID=$(pgrep -f $JAR_FILE)                                             # nohup으로 실행 후 프로세스 아이디를 얻음
echo "$TIME_NOW > 실행된 프로세스 아이디 : $CURRENT_PID" >> $DEPLOY_LOG