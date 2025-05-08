<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.boot.dto.CustomerDTO" %>
<%
	CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	if (customer == null) {
		response.sendRedirect("/log/login");
		return;
	}
	int customerId = customer.getId(); // 여기를 getId()로 수정
%>
<html>
<head>
	<title>채팅 - 고객용</title>
	<script>
		let socket = null;

		function connect() {
			socket = new WebSocket("ws://localhost:8485/chat");

			socket.onopen = function () {
				appendMessage("✅ WebSocket 연결됨");
			};

			socket.onmessage = function (event) {
				appendMessage("📩 받은 메시지: " + event.data);
			};

			socket.onclose = function () {
				appendMessage("❌ 연결 종료됨");
			};

			socket.onerror = function (error) {
				appendMessage("⚠️ 오류 발생: " + error);
			};
		}

		function sendMessage() {
			const receiverId = document.getElementById("receiver").value;
			const message = document.getElementById("message").value;
			if (socket && socket.readyState === WebSocket.OPEN) {
				socket.send(receiverId + ":" + message);
				appendMessage("📤 보낸 메시지: " + message + " → " + receiverId);
			} else {
				appendMessage("🚫 WebSocket 연결 안 됨");
			}
		}

		function appendMessage(msg) {
			const chatBox = document.getElementById("chatBox");
			chatBox.value += msg + "\n";
			chatBox.scrollTop = chatBox.scrollHeight;
		}
	</script>
</head>
<body onload="connect()">

<h2>채팅 - 고객 모드</h2>
<p>내 아이디(ID): <b><%= customerId %></b></p>

<p>
	<label>받는 사람 ID: <input type="text" id="receiver" placeholder="예: 2" /></label>
</p>
<p>
	<label>메시지 내용: <input type="text" id="message" /></label>
	<button onclick="sendMessage()">전송</button>
</p>

<textarea id="chatBox" rows="10" cols="60" readonly></textarea>

</body>
</html>
