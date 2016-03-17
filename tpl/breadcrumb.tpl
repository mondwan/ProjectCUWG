<ul class="breadcrumb">
    {% for tab in breadcrumb %}
        {% if tab.active %}
            <li class="active">{{tab.name}}</li>
        {% else %}
            <li>
                <a href="{{tab.href}}">{{tab.name}}</a>
            </li>
        {% endif %}
    {% endfor %}
</ul>
