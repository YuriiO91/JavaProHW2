<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<% String answer = (String) session.getAttribute("answer"); %>

<% if (answer == null || "".equals(answer)) {%>
<form action="/question" method="POST">
    <fieldset>
        <legend>Привіт Юзер, скільки буде 2+2=?</legend>

        <div>
            <input type="radio" id="four" name="myanswer" value="four">
            <label for="four">4</label>
        </div>

        <div>
            <input type="radio" id="five" name="myanswer" value="five">
            <label for="five">5</label>
        </div>

    </fieldset>

    <input type="submit" id="qOne"/>
</form>
<%} else if ("5".equals(answer) || "4".equals(answer)) { %>
<form action="/question" method="POST">
    <fieldset>
        <legend>Доповни цитату "Найбільша замкова щілина в історії людства –..."</legend>

        <div>
            <input type="radio" id="internet" name="myanswer" value="internet">
            <label for="four">Інтернет</label>
        </div>

        <div>
            <input type="radio" id="tv" name="myanswer" value="tv">
            <label for="five">Телебачення</label>
        </div>

    </fieldset>

    <input type="submit" id="qTwo"/>
</form>
<%} else if ("internet".equals(answer) || "tv".equals(answer)){ %>
<% int aOne = (int) session.getAttribute("aOne"); %>
<% int aTwo = (int) session.getAttribute("aTwo"); %>
<% int aThre = (int) session.getAttribute("aThre"); %>
<% int aFour = (int) session.getAttribute("aFour"); %>
<h1> 2+2=? </h1>
<p> 5 - відповіли : <%= aOne%>
</p>
<p> 4 - відповіли : <%= aTwo%>
</p>
<br/>
<h1> Доповни цитату "Найбільша замкова щілина в історії людства –..." </h1>
<p> Інтернет - відповіли : <%= aOne%>
</p>
<p> Телебачення - відповіли : <%= aTwo%>
</p>
<%} %>
<br/>
<br>Щоб перепройти тест натистніть посилпння: <a href="/question?a=exit">reply again</a>
</body>
</html>