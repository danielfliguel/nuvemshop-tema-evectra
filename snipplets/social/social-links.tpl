{% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
    {% set sn_url = attribute(store,sn) %}
    {% if sn_url %}
        <a class="social-icon icon-primary" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
            {% if sn == "facebook" %}
                {% set social_network = sn ~ '-f' %}
            {% else %}
                {% set social_network = sn %}
            {% endif %}
            {% set icon_class = 'icon-inline icon-lg' %}
            <svg class="{{ icon_class }} {{ icon_custom_class }}"><use xlink:href="#{{ social_network }}"/></svg>
        </a>
    {% endif %}
{% endfor %}