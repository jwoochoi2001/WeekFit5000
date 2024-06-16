# Week Fit 5000 
2011083 최정우

https://youtu.be/fgpe13-NIrk 

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

## 3.1 [아이콘]

<img width="150" height="150" alt="Week_Fit_jpg" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/85e979f7-47b9-4f46-ae81-fb9f4eb9aefc">

* Week Fit 5000

* Week (1주일) + FIt (건강한 사람) + 5000 (kcal)

* '일주일 동안 5000 칼로리 이상을 운동하는 건강한 사람'이라는 의미 

## 3.2 [첫화면]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 04 40" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/7e6bddd6-2e04-4045-aee0-56028bd5016a">

* 값을 출력 받는 [목표 체중], [현재 체중], [연령], [성별], [오늘 소비량] 이라는 UI들이 존재

* [오늘 소비량] 값을 0으로 초기화 시키는 초기화 버튼 존재

* [정보 입력] 다이얼로그를 출력 시키는 내 정보 입력 버튼 존재

* [오늘의 운동] 입력창으로 이동하는 입력 하기, [나의 기록] 기록지로 이동하는 나의 기록 버튼들이 존재 

## 3.3 [정보 입력] 다이얼로그 

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 03 54" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/285890bd-c34e-4041-9401-b7a0fd9e4033">

* [목표 체중], [현재 체중], [나이]의 값을 받는 Text Field들이 존재

* [성별]을 선택하는 세그먼트 컨트롤이 존재

* 저장 버튼 클릭 시 다이얼로그 값 출력

* 뒤로 가기 버튼 클릭 시 다이얼로그 즉시 종료

## 3.4 다이얼로그 TextField 공백 시 경고 

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 05 09" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/4fb9556c-a5bf-44a5-bb63-9949912e85ed">
<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 05 50" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/fa6e615f-8d8e-4827-8e9a-ad25cb7b74e8">
<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 06 11" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/9a7a459b-0f01-4dba-8652-b0e14348ffb3">

* TextField 공백 입력 후 저장 버튼 클릭 시 "(공백 TextField) 를 입력하세요. "라는 경고 출력

## 3.5 다이얼로그 TextField 문자 입력 시 경고 

<img  width="200" height="300" alt="스크린샷 2024-06-16 오후 4 10 08" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/64c478a2-e744-4b72-bd82-ca54dde1ca19">

* "잘못된 입력입니다. 숫자를 입력하세요."라는 경고 출력

## 3.6 [오늘의 운동]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 06 51" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/ab50311a-45cb-4d64-b666-71787815c660">

* [첫화면]으로 이동하는 뒤로가기 버튼 존재

* 운동들의 종류를 보여주는 [PickerView]가 존재

* [PickerView] 이동 시 해당 운동과 관련된 ImageView도 같이 변경

* [TextField]에 값을 넣으면 해당 값과 현재 위치 하고 있는 [PickerView] 운동의 칼로리 소모를 계산

* [PickerView] 내용 중 '직접 칼로리 입력'은 몸무게 값과 계산 없이 그 값이 그대로 [오늘 소비량], [나의 kcal 소비량]에 출력 

## 3.7 입력하기 버튼 클릭 시 계산 된 칼로리 값을 [오늘 소비량]에 출력

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 07 48" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/a2ceaf60-1c43-4b72-b117-57cd45d0ae92">

* "고생 많았어요!" 라는 다이얼로그 출력 후 완료 버튼 클릭 시 [첫화면]으로 이동

## 3.8 [오늘의 운동] 다이얼로그에서 [TextField]에 문자값 입력 시 "올바르지 않은 숫자입니다." 경고 출력

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 07 26" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/7f9ce2e3-5132-4888-8ee0-4be88fae51b8">

* 확인 버튼 클릭시 [오늘의 운동] 화면에 유지

## 3.9 [나의 기록]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 10 40" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/16b3ab06-96cd-4759-9580-5a1a1df4c8b9">

* [첫화면]으로 이동하는 뒤로가기 버튼 존재

* [오늘 소비량]에 출력된 값을 저장하는 [나의 kcal 소비량] 존재

* [나의 kcal 소비량]의 값들을 누적으로 저장하는 [총 누적량] 존재

* [기록 삭제] 버튼 존재

* [Finish] 버튼 존재

## 3.10 [기록 삭제]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 10 52" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/a643dcb0-717e-45fd-8660-d86ef66a20a5">

* [삭제] 버튼 클릭시 [나의 kcal 소비량] 값 삭제

* [취소] 버튼 클릭시 [나의 기록]으로 되돌아 감

## 3.11 [Finish]

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 12 02" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/4f6d3417-5ee2-46ac-99b4-4c5b868a7131">

<img width="200" height="300" alt="스크린샷 2024-06-16 오후 4 11 13" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/be0231ac-4fd5-47c1-ba90-72dd8d75ff4c">

* [총 누적량] 값이 5,000 초과 시 "축하합니다! 당신의 노력이 성공을 만들었어요!" 라는 문구 [성공 문구] 출력

* [총 누적량] 값이 5,000 미만 시 "아직이에요! 조금 더 힘을 내세요" 라는 문구 출력 후 확인 클릭 시 [나의 기록]으로 되돌아 감

## 3.12 [성공 문구]

<img  width="200" height="300" alt="스크린샷 2024-06-16 오후 4 12 13" src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/aeb23a8c-a8c5-4bb9-b601-2cffe6420a79">

* 확인 버튼 클릭 시 [총 누적량], [나의 kcal 소비량], [오늘 소비량] 값을 모두 0으로 초기화 

4. 유튜브 영상


<a href="https://youtu.be/fgpe13-NIrk">
  <img src="https://github.com/jwoochoi2001/WeekFit5000/assets/172946192/da09f17b-fd7a-4950-b11a-3ade25f97860" alt="Week_Fit_jpg" width="300" height="300">
</a>





