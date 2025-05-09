<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>${friendName}님과의 채팅</title>
	<style>
		.chat-bubble {
			max-width: 60%;
			padding: 10px;
			border-radius: 12px;
			margin: 5px 0;
			display: inline-block;
		}
		.chat-left {
			background-color: #f1f1f1;
			text-align: left;
			float: left;
			clear: both;
		}
		.chat-right {
			background-color: #dcf8c6;
			text-align: right;
			float: right;
			clear: both;
		}
		#chatContainer {
			width: 100%;
			height: 300px;
			overflow-y: auto;
			border: 1px solid #ccc;
			padding: 10px;
		}
	</style>
	<script>
		const friendName = "${friendName}";
		
		let socket = null;

		function connect() {
			socket = new WebSocket("ws://localhost:8485/chat");

			socket.onopen = function () {
				setStatus("✅ WebSocket 연결됨");
			};

			socket.onmessage = function (event) {
				appendMessage(friendName + ": " + event.data, false); // 친구 이름으로 출력
			};

			socket.onclose = function () {
				setStatus("❌ 연결 종료됨");
			};

			socket.onerror = function (error) {
				setStatus("⚠️ 오류 발생: " + error);
			};
		}

		// ✅ 상태 메시지는 따로 표시
		function setStatus(msg) {
			const statusBox = document.getElementById("wsStatusBox");
			statusBox.textContent = msg;
		}

		// ✅ 채팅 말풍선 출력 (기존 appendMessage 그대로 사용)
		function appendMessage(msg, isMine) {
			const container = document.getElementById("chatContainer");
			const div = document.createElement("div");
			div.className = "chat-bubble " + (isMine ? "chat-right" : "chat-left");
			div.textContent = msg;
			container.appendChild(div);
			container.scrollTop = container.scrollHeight;
		}

		function sendMessage() {
			const message = document.getElementById("message").value;
			if (socket && socket.readyState === WebSocket.OPEN) {
				socket.send("${friendId}:" + message); // receiverId:message 형태
				appendMessage("나: " + message, true);
				document.getElementById("message").value = "";
			} else {
				appendMessage("🚫 WebSocket 연결 안 됨");
			}
		}
		
		// 엔터키 입력 시 전송
		document.addEventListener("DOMContentLoaded", function () {
			const input = document.getElementById("message");
			input.addEventListener("keydown", function (event) {
				if (event.key === "Enter") {
					event.preventDefault(); // 줄바꿈 방지
					sendMessage(); // 전송 함수 호출
				}
			});
		});

	</script>
</head>

<body onload="connect()">

	<!-- WebSocket 상태 영역 (채팅창 밖) -->
	<div id="wsStatusBox" style="margin-bottom: 10px; font-weight: bold; color: green;"></div>
	

<h2>💬 ${friendName} 님과의 채팅</h2>

<div id="chatContainer">
	<c:forEach var="msg" items="${chatMessages}">
		<c:choose>
			<c:when test="${msg.senderId == myId}">
				<div class="chat-bubble chat-right">
					나: ${msg.message}
				</div>
			</c:when>
			<c:otherwise>
				<div class="chat-bubble chat-left">
					${friendName}: ${msg.message}
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>

<br>
<p>
	<input type="text" id="message" placeholder="메시지를 입력하세요" />
	<button onclick="sendMessage()">전송</button>
</p>

<a href="/friend">🔙 친구 목록으로 돌아가기</a>

</body>
</html>
