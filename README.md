# 은행창구 매니저 💰
> 은행창구 매니저가 되서 은행 업무를 관리하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230306--230310)
3. [파일 구조](#3-파일-구조)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [Reference](#6-reference)

---
## 1. 팀원 소개
|Goat|Andrew|
|:---:|:---:|
|<img src="https://i.imgur.com/yoWVC56.png" width="140" height="140"/>|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/Andrew.png?raw=true" width="140">|

## 2. 타임라인 (23.03.06. ~ 23.03.10.)
|날짜|진행 내용|
|---|---|
|2023-03-06|step1 구현완료 및 PR요청|
|2023-03-07|step1 리뷰사항 반영, 수정|
|2023-03-08|Step1 merge|
|2023-03-09|Step 2 PR요청 및 수정|
|2023-03-10|ReadMe작성 및 회고| 
|2023-03-13|step2 리뷰사항 반영, 수정|
|2023-03-14|step2 리뷰사항 반영, 수정|
|2023-03-15|Step2 merge|
|2023-03-16|step3 pr요청 및 step4진행|
|2023-03-17|ReadMe작성 및 회고| 

## 3. 파일 구조

<details>
    <summary><big>폴더 구조</big></summary>

``` swift
BankManagerUIApp
    │
    ├── main
    ├── BankingType
    ├── BankDesk
    ├── TextEnum
    ├── Customer
    ├── Extension
    └── BankQueue
    ├── AppDelegate
    ├── SceneDelegate
    ├── ViewController
    ├── Main
    ├── Assets
    ├── launchScreen
    └── BankManagerUIAppTests
       ├── BankManagerUIAppTests
       └── Info  
    
BankManagerConsoleApp
    │
    ├── main
    ├── BankManager
    ├── BankingType
    ├── BankDesk
    ├── TextEnum
    ├── Customer
    ├── Extension
    └── BankQueue
    
```

<br>    
    
</details>
<br/>

## 4. 실행화면

<details>
    <summary><big>실행 화면</big></summary>

<img src="https://i.imgur.com/YxWzZl0.gif)" width=80% height=80%/>

* step2의 실행화면입니다.
* 0.7초 간격의 [n번 고객업무시작], [n번 고객업무완료] 구조를 DispatchQueue -sync형태로 출력하고있는 모습입니다.

<img src="https://i.imgur.com/qr8Vq5Q.png)" width=80% height=80%/>

* step3의 실행화면입니다.
* 0.7초 간격으로 [n번 고객 예금업무 시작], [n번 고객 예금업무 종료] 구조를 DispatchQueue -async형태(비동기)로 두 개의 스레드가 실행되며 , [n번 고객 대출업무 시작], [n번 고객 대출업무 종료] 구조를 DispatchQueue -async형태(비동기)로 한 개의 스레드가 실행되는 화면입니다.

* step4는 아직 구현이 미완성이라 추후 업데이트 하겠습니다.

</details>

## 5. 트러블 슈팅

### :fire: 메서드 재활용
- nil 할당을 방지하기 위해서 guard문을 사용해서 조건을 주었습니다.
- guard문의 조건과 유사한 메서드인 isEmpty()를 활용해서 Method를 재활용해 주었습니다
```swift
guard head != nil else {
      head = Node(data: data)
      return
}

guard isEmpty() == false else {
      head = Node(data: data)
      return
}
```

### :fire: 값타입 사용시 Escaping closure captures mutating 'self' parameter 에러
-> **struct -> class 변경으로 해결**

* BankManager는 처음에 struct로 구현했는데, 클로저에서 self키워드 사용시 위와같은에러 **Escaping closure captures mutating 'self' parameter**라는 에러가 나왔습니다.
* 찾아보니 DispatchQueue의 클로저 안에 구현된 self가 struct구조(값타입)의 값을 전달받아오거나 변경할 수 없다는 내용으로 이해했습니다.
* 따라서 구조체에서 참조타입으로 class로 변경해 위와같은 에러를 해결했습니다.

### :fire: BankQueue 파일위치이동 -> UI, Console 두개프로젝트 모두 적용되게끔 이동
<img src="https://i.imgur.com/nSPmIKQ.png" width= 80%>

*  지금은 `BankManagerUIApp` 프로젝트를 사용하지않지만 저희는 처음에 Queue를 UI쪽에 구현했습니다. 그러나 이번스텝은 `BankManagerConsoleApp`콘솔앱에 요구사항이 있었습니다. 콘솔앱에 프로젝트를 진행하는 외에도 추후에 UI앱쪽에도 `BankQueue`와 `BankManager`를 사용할 일이 있을거같아 위처럼 두개의 파일을 공동파일로 위치를 변경해주었는데 적절할까요?
* -> `BankQueue`를 UIApp폴더 내에서 ios-bank-manager 파일로 이동


### :fire: usleep()과 sleep() 차이점
- sleep과 usleep은 기능은 같지만 usleep 초단위를 좀 더 세밀하게 동작할 수 있다는 차이점이 있습니다. 
- 초 단위를 0.7초 주어야 하는데 sleep은 Int 데이터형식으로만 표현할 수 있어서 usleep을 사용하였습니다.
- Thead.sleep(timeInterval:) 이라는 timeInterval이라는 매서드를 활용하는 방법으로 바꿨습니다.

### :fire:Race condition - semaphore

* 처음에 enqueue된 데이터를 세개의 스레드가 비동기로 작업을 처리하도록 구현했는데, 동시에 여러스레드에서 같은 값을 들고가는 현상이 발생했습니다
```swift
// 1번 고객 예금업무 시작
// 1번 고객 예금업무 종료
// 1번 고객 대출업무 시작
// 1번 고객 예금업무 시작
// 1번 고객 대출업무 종료
// 1번 고객 예금업무 종료
```
이같은 현상이 **Red condition**이라는 사실을 알게되었고, dispatchSemaphore의 value값에 제한을 줘서 Thread Safe가 되도록 작업을 처리해 문제를 해결했습니다.

### :fire: deposit(예금) ,loan(대출) 분기처리
* customer 데이터들을 deuque해서 꺼내올때 어떤식으로 분기처리를 해야할지, 어떤데이터는 deposit(예금)으로 어떤데이터는 loan(대출)로 가야하는데 무슨기준을 갖고 분리해야할지 고민이었습니다. 다른 캠퍼의 의견으로 customer데이터를 enqueue에 넣는거자체에서 randomElement로 넣어주면 어떻냐는 의견을 얻었고,
```swift
enum Customer: String, CaseIterable {
    case loan = "loan"
    case deposit = "deposit"

struct BankingType {
    let customer: Customer
    let countNumber: Int
    
    init?(customerNumber: Int){
        guard let customer = Customer.allCases.randomElement() else { return nil }
        
        
 private func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            guard let count = BankingType.init(customerNumber: i) else { return }
            self.customerQueue.enqueue(data: count)
        }
    }
        
        
switch currentCustomer.customer {
case .deposit: 
    // 예금손님일때 실행구문
case .loan: 
    // 대출손님일때 실행구문
```
위와같은 형태로 Banking타입을 손님수 만큼 init하면서 despoit, loan 데이터 두가지 랜덤형태로 enqueue할수있도록 만들어서, 후에 사용할 때 dequeue후 데이터가 분기처리되며 나눠질수있게 구현했습니다.
### :fire: CFAbsoluteTimeGetCurrent() 시간절대값 계산
* 작업에 소요되는 시간 deposit = 0.7초 / loan = 1.1초 입니다
* 동기적으로 처리된다면 작업시간을 전부 더하면 되지만, 비동기적으로 동시다발적으로 진행되기때문에 단순히 시간을 횟수만큼 더하는것은 제시조건과 맞지않았습니다.
* 따라서 banking() 매서드를 실행하는 동안의 시간값을 아래처럼 `CFAbsoluteTimeGetCurrent()` 매서드를 활용해 구했습니다
```swift
  private func calculateProcessTime(_ process: () -> () ) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent() 
      // 시작절대시간값
        process() 
      // 매서드 실행
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
      // 현재절대시간값 - 시작절대시간값
        return processTime
    }
```


## 6. Reference
[Swift Language Guide - Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)<br />
[Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/)<br />
[Swift Language Guide - Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)<br />
[Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)<br />
[Swift Language Guide - Subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts/)
[Concurrency Programming Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
