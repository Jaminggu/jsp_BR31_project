<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>BR31</title>
  <link rel="stylesheet" href="index.css" type="text/css">
</head>
<body>
<div class="container">

  <jsp:include page="partials/header.jsp"></jsp:include>

  <img class="bg_hero" src="images/bg_hero.png" alt="bg_hero"/>

  <div class="main-container">
    <div class="main-header">
      <h1>Promotion</h1>
      <p>베라의 다양한 혜택과 이벤트를 만나보세요</p>
    </div>
    <div class="main-promotion-container">
      <div class="promotion-contents-container">
        <div class="promotion-contents">
          <img src="images/promotion_1.png" alt="promotion_1"/>
          <p class="promotion-contents-date">행사 시작 기간 ~ 종료 기간</p>
          <p class="promotion-contents-text">행사 텍스트</p>
        </div>
        <div class="promotion-contents">
          <img src="images/promotion_2.png" alt="promotion_2"/>
          <p class="promotion-contents-date">행사 시작 기간 ~ 종료 기간</p>
          <p class="promotion-contents-text">행사 텍스트</p>
        </div>
        <div class="promotion-contents">
          <img src="images/promotion_3.png" alt="promotion_3"/>
          <p class="promotion-contents-date">행사 시작 기간 ~ 종료 기간</p>
          <p class="promotion-contents-text">행사 텍스트</p>
        </div>
        <div class="promotion-contents">
          <img src="images/promotion_4.png" alt="promotion_4"/>
          <p class="promotion-contents-date">행사 시작 기간 ~ 종료 기간</p>
          <p class="promotion-contents-text">행사 텍스트</p>
        </div>
      </div>
    </div>
  </div>

  <div class="main-new">
    <div class="main-container">
      <div class="main-header">
        <h1>New Item</h1>
        <p>새로 나온 배라의 신제품을 소개합니다</p>
      </div>
      <div class="main-new-contents">
        <img src="images/new_1.png" alt="new_1"/>
        <img src="images/new_2.png" alt="new_2"/>
        <img src="images/new_3.png" alt="new_3"/>
        <img src="images/new_4.png" alt="new_4"/>
        <img src="images/new_5.png" alt="new_5"/>
      </div>
    </div>
  </div>

  <div class="main-play">
    <div class="main-container">
      <div class="main-header">
        <h1>BR Play</h1>
        <p>배라와 함께한 당신의 다양한 의견을 듣습니다</p>
      </div>
      <div class="main-play-items">
        <img src="images/img_my_flavor.png" alt="my-flavor"/>
        <img src="images/img_plaza_list.png" alt="plaza-list"/>
      </div>
    </div>
  </div>

  <div class="main-be-better">
    <div class="main-container">
      <div class="main-header">
        <h1>Be Better</h1>
        <p>배라가 사회와 함께 하는 방법, 가치 있는 같이</p>
      </div>
      <div class="main-be-better-items">
        <img src="images/img_farm.png" alt="farm"/>
        <img src="images/img_dream.png" alt="dream"/>
        <img src="images/img_link.png" alt="link"/>
      </div>
    </div>
  </div>

  <div class="main-benefit">
    <div class="main-container">
      <div class="main-header">
        <h1>BR Benefit</h1>
        <p>배라와 함께 다양한 혜택을 즐기세요</p>
      </div>
      <div class="main-benefit-items">
        <img src="images/img_benefit_1.png" alt="benefit_1"/>
        <img src="images/img_benefit_2.png" alt="benefit_2"/>
        <img src="images/img_benefit_3.png" alt="benefit_3"/>
        <img src="images/img_benefit_4.png" alt="benefit_4"/>
      </div>
    </div>
  </div>

  <div class="main-box">
    <div class="main-container">
      <div class="main-box-container">
        <div class="main-box-item">
          <div class="main-header">
            <h1>Store</h1>
            <p>내 주변 가까운
              배스킨라빈스 매장을 찾아보세요</p>
          </div>
          <img src="images/img_store_map.png" alt="map"/>
        </div>
        <div class="main-box-item">
          <div class="main-header">
            <h1>BR Way</h1>
            <p>오랜 시간 우리 곁에 함께한 <br> 배스킨라빈스의 이야기</p>
          </div>
          <img src="images/img_story_story.png" alt="story"/>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="./partials/footer.jsp"></jsp:include>
  
  </div>
</body>

</html>
