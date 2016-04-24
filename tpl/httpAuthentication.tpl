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
                        {% include './transaction/http_authentication/commonpractices.tpl' %}
                    {% else %}
                        {% include './transaction/http_authentication/instruction.tpl' %}

                        {% include './transaction/http_authentication/packet.tpl' %}
                        {% include './transaction/http_authentication/adminPanel.tpl' %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
