<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
   * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    ul, li {
      list-style: none;
    }
    
    .footer-container {
      width: 100vw;
      padding-bottom: 60px;
      background: #1c1b18;
      color: #fff;
    }

    .footer-policy {
      padding: 40px 20px 20px 20px;
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      border-bottom: 1px solid #333230;
    }
    .footer-policy p {
      cursor: pointer;
    }

    .footer-content {
      display: flex;
      padding: 31px 0 17px 10px;
    }

    .footer-info {
      margin-right: 30px;
      color: #ffffff80;
      font-size: 14px;
    }

    .footer-info-list {
      margin-top: 30px;
    }
    .footer-info-list p {
      margin-top: 12px;
    }

    .footer-menu {
      padding-bottom: 17px;
    }

    .footer-menu-list {
      display: flex;
      flex-direction: row;
    }

    .footer-menu-items {
      margin-right: 40px;
    }

    .footer-menu-items h1 {
      color: #fff3;
      margin-bottom: 10px;
      cursor: pointer;
    }

    .footer-menu-item p{
      padding: 6px 0 6px 0;
      cursor: pointer;
    }

    .footer-container > p {
      margin: 10px;
      color: #ffffff80;
      font-size: 14px;
    }

    .footer-bottom {
      border-top: 1px solid #333230;
      padding: 10px;
      display: flex;
      position: relative;
    }
    .footer-bottom-relation img {
      margin-right: 30px;
      cursor: pointer;
    }

    .footer-bottom-sns {
      position:absolute;
      right: 40px;
    }

    .footer-bottom-sns img {
      padding-left: 30px;
      cursor: pointer;
    }
</style>
</head>

<body>
<div class="footer-container">
    <div class="footer-policy">
      <p>신규 직영점 입점제의</p>
      <p>점포개설문의</p>
      <p>채용문의</p>
      <p>윤리신고센터</p>
      <p>해피포인트카드 이용약관</p>
      <p>베스킨라빈스 리워드 이용약관</p>
      <p>개인정보처리방침</p>
      <p>영상정보처리기기운영관리방침</p>
      <p>안전보건 경영방침</p>
    </div>
    <div class="footer-content">
      <div class="footer-info">
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/h_logo_2.png" alt="h_logo_2"/>
        <div class="footer-info-list">
          <p>사업자 등록번호 : 303-81-09535</p>
          <p>비알코리아(주) 대표이사 도세호</p>
          <p>서울특별시 서초구 남부순환로 2620(양재동 11-149번지)</p>
          <p>TEL : 080-555-3131</p>
          <p>개인정보관리책임자 : 조성희/상무보</p>
        </div>
      </div>
      <div class="footer-menu">
        <ul class="footer-menu-list">
          <li class="footer-menu-items">
            <h1>Menu</h1>
            <div class="footer-menu-item">
              <p>이달의 맛</p>
              <p>아이스크림</p>
              <p>프리팩</p>
              <p>아이스크림 케이크</p>
              <p>이달의 맛</p>
              <p>디저트</p>
              <p>음료</p>
              <p>커피</p>
            </div>
          </li>
          <li class="footer-menu-items">
            <h1>BR Play</h1>
            <div class="footer-menu-item">
              <p>이벤트</p>
              <p>베라광장</p>
              <p>BR레시피</p>
              <p>마이플레이버리스트</p>
            </div>
          </li>
          <li class="footer-menu-items">
            <h1>BR 스토리</h1>
            <div class="footer-menu-item">
              <p>브랜드 스토리</p>
              <p>이달의 맛 히스토리</p>
              <p>Be Better</p>
            </div>
          </li>
          <li class="footer-menu-items">
            <h1>Delivery/Store</h1>
            <div class="footer-menu-item">
              <p>매장 찾기</p>
              <p>100flavor 플래그십스토어</p>
              <p>Flow 매장</p>
              <p>워크샵 by 배스킨라빈스</p>
              <p>점포개설문의</p>
              <p>배달주문</p>
              <p>단체주문</p>
            </div>
          </li>
          <li class="footer-menu-items">
            <h1>Information Center</h1>
            <div class="footer-menu-item">
              <p>고객센터</p>
              <p>소비자중심경영(CCM)</p>
              <p>칭찬점포</p>
              <p>공지사항</p>
              <p>보도자료</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <p>Copyright © 2023 BRKOREA Company. All Rights Reserved.</p>
    <div class="footer-bottom">
      <div class="footer-bottom-relation">
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_happy_point.png" alt="happy_point"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_happy_market.png" alt="happy-market"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_spc_story.png" alt="spc_story"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_ksa.png" alt="ksa"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_ccm.png" alt="ccm"/>
      </div>
      <div class="footer-bottom-sns">
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_instagram.png" alt="instagram"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_youtube.png" alt="youtube"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_facebook.png" alt="facebook"/>
        <img src="${pageContext.request.contextPath}/baskinrobbins/images/btn_magazine.png" alt="magazine"/>
      </div>
    </div>
  </div>
</body>