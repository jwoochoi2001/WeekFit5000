# Week Fit 5000 
2011083 최정우


1. 개발 목적

* 다이어트를 하면서 음식의 kcal는 체크 하면서, 자신이 운동으로 소모한 kcal 양은 체크 하지 않은 경우가 많음

* 다이어트를 하는 사람들에게 자신의 한 운동의 칼로리 양을 제공
  
* 5000 kcal 이라는 수치화된 목표를 정해줌으로써 다이어트 성공을 도움

* 자신의 활동 칼로리 소모량을 누적으로 제공

왜 하필 5000 kcal 인가?
- 다이어트를 진행 시 권장하는 kcal 활동 소모량이 남성 800 kcal, 여성 650 kcal
- 일주일씩 나눠서 기록하는 진행하는 다이어트는 매우 효율적
- 일주일로 환산 했을때 가장 가까운 값이 5000 kcal 이며, 남성과 여성 모두에게 매우 적절한 권장량


2. 어플의 기능
* 자신의 현재 체중과 목표 체중을 UI에 표시하여 동기부여 유발
* 자신의 운동시간과 해당 운동의 칼로리를 계산하여 소모한 칼로리 총 양을 계산
* 자신이 누적으로 소모한 칼로리 양을 누적하여 기록 

3. 어플의 내용 및 구성

## 3.1 [어플의 아이콘]

<img width="150" height="150" alt="Week_Fit_jpg" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/85e979f7-47b9-4f46-ae81-fb9f4eb9aefc">

[어플의 아이콘]

* Week Fit 5000

* Week (1주일) + FIt (건강한 사람) + 5000 (kcal)

* '일주일 동안 5000 칼로리 이상을 운동하는 건강한 사람'이라는 의미 

## 3.1 [첫화면]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 04 40" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/7e6bddd6-2e04-4045-aee0-56028bd5016a">

* 값을 출력 받는 [목표 체중], [현재 체중], [연령], [성별], [오늘 소비량] 이라는 UI들이 존재

* [오늘 소비량] 값을 0으로 초기화 시키는 [초기화] 버튼 존재

* [정보 입력] 다이얼로그를 출력 시키는 [내 정보 입력] 버튼 존재

* 입력창으로 이동하는 [입력 하기], 기록지로 이동하는 [나의 기록] 버튼들이 존재 

## 3.1 [정보 입력] 다이얼로그 

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 03 54" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/285890bd-c34e-4041-9401-b7a0fd9e4033">

* [목표 체중], [현재 체중], [나이]의 값을 받는 Text Field들이 존재

* [성별]을 선택하는 세그먼트 컨트롤이 존재

* [저장] 버튼 클릭 시 다이얼로그 값 출력

* [뒤로 가기] 버튼 클릭 시 다이얼로그 즉시 종료

## 3.2 다이얼로그 TextField 공백 시 경고 

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 05 09" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/4fb9556c-a5bf-44a5-bb63-9949912e85ed">
<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 05 50" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/fa6e615f-8d8e-4827-8e9a-ad25cb7b74e8">
<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 06 11" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/9a7a459b-0f01-4dba-8652-b0e14348ffb3">

* TextField 공백 입력 후 [저장] 버튼 클릭 시 "(공백 TextField) 를 입력하세요. "라는 경고 출력

## 3.2 다이얼로그 TextField 문자 입력 시 경고 

<img  width="200" height="300" alt="스크린샷 2024-06-16 오후 4 10 08" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/64c478a2-e744-4b72-bd82-ca54dde1ca19">

* "잘못된 입력입니다. 숫자를 입력하세요."라는 결고 출력









