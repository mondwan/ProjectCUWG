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

                    {% if sid %}
                        {% if isSucceeded %}
                            {% include './transaction/session_hijack/commonpractices.tpl' %}
                        {% else %}
                            <p>Your current sid is {{ sid }}</p>

                            {% include './transaction/session_hijack/transferForm.tpl' %}

                            {% if owner %}
                                <p>Transfer as {{owner}}</p>
                            {% endif %}
                        {% endif %}
                    {% else %}
                        {% include './transaction/session_hijack/instruction.tpl' %}
                        {% include './transaction/session_hijack/loginForm.tpl' %}

                        {% if passwordIncorrect %}
                            <b>Login Fail, Please try again</b>
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
