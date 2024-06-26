<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../layout/common.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
	table, tr, td{
	border: 1px solid lightgray;
	border-collapse: collapse;
	}
	h1 {
	color:#f986bd;
	font-size: 40px;
	margin-bottom: 30px;
	}
	#content-addOrder{
		margin: 0 auto;
		text-align: center;
	}
	#title{
		text-align: center;
	}

#btn-requestPay{
            width: 140px;
            height: 35px;
            font-size: 16px;
            font-weight: bold;
            background-color: #f986bd;
            color: white;
            border-style: none;
            margin: 20px 0px 20px 0;
            cursor: pointer;
        }
</style>

</head>
<body>
<%
String log = (String)session.getAttribute("log");
%>

<%
int[] cartIceCreamNumberList = new int[1000];
String[] cartBuyerList = new String[1000];
int[] cartSelectSizeList = new int[1000];
int[] cartBuyCountList = new int[1000];

int cartSize = 0;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from cart where cart_buyer = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, log);
	rs = ps.executeQuery();
	
	int i = 0;
	while(rs.next()) {
		cartBuyerList[i] = rs.getString(2);
		cartSelectSizeList[i] = rs.getInt(3);
		cartBuyCountList[i] = rs.getInt(4);
		cartIceCreamNumberList[i] = rs.getInt(5);
		
		i += 1;
	}
	cartSize = i;
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}


int[] iceCreamNumberList = new int[1000];
String[] iceCreamNameList = new String[1000];
int[] iceCreamPriceList = new int[1000];
int[] iceCreamStockList = new int[1000];
int[] iceCreamSoldList = new int[1000];
String[] iceCreamImageList = new String[1000];
String[] iceCreamContentImage1List = new String[1000];
String[] iceCreamContentImage2List = new String[1000];
String[] iceCreamContentImage3List = new String[1000];
int[] iceCreamInfoList1 = new int[1000];
int[] iceCreamInfoList2 = new int[1000];
int[] iceCreamInfoList3 = new int[1000];
int[] iceCreamInfoList4 = new int[1000];
int[] iceCreamInfoList5 = new int[1000];
int[] iceCreamInfoList6 = new int[1000];
String[] iceCreamInfoList7 = new String[1000];
String[] iceCreamRegDateList = new String[1000];

int iceCreamSize = 0;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from product";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	int i = 0;
	while(rs.next()) {
		iceCreamNumberList[i] = rs.getInt(1) - 1;
		iceCreamNameList[i] = rs.getString(2);
		iceCreamStockList[i] = rs.getInt(3);
		iceCreamSoldList[i] = rs.getInt(4);
		iceCreamRegDateList[i] = rs.getString(5);
		
		iceCreamInfoList1[i] = rs.getInt(6);
		iceCreamInfoList2[i] = rs.getInt(7);
		iceCreamInfoList3[i] = rs.getInt(8);
		iceCreamInfoList4[i] = rs.getInt(9);
		iceCreamInfoList5[i] = rs.getInt(10);
		iceCreamInfoList6[i] = rs.getInt(11);
		iceCreamInfoList7[i] = rs.getString(12);
		
		iceCreamImageList[i] = rs.getString(13);
		iceCreamContentImage1List[i] = rs.getString(14);
		iceCreamContentImage2List[i] = rs.getString(15);
		iceCreamContentImage3List[i] = rs.getString(16);
		
		i += 1;
	}
	
	iceCreamSize = i;
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

int[] iceCreamMenuNumberList = new int[1000];
int[] iceCreamMenuSelectSizeList = new int[1000];
int[] iceCreamMenuPriceList = new int[1000];

int menuSize = 0;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from productMenu";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	int i = 0;
	while(rs.next()) {
		iceCreamMenuNumberList[i] = rs.getInt(1) - 1;
		iceCreamMenuSelectSizeList[i] = rs.getInt(2);
		iceCreamMenuPriceList[i] = rs.getInt(3);
				
		i += 1;
	}
	menuSize = i;
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}



%>

<%
String[] myCartIceCreamNameList = new String[1000];
int[] myCartSelectSizeList = new int[1000];
int[] myCartBuyPriceList = new int[1000];
int[] myCartBuyCountList = new int[1000];
String[] myCartIceCreamImageList = new String[1000];

String titleAll = "";

