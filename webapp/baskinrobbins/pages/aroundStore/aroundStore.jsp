<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>키워드로 장소검색하고 목록으로 표출하기</title>
  <link rel="stylesheet" href="../../styles/aroundStore.css" type="text/css">
</head>
<body>
	<jsp:include page="../../partials/header.jsp"></jsp:include>
	<br><br><br><br><br>
	<h1>매장찾기</h1>
  <div class="map_wrap">
    <div id="menu_wrap" class="bg_white">
      <div class="option">
        <div>
          <form onsubmit="searchPlaces(); return false;">
            <table>
              <tr>
                <td>
                  <select class="main-city" onchange="changeSubCity()">
                    <option value="none">도/시 선택</option>
                    <option value="강원">강원특별자치도</option>
                    <option value="경기">경기</option>
                    <option value="경남">경남</option>
                    <option value="경북">경북</option>
                    <option value="광주">광주</option>
                    <option value="대구">대구</option>
                    <option value="대전">대전</option>
                    <option value="부산">부산</option>
                    <option value="서울">서울</option>
                    <option value="세종">세종특별자치시</option>
                    <option value="울산">울산</option>
                    <option value="인천">인천</option>
                    <option value="전남">전남</option>
                    <option value="전북">전북</option>
                    <option value="제주">제주특별자치도</option>
                    <option value="충남">충남</option>
                    <option value="충북">충북</option>
                  </select>
                </td>
                <td>
                  <select class="sub-city">
                    <option value="none">구/군 선택</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td colspan="2"><input type="text" value="" id="keyword" size="15"></td>
              </tr>
              <tr>
                <td colspan="2">
                  <input class="searchArea" type="submit" value="검색하기"></input>
                </td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <hr>
      <ul id="placesList"></ul>
      <div id="pagination"></div>
    </div>
		
    <div id="map" style="width:1500px;height:100%;position:absolute;left:400px;overflow:hidden"></div>	
  </div>
  <br><br><br><br><br>
  <jsp:include page="../../partials/footer.jsp"></jsp:include>
  
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=528369c3473a8e47a0ec1c1c6682df2d&libraries=services"></script>
  <script type="text/javascript" src="aroundStore.js"></script>
</body>
</html>