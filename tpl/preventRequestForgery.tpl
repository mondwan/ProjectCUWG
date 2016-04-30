<html>
    <head>
        {% include 'commonHeader.tpl' %}
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    {% include 'breadcrumb.tpl' %}

                    {% if showCommonPracise %}
                        {% include './xss/prevent_request_forgery/commonpractices.tpl' %}
                    {% else %}
                        {% include './xss/prevent_request_forgery/instruction.tpl' %}

                        {% if currentBalance <= 0 %}
                            <h1 class="text-success">Congraulation!</h1>
                            <p> You have transfer all the victim's money</p>
                            <p>
                                You have passed this mission
                                <a href="/xss/preventRequestForgery/commonPractise">
                                    Click here
                                </a> to read common practise.
                            </p>
                        {% endif %}

                        {% include './xss/prevent_request_forgery/bank.tpl' %}

                        {% include './xss/prevent_request_forgery/forum.tpl' %}

                    {% endif %}

                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
    </body>
</html>
