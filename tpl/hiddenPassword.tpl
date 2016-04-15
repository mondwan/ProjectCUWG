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

                    {% if isSucceeded %}
                        {% include './authentication/hidden_password/commonpractices.tpl' %}
                    {% else %}
                        {% include './authentication/hidden_password/instruction.tpl' %}

                        {% include './authentication/hidden_password/loginForm.tpl' %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
        <script
          type="text/javascript"
          src="/js/authentication/hiddenPassword.js">
        </script>
    </body>
</html>
{% endautoescape %}
