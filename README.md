# 🎯 Introduce

Simple To-Do List
with Provider (local save : Memory)


used packages
- [Provider](https://pub.dev/packages/provider/install)
    사용법이 쉽고, Flutter 공식 문서에서도 추천하는 패키지.

<br>

# 🎯 Point

## 📌 상태 관리(State Management) 이해하기
사용패키지 - Provider
최신 상태의 데이터를 보여주도록 페이지 간 데이터를 주고받고 관리하는 행위.  
데이타를 상태관리서비스 클래스에서 담당한다.  

전역적으로 사용되는 데이터를 담당할 **Service**를 만들고 해당 데이터처리를 모두 **Service**에서 구현한다.

<br>

# 🎯 Note

## 📌 Provider

`Class Service extends` *`ChangeNotifier`*  
다른 곳에 변경사항을 알림.  
해당 클래스의 데이타를 사용하는 페이지를 갱신시켜줄 수 있도록 알려준다.

`notifylisteners();` : 이 메소드를 호출하면 위젯들을 갱신한다.  
변경사항이 있을 경우 `Consumer`의 `builder`함수 내부가 새로고침 된다.  
쉽게말해 `StatefulWidget`의 `setState` 같은 기능.  

### Provider 접근방법

위젯트리 상단에 있는 Provider로 등록한 클래스에 접근할 수 있다.
준비 : runApp에 MultiProvider로 감싼다.

- `Consumer<클래스명>`
    클래스 정보 갱신시 함께 새로고침 할 때 사용함.
- `context.read<클래스명>()`
    1회성으로 클래스 접근할 때 사용함.

## 📌 객체화

`List<클래스 데이터 타입> = []` 에 접근하려면 객체화를 시켜 넣어줘야 한다.

---

# 🎯 Reference

[State Management | Flutter(Flutter 공식문서)](https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro)