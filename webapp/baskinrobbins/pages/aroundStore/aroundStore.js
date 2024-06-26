// 마커를 담을 배열입니다
const markers = [];

const $mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
  };

// 지도를 생성합니다
const map = new kakao.maps.Map($mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
const ps = new kakao.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
const infowindow = new kakao.maps.InfoWindow({zIndex:1});

const subOptions = {
  gangwon : ['구/군 선택', '강릉시', '고성군', '동해시', '삼척시', '속초시', '양구군',
             '양양군', '영월군', '원주시', '인제군', '정선군', '철원군', '춘천시',
             '태백시', '평창군', '홍천군', '화천군', '횡성군'
  ],
  gyeonggi : ['구/군 선택', '가평군', '고양시', '과천시', '광명시', '광주시', '구리시',
              '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시',
              '시흥시', '안산시', '안성시', '안양시', '양주시', '양평균', '여주시',
              '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시',
              '평택시', '포천시', '하남시', '화성시'
  ],
  gyeongnam : ['구/군 선택', '거제시', '거창군', '고성군', '김해시', '남해군', '밀양시',
               '사천시', '산청군', '양산시', '의령군', '전주시', '창녕군', '창원시',
               '통영시', '하동군', '함안군', '함양군', '합천군'
  ],
  gyeongbuk : ['구/군 선택', '경산시', '경주시', '고령군', '구미시', '군위군', '김천시',
               '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군',
               '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군',
               '청송군', '칠곡군', '포항시'
  ],
  gwangju : ['구/군 선택', '광산구', '남구', '동구', '북구', '서구'],
  daegu : ['구/군 선택', '남구', '달서구', '달성군', '동구', '북구', '서구', '수성구',
           '중구'
  ],
  daejeon : ['구/군 선택', '대덕구', '동구', '서구', '유성구', '중구'],
  busan : ['구/군 선택', '강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구',
           '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구',
           '해운대구'
  ],
  seoul : ['구/군 선택', '강남구', '강동구', '강북구', '강서구', '관악구', '광진구',
           '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구',
           '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구',
           '용산구', '은평구', '종로구', '중구', '중랑구'
  ],
  sejong : ['구/군 선택', ''],
  ulsan : ['구/군 선택', '남구', '동구', '북구', '울주군', '중구'],
  incheon : ['구/군 선택', '강화군', '계양구', '남동구', '동구', '미추홀구', '부평구',
             '서구', '연수구', '옹진군', '중구'
  ],
  jeonnam : ['구/군 선택', '강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시',
             '담양군', '목포시', '무안군', '보성군', '순천시', '신안군', '여수시',
             '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군',
             '해남군', '화순군'
  ],
  jeonbuk : ['구/군 선택', '고창군', '군산시', '김제시', '남원시', '무주군', '부안군',
             '순창군', '완준군', '익산시', '임실군', '장수군', '전주시', '정읍시',
             '진안군'],
  jeju : ['구/군 선택', '서귀포시', '제주시'],
  choongnam : ['구/군 선택', '계룡시', '공주시', '금산군', '논산시', '당진시', '보령시',
               '부여군', '서산시', '서천군', '아산시', '예산군', '천안시', '청양군',
               '태안군', '홍성군'
  ],
  choongbuk : ['구/군 선택', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군',
               '제천시', '증평군', '진천군', '청주시', '충주시'
  ]
};

let subOption;
const $mainCity = document.querySelector('.main-city');
// ================== 변수부 ==================
const changeSubCity = function() {
	const $subCity = document.querySelector('.sub-city');
	const mainOption = $mainCity.options[$mainCity.selectedIndex].innerText;

	switch(mainOption) {
	  case '강원특별자치도':
	    subOption = subOptions.gangwon;
	    break;
	  case '경기':
	    subOption = subOptions.gyeonggi;
	    break;
	  case '경남':
	    subOption = subOptions.gyeongnam;
	    break;
	  case '경북':
	    subOption = subOptions.gyeongbuk;
	    break;
	  case '광주':
	    subOption = subOptions.gwangju;
	    break;
	  case '대구':
	    subOption = subOptions.daegu;
	    break;
	  case '대전':
	    subOption = subOptions.daejeon;
	    break;
	  case '부산':
	    subOption = subOptions.busan;
	    break;
	  case '서울':
	    subOption = subOptions.seoul;
	    break;
	  case '세종특별자치시':
	    subOption = subOptions.sejong;
	    break;
	  case '울산':
	    subOption = subOptions.ulsan;
	    break;
	  case '인천':
	    subOption = subOptions.incheon;
	    break;
	  case '전남':
	    subOption = subOptions.jeonnam;
	    break;
	  case '전북':
	    subOption = subOptions.jeonbuk;
	    break;
	  case '제주특별자치도':
	    subOption = subOptions.jeju;
	    break;
	  case '충남':
	    subOption = subOptions.choongnam;
	    break;
	  case '충북':
	    subOption = subOptions.choongbuk;
	    break;
	}
	$subCity.options.length = 0;
	for (let i = 0; i < subOption.length; i++) {
	  const option = document.createElement('option');
	  option.innerText = subOption[i];
	  $subCity.append(option);
	}
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
const removeAllChildNodes = function(el) {
  while(el.hasChildNodes()) {
    el.removeChild(el.lastChild);
  }
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
const removeMarker = function() {
  for(let i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers.length = 0;
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
const displayInfowindow = function(marker, title) {
  const content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

  infowindow.setContent(content);
  infowindow.open(map, marker);
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
const addMarker = function(position, idx, title) {
  const imageSrc = '../../images/markerIcon.png'; // 마커 이미지 url, 스프라이트 이미지를 씁니다
  const imageSize = new kakao.maps.Size(63, 100);

  const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
  const marker =      new kakao.maps.Marker({
        position : position, // 마커의 위치
        image : markerImage
  });

  marker.setMap(map);   // 지도 위에 마커를 표출
  markers.push(marker); // 배열에 생성된 마커를 추가
  return marker;
}

// 검색결과 항목을 Element로 반환하는 함수입니다
const getListItem = function(index, places) {
  let el = document.createElement('li');

  let itemStr = '<span class="markerbg marker_' + '"></span>' +
  '<div class="info">' +
  '   <h5>' + places.place_name + '</h5>';

  if(places.road_address_name) {
    itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
  } else {
    itemStr += '    <span>' +  places.address_name  + '</span>';
  }

  itemStr += '  <span class="tel">' + places.phone  + '</span>' + '</div>';

 	el.innerHTML = itemStr;
  el.className = 'item';
	return el;
}

const displayPlaces = function(places) {
  const $listEl = document.querySelector('#placesList');
  const $menuEl = document.querySelector('#menu_wrap');
  const fragment = document.createDocumentFragment();
  const bounds = new kakao.maps.LatLngBounds();
  let listStr = '';

  removeAllChildNodes($listEl);

  removeMarker();

  for ( let i=0; i<places.length; i++ ) {

    const placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
    const marker = addMarker(placePosition, i);
    const itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    if (i === 0) {
      bounds.extend(placePosition);
    }

    // 마커와 검색결과 항목에 mouseover 했을때
    // 해당 장소에 인포윈도우에 장소명을 표시합니다
    // mouseout 했을 때는 인포윈도우를 닫습니다
    (function(marker, title) {
      kakao.maps.event.addListener(marker, 'mouseover', function() {
        displayInfowindow(marker, title);
        map.panTo(placePosition);
        console.log(placePosition);
      });
      kakao.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
      });
      itemEl.onmouseover =  function () {
        displayInfowindow(marker, title);
        map.panTo(placePosition);
      };
      itemEl.onmouseout =  function () {
        infowindow.close();
      };
    })(marker, places[i].place_name);
    fragment.appendChild(itemEl);
  }
  // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
  $listEl.appendChild(fragment);
  $menuEl.scrollTop = 0;
  // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
  map.setBounds(bounds);
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
const displayPagination = function(pagination) {
  const $paginationEl = document.querySelector('#pagination');
  const fragment = document.createDocumentFragment();
  let i;

  // 기존에 추가된 페이지번호를 삭제합니다
  while ($paginationEl.hasChildNodes()) {
		  $paginationEl.removeChild ($paginationEl.lastChild);
  }

  for (i=1; i<=pagination.last; i++) {
    let el = document.createElement('a');
    el.href = "#";
    el.innerHTML = i;
    if (i===pagination.current) {
      el.className = 'on';
    } else {
      el.onclick = (function(i) {
        return function() {
          pagination.gotoPage(i);
        }
      })(i);
    }
    fragment.appendChild(el);
  }
  $paginationEl.appendChild(fragment);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
const placesSearchCB = function(data, status, pagination) {
  if (status === kakao.maps.services.Status.OK) {
		// 정상적으로 검색이 완료됐으면
    // 검색 목록과 마커를 표출합니다
    displayPlaces(data);

    // 페이지 번호를 표출합니다
    displayPagination(pagination);

  } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

    alert('검색 결과가 존재하지 않습니다.');
    return;

  } else if (status === kakao.maps.services.Status.ERROR) {

    alert('검색 결과 중 오류가 발생했습니다.');
    return;

  }
}

// 키워드 검색을 요청하는 함수입니다
const searchPlaces = function() {
  let keyword = document.querySelector('#keyword').value;

  if(keyword === "") {
    let selectedMainCity = $mainCity.options[$mainCity.selectedIndex].value;

    const $subCity = document.querySelector('.sub-city');
    let selectedSubCity = $subCity.options[$subCity.selectedIndex].innerText;

    let searchArea = '';

    if (selectedMainCity === 'none') {
      selectedMainCity = '';
    } else {
      selectedMainCity = selectedMainCity;
    }
    if (selectedSubCity === '구/군 선택') {
      selectedSubCity = '';
    }
    searchArea = selectedMainCity + selectedSubCity;

    keyword = searchArea + '베스킨라빈스';
  } else {
    keyword += '베스킨라빈스';
  }

  console.log(keyword);

  if (!keyword.replace(/^\s+|\s+$/g, '')) {
    alert('키워드를 입력해주세요!');
    return false;
  }
  // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
  ps.keywordSearch( keyword, placesSearchCB);
}

// 키워드로 장소를 검색합니다
searchPlaces();
// ================== 함수부 ==================

// const $searchArea = document.querySelector(".searchArea");