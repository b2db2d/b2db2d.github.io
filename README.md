# 항상 주의할 점

## 커밋전에 반드시 바뀐부분에 대한 테스트는 잊지말자

포크로 커밋 전에 고쳐진 부분 전부 확인 필수  
그러니 이슈는 한 문제만 다룰 수 있도록 할 것  
피치 못 하게 큰 틀을 정해야 하는 경우, 숫자 십단위로 표시  
해당 이슈의 그 다음 세분화는 숫자 백단위  
마찬가지로 천단위는 이슈를 더 쪼갤 수 있는 경우  
이 때 세분화된 이슈는 반드시 앞 단위의 이슈를 참조할 수 있도록 해놓아야 한다  

00 : UI  
000 : UI - mainView  
0000 : UI - mainView - animation  

## 문제가 생기면 디버깅 어떻게 할 수 있는지 바로 생각하기

디버깅 관련 이슈는 반드시 정리하기  
크래시 관련 이슈는 별도로 구분하기

## 문제가 있다는 건 에러가 있다는 거임

에러가 어디에 있는지 빨간색 표시를 꼭 보고 에러 고치기 전에 푸시 절대 금지  
노란색 표시는 코드에 혼동을 야기할 수 있으니 커밋전에 전부 없애고 올리기  

### 풀리퀘스트를 던져서 승인을 기다리는 동안 다른 이슈를 오픈하자. 

보통 이슈 갯수는 2~3개 정도까지만 올리기  
1개는 중장기(몇 주가 걸리는) 2개는 단기(간단한 이슈) 로 이줘진다. 


---

# 이슈 생성

branch:

ver: (folk - mouse right - Copy commit SHA) 

screenshot

description:  

---

# 깃허브 작업 과정

작업을 로컬에서 한 뒤

folk를 키고 

new Branch 를 만드는데 이름은 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9746f967-9b4c-4593-a1ba-2e463111d671/Untitled.png)

feature/이슈번호-이슈키워드

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bb894802-d919-470e-8f9d-cce71529fa3f/Untitled.png)

로컬체인지 누른 뒤 어느 부분이 수정되었는지 Unstaged에서 확인하고

푸쉬(다른사람에게 전달) 하고 싶은 부분만 더블클릭하여 staged로 옮겨놓는다. 

그런다음 푸쉬를 해주고 사이트로 가

(만약 origin/develop이 위치가 다르다면 여기로 rebase를 해주고 force push)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eea9d438-83da-421d-8b2d-90211827d9fd/Untitled.png)

Pull requests에 가서 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4e4f74a2-912b-4865-ab82-f501f26e7c39/Untitled.png)

create pull request를 하는데, 이 때 제목에 `resolving#이슈번호` 혹은 `ref #이슈번호`

를 써주면 명령어 기능을 한다. ref 명령어는 보통 작업 도중 다른 이슈를 받았을 때, 혹은 내가 작업하고 있는 이슈가 다른 사람이 변경하고 있는 이슈에 관련이 있을 경우 알려주는 용도로 사용. 

예: 간략한 제목(resolving #22)

## Feedback 받은 경우

만약 피드백을 받는다면 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f7c1aec1-3524-433a-8a41-87bee9126ce0/Untitled.png)

이런 식으로 코멘트가 달리고 해당 부분을 찾아서 반영을 하면 자동으로 코멘트는 사라진다. 

만약 다른 부분도 같이 수정을 하여서 코멘트가 사라지지 않는다면 reply를 통해 반영되었음을 상대방에게 알려주자. 

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/336d08d9-104d-4694-af4b-aba6ddf1b35f/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/abc66ebd-b7b3-4691-9aee-12dbad664607/Untitled.png)

---

# 이슈 관리

### rebase 를 하이라키처럼 사용하기  
각 스텝 별로 머지 전의 과정까지를 담고 있음  
각 스텝에 요약글을 보고 더 자세히 알고 싶으면 참조된 이슈 따라가기(왜 수정했지? 어떻게 수정했지가 들어있음 - 과정과 이유가 들어있으니 그걸 잘 보자)


### sync now

풀리퀘 올리고 나서 코멘트 받고 Sync 확인하기(베이스 확인)  
수정 사항 다시 커밋하고 만약 코멘트가 남아있으면, 리플라이 달아서 내가 마지막 작성자가 되도록 해놓자.

---
# 깃 정보

rebase - 히스토리가 바뀌기 때문에 깔끔 (그래서 force push로 해줘야 올라감)  
merge - 히스토리가 그대로인데 브랜치도 그대로 더뤄웜

## 리베이스

##### 하는 방법
포크에서 원하는 브랜치로 체크아웃 된 상태에서(바뀔 수 있는 상태)   
리베이스 하고 싶은 브랜치(마우스오른쪽)을 해준다.  

> Q: push를 해야하는데 new(origin/feature/38-roompage) 현재 내 브랜치 있는 위치에 올린 뒤에 풀리퀘스트를 요구하면 되는 걸까?그런 다음 origin/develop으로 rebase한 뒤 force push 하고,merge 하면서 나는 conflict들을 수정하면 되는건가...
> A: 아니 순서가 반대임  
develop으로 rebase를 먼저 하고나서pull-request를 하는 거임
pull-request를 하기 전에 develop에 먼저 rebase를 하는게 맞고,  
pull-request를 하고나서 다른 branch가 develop에 merge되었을때, 다시 develop에 rebase할때 conflict를 해결하가

#### 체리픽 
머지와 비슷하나 커밋하나만 합치고 싶을 때 사용  

#### 어맨드
바로직전 다시 커밋을 수정하여 다시 커밋하는 기능

### conflicts 났을 경우 해결방법(리베이스 하다가)

전제조건은 내가 완전히 코드를 이해하고 있다는 하에…
권장되는 방식은 merge를 해주는 것인데 merge in external merger을 통해 kdiff를 쓰는 것을 추천  
이 때 kdiff 를 거치면 주석처리 한글이 다 깨지므로 만약 한글을 모르고 썼을 경우  
Settings - Configure - Regional Settings로 가서   
File Encoding for A를 utf8로 해준다.
