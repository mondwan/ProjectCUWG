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
                    <strong>Challenges: Authentication</strong>
                    <div class="list-group">
                        <a href="/authentication/password" class="list-group-item">Password - Brute Force</a>
                        <a href="/authentication/hiddenPassword" class="list-group-item">Password - Hidden Password</a>
                        <a href="/authentication/rainbowTable" class="list-group-item">Password - Rainbow Table</a>
                    </div>
                </div>

            </div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