int total = 0;
int count = 0;
for(int i=0; i<cartSize; i++){
	if(cartBuyerList[i].equals(log)){
		myCartBuyCountList[count] = cartBuyCountList[i];
		myCartSelectSizeList[count] = cartSelectSizeList[i];
		
		for(int j=0; j<iceCreamSize; j++){
			if(cartIceCreamNumberList[i] == iceCreamNumberList[j]){
				titleAll += iceCreamNameList[j] + ",";
				
				myCartIceCreamNameList[count] = iceCreamNameList[j];
				myCartIceCreamImageList[count] = iceCreamImageList[j];
				
				for(int k=0; k<menuSize; k++) {
					if(cartSelectSizeList[i] == iceCreamMenuSelectSizeList[k]) {
						myCartBuyPriceList[count] = iceCreamMenuPriceList[k];
						
						total += myCartBuyPriceList[count] * myCartBuyCountList[count];
						count += 1;
					}
				}
			}
		}
	}
}
%>
<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br>
<div align="center">
<h1>아이스크림 결제하기</h1>
<table id="content-addOrder">
<%for(int i=0; i<count; i++) { %>
<tr>
<td><%=i+1 %></td>
<td><img src="<%=myCartIceCreamImageList[i]%>" width="200px"></td>
<td><%=myCartIceCreamNameList[i] %></td>
<td><%=myCartBuyCountList[i] %>개</td>
<td><%=myCartBuyPriceList[i] %>원</td>
</tr>
<%} %>
<tr>
<td>총 상품금액</td>
<td colspan="4" align="right"><%=total %>원</td>
</tr>
<tr>
<td>배송비</td>
<td colspan="4" align="right">
<%
int limitPrice = 40000;
int deliveryPrice = 3000;
int addPrice = 0;

//총 상품 구매 금액이 4만원 이상이면 무료 배송
if(total >= limitPrice){
	deliveryPrice = 0;
} else {
	addPrice = limitPrice - total;
}
%>
<%if(deliveryPrice == 0) {%>
0 원
<%} else {%>
3000원(<%=addPrice %>원 추가 주문시, 무료배송)
<%} %>
</td>
</tr>
<tr>
<td>주문자명</td>
<td colspan="4" align="right"><input type="text" id="buyer"></td>
</tr>
<tr>
<td>연락처</td>
<td colspan="4" align="right"><input type="text" id="tel"></td>
</tr>
<tr>
<td>주소</td>
<td colspan="4" align="right"><input type="text" id="addr"></td>
</tr>
<tr>
<td>총 결제금액</td>
<td colspan="4" align="right"><%=total + deliveryPrice %>원</td>
</tr>
<tr>
<td colspan="5" align="center">
<button id="btn-requestPay">결제하기</button>
</td>
</tr>
</table>
</div>
<br><br><br><br><br>
<jsp:include page="../../partials/footer.jsp"></jsp:include>



<script>
let requestPay = (event) => {
	let IMP = window.IMP; 
	IMP.init("imp50004550"); // 고객자 식별코드

	let today = new Date();   
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분
	let seconds = today.getSeconds();  // 초
	let milliseconds = today.getMilliseconds();
	let makeMerchantUid = hours +  minutes + seconds + milliseconds;

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "IMP"+makeMerchantUid, 
	    name : 'baskin rabbins',
	    amount : 10,
	    buyer_email : 'cwj9511@naver.com',
	    buyer_name : '정원진',
	    buyer_tel : '010-2285-3725',
	    buyer_addr : '서울특별시 강남구 역삼동',
	    buyer_postcode : '06214'
	}, function (rsp) { 
	    if (rsp.success) {
	        let log = "<%= (String)session.getAttribute("log") %>";
	        
	        $.ajax({
				type: "post",
				url: "06_addOrderPro.jsp",
				data: {
					log: log,
					buyer: $buyer.value,
					tel: $tel.value,
					addr: $addr.value
				},
				success: function(data) {
					alert("결제가 완료되었습니다.");
					location.href="07_orderList.jsp";
				},
				error: function() {
					alert("addOrderForm error");
				}
	        });
	        
	    } else {
	        console.log(rsp);
	    }
	});			
}

let $requestPay = document.querySelector("#btn-requestPay");
$requestPay.addEventListener("click", requestPay);

let $buyer = document.querySelector("#buyer");
let $tel = document.querySelector("#tel");
let $addr = document.querySelector("#addr");

</script>

</body>
</html>