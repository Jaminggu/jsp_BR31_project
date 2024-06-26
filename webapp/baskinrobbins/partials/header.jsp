<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
boolean isLoggedIn = (session.getAttribute("log") != null);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
   * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    ul, li {
      list-style: none;
    }
    
    .header-container {
      width: 100%;
      height: 90px;
      display: flex;
      flex-direction: row;
      position: fixed;
      top: 0;
      left: 0;
      padding: 30px;
      justify-content: space-between;
      background-color: #f986bd;
      color: #fff;
      z-index: 1;
    }

    .header-menu-container {
      display: flex;
    }
    .header-menu-container > img {
      margin-right: 50px;
      align-self: center;
    }
    
    .img_logo {
      cursor: pointer;
    }
    .img_logo:hover {
      transition: transform 0.2s ease;
      transform: scale(1.1);
    }

    .header-menu {
      display: flex;
    }
    .header-menu > p {
      padding: 10px 30px 10px 10px;
      cursor: pointer;
    }
    .header-menu > p:hover {
      transition: transform 0.2s ease;
      transform: scale(1.1);
    }

    .header-right {
      display: flex;
      flex-direction: row;
      align-items: center;
    }
    .header-right > img {
      cursor: pointer;
    }
    .header-right > img:hover {
      cursor: pointer;
      transition: transform 0.2s ease;
      transform: scale(1.1);
    }
    .header-right img:nth-child(1) {
      width: 45px;
      height: 45px;
      margin-right: 20px;
      display: <%= isLoggedIn ? "block" : "none" %>;
    }
    .header-right img:nth-child(2) {
      width: 40px;
      height: 40px;
      margin-right: 20px;
    }
    .header-right img:nth-child(3) {
      width: 28px;
      margin-right: 10px;
    }
    .header-right > p.logout {
      cursor: pointer;
      display: <%= isLoggedIn ? "block" : "none" %>;
    }
    .header-right > p.logout:hover {
      transition: transform 0.2s ease;
      transform: scale(1.1);
    }
    
    .empty-box {
      height: 90px;
    }
</style>
</head>

<body>
  <div class="header-container">
    <div class="header-menu-container">
      <img class="img_logo" src="${pageContext.request.contextPath}/baskinrobbins/images/header_logo.png" alt="logo"/>
      <div class="header-menu">
        <p class="shop">메뉴</p>
        <p class="boardMain">베라광장</p>
        <p class="aroundStore">매장 찾기</p>
        <p class="custom">커스텀 BR</p>
      </div>
    </div>
    <div class="header-right">
      <img class="cartList" src="${pageContext.request.contextPath}/baskinrobbins/images/icon_cart.png" alt="cart"/>
      <img class="memberAdmin" src="${pageContext.request.contextPath}/baskinrobbins/images/icon_admin.png" alt="admin"/>
      <img class="member" src="${pageContext.request.contextPath}/baskinrobbins/images/btn_user_white.png" alt="user"/>
      <p class="logout">로그아웃</p>
    </div>
  </div>
  <div class="empty-box"></div>
</body>
  
<script>
  const homeHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/index.jsp';
  }

  const shopHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/shop/01_iceCreamList.jsp';
  }

  const boardMainHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/board/boardMain.jsp';
  }
  
  const aroundStoreHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/aroundStore/aroundStore.jsp';
  }
  
  const customHeader = function() {
	    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/custom/customView.jsp';
	  }
  
  const cartListHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/shop/04_cartList.jsp';
  }
  
  const memberAdminHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/memberAdmin/adminLogin.jsp';
  }
  
  const memberHeader = function() {
    location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/member/loginForm.jsp';
  }
  
  const logoutHeader = function() {
	location.href = '${pageContext.request.contextPath}/baskinrobbins/pages/member/logout.jsp';
  }
  
  document.querySelector('.img_logo').addEventListener("click", homeHeader);
  document.querySelector('.shop').addEventListener("click", shopHeader);
  document.querySelector('.boardMain').addEventListener("click", boardMainHeader);
  document.querySelector('.aroundStore').addEventListener("click", aroundStoreHeader);
  document.querySelector('.custom').addEventListener("click", customHeader);
  document.querySelector('.cartList').addEventListener("click", cartListHeader);
  document.querySelector('.memberAdmin').addEventListener("click", memberAdminHeader);
  document.querySelector('.member').addEventListener("click", memberHeader);
  document.querySelector('.logout').addEventListener("click", logoutHeader);
</script>
</html>
