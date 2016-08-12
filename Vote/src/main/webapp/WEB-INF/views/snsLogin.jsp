<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<!-- �α��� ��ư ���� ���� -->
<div id="naver_id_login"></div>
<fb:login-button id="btn_login" scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
<a id="kakao-login-btn"></a>
<!-- //�α��� ��ư ���� ���� -->

<!-- ���̹��Ƶ��ηα��� �ʱ�ȭ Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("3yr90lvUPRm9hvhpImQP", "http://127.0.0.1:8080/snsLogin");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<!-- //���̹��Ƶ��ηα��� �ʱ�ȭ Script -->

<!-- īī���α��� �ʱ�ȭ Script -->

<script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('15b8c4e8b3be5e6462297f9437eb9ff4');
    // īī�� �α��� ��ư�� �����մϴ�.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // �α��� ������, API�� ȣ���մϴ�.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            var snsform = document.snsform;
            snsform.sns_id.value = res.id;
            snsform.sns_type.value = 1;
            snsform.submit();
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<!-- //īī���α��� �ʱ�ȭ Script -->

<!-- ���̹��Ƶ��ηα��� Callback������ ó�� Script -->
<script type="text/javascript">
	// ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('�������׸��');
		// ������ �׸��� ���߰��̵带 �����Ͻñ� �ٶ��ϴ�.
		/* alert(naver_id_login.getProfileData('email') + naver_id_login.getProfileData('nickname')
				+ naver_id_login.getProfileData('age') + naver_id_login.getProfileData('id') 
				+ naver_id_login.getProfileData('name')); */
		
		var snsform = document.snsform;
		snsform.sns_id.value = naver_id_login.getProfileData('email');
		snsform.sns_type.value = 2;
		snsform.submit();
	}

	// ���̹� ����� ������ ��ȸ
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
<!-- //���̹��Ƶ��ηα��� Callback������ ó�� Script -->

<!-- ���̽��� �α��� ó�� Script -->
<script>
   // This is called with the results from from FB.getLoginStatus().
   function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
      // response ��ü�� ���� �α��� ���¸� ��Ÿ���� ������ �����ش�. 
      // �ۿ��� ������ �α��� ���¿� ���� �����ϸ� �ȴ�.
      // FB.getLoginStatus().�� ���۷������� �� �ڼ��� ������ ���� �����ϴ�.
      if (response.status === 'connected') {
         // ���̽����� ���ؼ� �α����� �Ǿ��ִ�.
         testAPI();
      } else if (response.status === 'not_authorized') {
         // ���̽��Ͽ��� �α��� ������, �ۿ��� �α����� �Ǿ����� �ʴ�.
         document.getElementById('status').innerHTML = 'Please log '
               + 'into this app.';
      } else {
         // ���̽��Ͽ� �α����� �Ǿ����� �ʴ�. ����, �ۿ� �α����� �Ǿ��ִ��� ���ΰ� ��Ȯ���ϴ�.
         document.getElementById('status').innerHTML = 'Please log '
               + 'into Facebook.';
      }
   }

   // �� �Լ��� �������� �α��� ��ư�� ���� ó���� ������ �� ȣ��ȴ�.
   // onlogin �ڵ鷯�� �Ʒ��� ���� ÷���ϸ� �ȴ�.
   function checkLoginState() {
      FB.getLoginStatus(function(response) {
         statusChangeCallback(response);
      });
   }

   window.fbAsyncInit = function() {
      FB.init({
         appId : '182856515465043',
         cookie : true, // ��Ű�� ������ ������ �� �ֵ��� ���
         xfbml : true, // �Ҽ� �÷������� ������ ó��
         version : 'v2.1' // ���� 2.1 ���
      });

      // �ڹٽ�ũ��Ʈ SDK�� �ʱ�ȭ ������, FB.getLoginStatus()�� ȣ���Ѵ�.
      //.�� �Լ��� �� �������� ����ڰ� ���� �α��� �Ǿ��ִ� ���� 3���� �� �ϳ��� �ݹ鿡 �����Ѵ�.
      // �� 3���� ���´� �Ʒ��� ����.
      // 1. �۰� ���̽��Ͽ� �α��� �Ǿ��ִ�. ('connected')
      // 2. ���̽��Ͽ� �α��εǾ�������, �ۿ��� �α����� �Ǿ����� �ʴ�. ('not_authorized')
      // 3. ���̽��Ͽ� �α����� �Ǿ����� �ʾƼ� �ۿ� �α����� �Ǿ����� ��Ȯ���ϴ�.
      //
      // ������ ������ �ݹ� �Լ��� �� 3������ �ٷ絵�� �Ǿ��ִ�.

      FB.getLoginStatus(function(response) {
         statusChangeCallback(response);
      });

   };

   // SDK�� �񵿱������� ȣ��
   (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id))
         return;
      js = d.createElement(s);
      js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   // �α����� ������ �������� ������ �׷���API�� ȣ���Ѵ�.
   // �� ȣ���� statusChangeCallback()���� �̷������.
   function testAPI() {
         console.log('Welcome!  Fetching your information.... ');
         FB.api('/me', function(response) {
              var snsform = document.snsform;
            snsform.sns_id.value = response.id;
            snsform.sns_type.value = 3;
            alert(snsform.sns_id.value);
             snsform.submit();
         });
   }
</script>
<!-- //���̽��� �α��� ó�� Script -->

<form name="snsform" method="post" action="/user/login">
	<input type="hidden" name="sns_id"/>
	<input type="hidden" name="sns_type"/>
</form>
</body>
</html>