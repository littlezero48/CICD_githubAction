#!/usr/bin/env bash
# #!은 명령어 집합표시, 뒤는 이 명령어들을 해석할 프로그램 위치와 프로그램

#-------------------------------------------------- 변수 선언 START
PROJECT_ROOT="/home/ubuntu/app"                                             # 종료할 jar파일 위치
#JAR_FILE=$(ls $PROJECT_ROOT/*SNAPSHOT.jar | tail -n 1)    # tail은 그냥 실시간 로그 찍기 위해 추적
JAR_FILE="$PROJECT_ROOT/CICD_githubActions-0.0.1-SNAPSHOT.jar"

DEPLOY_LOG="$PROJECT_ROOT/deploy.log"                                       # 로그파일 생성

TIME_NOW=$(date +%c)                                                        # 현재시간

# 현재 구동 중인 애플리케이션 pid 확인
CURRENT_PID=$(pgrep -f $JAR_FILE)
#-------------------------------------------------- 변수 선언 END

#-------------------------------------------------- 명령어 START
# 프로세스가 켜져 있으면 종료
if [ -z $CURRENT_PID ]; then
  # 리눅스에서 > 와 >> 의 차이 : > (뒤에 나오는 파일에 write or overwrite), >> (뒤에 나오는 파일에 추가 append)
  echo "$TIME_NOW > 현재 실행중인 애플리케이션이 없습니다" >> $DEPLOY_LOG         # 리눅스 터미널 출력 명령어
else
  echo "$TIME_NOW > 실행중인 $CURRENT_PID 애플리케이션 종료 " >> $DEPLOY_LOG
  kill -15 $CURRENT_PID                                                     # -15 프로세스를 안전하게 종료
fi

