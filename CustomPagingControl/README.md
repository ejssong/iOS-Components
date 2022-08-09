# Customizing UI Paging Control 
## 👉 _Description_
- ios 14 이상 

<img width="700" height="250" alt="스크린샷 2022-08-09 오후 5 24 21" src="https://user-images.githubusercontent.com/59044882/183602936-53de9626-51a5-44ef-80d8-e1738b74ce51.png"> </img>

- ios 14 이하 
<br>
<img width="350" alt="스크린샷 2022-08-09 오후 5 30 03" src="https://user-images.githubusercontent.com/59044882/183602911-6e76a065-c79d-4839-a108-05fa93e4606a.png"> </img>

※ ios 13 이하 & 14 이상 버전은 UIPageControl을 구성하는 요소가 다르기 때문에 분기 처리 해줘야 한다. <br>
※ currentPage를 오버라이딩 후 캐스팅한 컴포넌트의 요소에 접근해 index == currentPage 사이즈 조정 

## 👉 _Result_
