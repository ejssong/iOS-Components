# Customizing UI Segmented Control 
## 👉 _Description_

<img width="700" alt="스크린샷 2022-08-09 오후 2 49 42" src="https://user-images.githubusercontent.com/59044882/183580901-4ad865f4-c71b-4147-9dc6-16bf902fc59b.png">

- Hierarchy 찍어본 결과 UISegmentedControl의 segments는 UIImageView로 이루어져 있어, 내부에 접근해 cornerRadius로 적용시켜야 합니다. 
- layoutSubviews 메소드를 통해서 작업 해줘야한다. 
<br> ✔︎ layoutSubviews : 레이아웃이 결정될 때 부과적인 작업(UI)으로 현재 정보를 바탕으로 새로운 레이아웃으로 변경 

## _Before_
<img width="300" alt="스크린샷 2022-08-09 오후 2 54 36" src="https://user-images.githubusercontent.com/59044882/183580376-5991dab5-b293-43a1-9740-6bfa77afe175.png">

## _After_
<img width="330" alt="스크린샷 2022-08-09 오후 2 55 21" src="https://user-images.githubusercontent.com/59044882/183580427-722cb459-47df-45e2-90b6-99d587548258.png">
