📖여행추천가이드
-
여행을 계획할 때 여러 사이트를 돌아다니며 정보를 수집하는 것은 번거로운 일입니다. 이러한 문제를 해결하기 위해, 여행 전 고려해야 할 다양한 조건들을 가시적이고 직관적인 UI로 제공하여 여행 계획의 부담을 줄이고자 합니다. "모두를 위한 접근성과 맞춤형 여행 경험 제공"을 주제로, 젊은 세대부터 고령층까지 모두가 손쉽게 여행을 결정할 수 있도록 돕는 웹 애플리케이션을 기획했습니다. 

<br>

🔗 완성된 웹 애플리케이션 보기
-
<a href="http://jjezen.cafe24.com/bteam" target="_blank">http://jjezen.cafe24.com/bteam</a>

관리자 아이디 : admin<br>
관리자 비밀번호 : admin<br>
<br>


🔗 PPT
-
[실습프로젝트최종발표.pptx](https://github.com/user-attachments/files/18383711/default.pptx)



<br>

## 목차
  - [개발기간](#개발기간)
  - [팀 구성](#팀-구성)
  - [개발환경](#개발환경)
  - [담당한 기능](#담당한-기능)
  - [트러블 슈팅](#트러블-슈팅)
  - [개선할 부분](#개선할-부분)

🗓️개발기간 
-
  + 2024.04.08 ~ 2024.05.03

👥팀 구성
-
  + 유 OO : 팀장, 공지사항 등록 및 수정, 회원가입 시 아이디 및 비밀번호, 이름 유효성 검사 체크, 로그인 시 아이디 저장 체크할 경우 쿠키에 아이디 저장, 회원 아이디 조회 및 비밀번호 변경
  + 장이슬 : 부팀장, ERD 제작, 키오스크 기능, 북마크 등록 및 북마크 조회, 회원 작성글 목록 및 작성 댓글 목록 조회, 회원정보 변경, 회원정보 조회 및 회원 정지, 페이지 네비게이션 및 검색 기능
  + 박 OO : 카카오오븐 프로토타입 제작, 페이지 이동 시 필요한 매개변수를 함수로 만들어 간략화
  + 장 OO : 채팅방 기능, 게시글 조회 및 댓글 등록 및 수정, 삭제 기능, 게시글 등록 및 수정

🛠개발환경
-
  + HTML5, CSS3, JavaScript, Jquery-3.7.1, Apache Tomcat v9.0, MySQL v8.0.36
  + JDK 18.0.2.1, ERMaster, StarUML v6.1.0


🖥담당한 기능
-
  - **MySQL을 이용한 Back-End 개발**
    - 테이블 구조를 설계하고 ERD를 작성하였습니다.
    - DAO 패키지에 DB 연결을 위한 DBManager를, DTO 패키지에 각 테이블의 메소드를 설계하였으며, VO 패키지에 필드를 선언하고 getter, setter를 작성하였습니다.
![ERD](https://github.com/iseuljang/trip_first_teamproject/blob/master/1%EC%B0%A8ERD.png)


  - **키오스크 기능**
    - Ajax를 사용하여 메뉴 클릭 시 이미지와 메뉴 이름을 append하고, input hidden으로 value를 추가해 화면 하단의 카트에 담았습니다. 카트 내 메뉴 클릭 시 remove()로 삭제하도록 구현하였습니다.
    - 메인 페이지의 왼쪽에 있는 계절, 지역, 동행 등의 버튼을 클릭하면 해당 메뉴만 보이도록 display none을 사용해 구현하였습니다.
![키오스크](https://github.com/iseuljang/trip_first_teamproject/blob/master/1%EC%B0%A8%ED%82%A4%EC%98%A4%EC%8A%A4%ED%81%AC.jpg)


  - **회원 조회 및 회원 정지 설정 및 로그인 시 정지 종료일 확인 기능**
    - 관리자 페이지에서 회원 정보를 조회하여 정지일(1주일, 2주일, 한 달, 영구)을 설정하면 ustop(회원 정지 여부), ustopdate(정지 기간), ustopend(정지 종료일)을 SQL update로 변경하여 로그인을 막았습니다.
    - 로그인 시도한 회원의 정지 종료일이 도래하거나 지난 경우, 회원 정지를 해제하도록 구현하였습니다.
![회원조회 및 정지설정 페이지](https://github.com/iseuljang/trip_first_teamproject/assets/173334655/cebe323f-2d91-4801-8804-08435094f12e)

  - **회원 정보 수정 기능**
    - 회원 비밀번호를 입력받아 닉네임, 아이콘, 관심 분야를 변경할 수 있도록 구현하였습니다.
    - 닉네임 변경 사항이 없을 경우와 중복된 닉네임인 경우 변경이 불가능하도록 하였습니다.
![회원정보수정페이지](https://github.com/iseuljang/trip_first_teamproject/assets/173334655/d72164d1-6a3c-4f23-9522-6da9473786ea)
 
  - **게시물 북마크 기능**
    - 로그인한 회원만 북마크할 수 있도록 설계하였습니다.  게시글 조회 후 북마크 버튼 클릭 시 해당 게시글 번호를 Ajax로 bookok.jsp 에  보내고, bookok.jsp 파일에서는 받은 게시글 번호와 session에 저장된 로그인 정보에서 회원번호를 가져와 북마크 등록하도록 구현하였습니다.
    - 북마크 등록 메소드에서 입력받은 게시글 번호와 회원 번호로 조회 후 이미 북마크된 경우, 회원에게 이미 북마크된 게시글이라고 알리도록 구현하였습니다.
  
  - **북마크한 게시물 및 작성한 게시물, 댓글 조회 및 삭제 기능**
    - 로그인한 회원의 북마크한 게시글을 조회할 때, 회원 번호로 북마크 테이블에서 조회한 게시글 번호를 사용하여 게시글 테이블에서 조회하였습니다.
    - 회원이 작성한 게시글과 댓글은 회원 번호로 조회하여 목록을 보여주었습니다.
    - 목록 조회 시 페이지 번호와 페이지당 불러올 게시글 수를 매개변수로 넣어 페이징 기능을 구현하였습니다.
![북마크조회페이지](https://github.com/iseuljang/trip_first_teamproject/assets/173334655/81b2bfe0-aa5a-4afb-b195-78fff715e7f4)

  - **페이지 네비게이션 기능(검색 기능 포함)**
    - 검색 기능 구현 시 검색 키워드를 공백 기준으로 나눠 리스트에 저장하고, 리스트를 매개변수로 넣어 향상된 for문으로 where 조건식에 추가하여 구현하였습니다.
    - 페이지 번호 클릭 시 검색 키워드, 검색 타입(제목, 제목+내용, 닉네임 등), 현재 페이지 번호, 키오스크 페이지에서 선택한 메뉴 등을 매개로 넘겨 페이징 네비게이션 기능을 구현하였습니다.


💡트러블 슈팅
-
  1️⃣ 게시글 줄바꿈 처리 문제
  - 문제 배경
    - 게시글 수정 페이지로 넘어갈 경우, 게시글 조회 페이지의 줄바꿈이 <br> 태그로 보이며 수정 후에도 <br> 태그가 그대로 보여지는 문제가 발생했습니다.
  - 해결 방법
    - 게시글 조회 페이지에서 \n 을 <br>태그로 replace 하고, 수정페이지에서는 <br>태그를 \n으로 replace 하도록 코드를 수정하였습니다.
  - 코드 비교
    - 수정전 게시글 조회페이지 & 수정페이지
        ```
        <!-- view.jsp -->
        <tr>
          <td colspan="2" id="note">
            <%
            String bnote = bvo.getBnote();
            bnote = bnote.replace("<","&lt;");
            bnote = bnote.replace(">","&gt;");
            %>
            <%= bnote %>
          </td>
        </tr>
        ```
        ```
        <!-- modify.jsp -->
        <tr>
          <td width="20%"></td>
          <td align="center" colspan="2">
          <!-- 내용 -->
          <textarea id="bnote" name="bnote" style="width:85%; height:300px;"><%= bvo.getBnote() %></textarea>
          </td>
          <td width="20%"></td>
        </tr>
        ```
    - 수정후 게시글 조회페이지 & 수정페이지
       ```
      <!-- view.jsp -->
      <tr>
        <td colspan="2" id="note">
          <%
          String bnote = bvo.getBnote();
          bnote = bnote.replace("<","&lt;");
          bnote = bnote.replace(">","&gt;");
          bnote = bnote.replace("\n","<br>");
          %>
          <%= bnote %>
        </td>
      </tr>
      ```
      ```
      <!-- modify.jsp -->
      <tr>
        <td width="20%"></td>
        <td align="center" colspan="2">
        <!-- 내용 -->
        <textarea id="bnote" name="bnote" style="width:85%; height:300px;"><%= bvo.getBnote().replace("<br>","\n") %></textarea>
        </td>
        <td width="20%"></td>
      </tr>
      ```
    
- 해당 경험을 통해 알게 된 점
  - 게시글 조회 페이지에서는 게시글 내용이 td 안에서 표시되고, 수정 페이지에서는 textarea에 게시글 내용이 표시되어 이 문제가 발생한다는 것을 알게 되었습니다.

 2️⃣ 회원정지 종료일 확인 문제
  - 문제 배경
    - 로그인 날짜를 기준으로 회원종료일이 되거나 지날 경우 회원 정지가 자동으로 해제되도록 구현하는 부분에서 date.format이 적용되지 않는 문제가 발생했습니다.
  - 해결 방법
    - Java date format을 사용하지 않고 SQL 문법으로 날짜비교하도록 수정하였습니다.
  - 코드 비교
    - 수정전 코드
      ```
        <!-- userDTO -->
        //회원정지 해제
      	public boolean Stopend(userVO vo)
      	{
      		if( this.DBOpen() == false )
      		{
      			return false;
      		}
      		// 현재 시간을 Date 객체로 가져옴
      		Date date = new Date();
      
      		// SimpleDateFormat 객체 생성
      		String datePattern = "yyyy-MM-dd";
      		SimpleDateFormat format = new SimpleDateFormat(datePattern);
      
      		// 문자열로 변환
      		String dateStr = format.format(date);
      		String enddate = format.format(vo.getUstopend());
      		String sql = "";
      		if(enddate.equals(dateStr))
      		{
      			sql  = "update user set ";
      			sql += "ustop = 'N' ";
      			sql += "where uno = " + vo.getUno();
      			this.RunSQL(sql);
      		}
      		
      		this.DBClose();
      		return true;
      	}
        ```        
    - 수정후 코드
       ```
      <!-- userDTO -->
      //회원정지 해제
    	public boolean Stopend(String uid)
    	{
    		if( this.DBOpen() == false )
    		{
    			return false;
    		}
    		
    		String sql = "";
    		sql  = "update user set ";
    		sql += "ustop = 'N', ";
    		sql += "ustopdate = -1 ";
    		sql += "where uid = '" + uid + "' ";
    		sql += " and ustopend <= now()";
    		this.RunSQL(sql);
    		
    		this.DBClose();
    		return true;
    	}
      ```
  - 해당 경험을 통해 알게 된 점
    - Java 문법으로만 해결하려고 하기보다 SQL을 활용하면 보다 쉽게 해결할 수 있다는 것을 알게 되었습니다.

📝개선할 부분
-
  - 게시글 하단의 추천 및 비추천을 클릭하면 새로고침이 발생하며, 중복으로 추천과 비추천이 가능합니다.
  - 댓글 수정 시, 댓글 내용이 textarea로 변경되어 수정되지 않고, 대신 프롬프트 창이 뜨면서 수정이 진행됩니다
  - 페이징을 할 때 10단위로 이동은 가능하지만, 게시글 수가 많을 경우 첫 페이지와 끝 페이지로 이동하는 기능이 필요하다고 생각합니다.
  - 검색 창에서 쌍따옴표("")로 검색할 경우, 조회된 게시글을 클릭해도 조회가 불가능합니다.


<div align="right">
  
[목차로](#목차)

</div>
