{% autoescape on %}
<html>
    <head>
        {% include 'commonHeader.tpl' %}
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    {% include 'breadcrumb.tpl' %}
                    {% if isSucceeded %}
                            {% include './xss/javascript/commonpractices.tpl' %}
                    {% else %}
                        {% include './xss/javascript/instruction.tpl' %}
                        
                        {% if sid %}
                            {% include './xss/javascript/product.tpl' %}
                        {% else %}  
                            {% include './xss/javascript/loginForm.tpl' %}

                            {% if passwordIncorrect %}
                                <b>Login Fail, Please try again</b>
                            {% endif %}
                           
                        {% endif %}
                    {% endif %}
                   {% if userError %}
                        <p class="text-warning"><b>
                            Incorrect: the product id is incorrect!
                        </b></p>
                    {% endif %}
                </div>
            </div>
        </div>
        {% include 'commonJSLib.tpl' %}
        
        <script
          type="text/javascript"
          src="/js/xss/javascript.js">
        </script>
    </body>
</html>
{% endautoescape %}
