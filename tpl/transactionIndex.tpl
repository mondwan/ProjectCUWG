{% autoescape on %}
<html>
    <head>
        {% include 'commonHeader.tpl' %}
    </head>
    <body>

      <div class="container">
        <div class="row">
            <div class="col-xs-12">
				{% include 'breadcrumb.tpl' %}
                <h1>{{Category}}</h1>

                <div class="col-xs-12">
                    <strong>Challenges: Transaction</strong>
                    <div class="list-group">
                        <a href="/transaction/cookies" class="list-group-item">Cookies - Insecure Session Id</a>
                        <a href="/transaction/sessionHijack" class="list-group-item">Session - Session Hijack</a>
                        <a href="/transaction/httpAuthentication" class="list-group-item">Session - Http Authentication</a>
                    </div>
                </div>
            </div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
