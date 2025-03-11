<div class="col col-md-10 text-center">
    {% if settings.ad_bar %}
        <div class="row justify-content-end">
            {% for item in ['ad_bar_01', 'ad_bar_02', 'ad_bar_03'] %}
                {% set ad_item_show = attribute(settings,"#{item}_show") %}
                {% set ad_icon = attribute(settings,"#{item}_icon") %}
                {% set ad_text = attribute(settings,"#{item}_text") %}
                {% set ad_url = attribute(settings,"#{item}_url") %}
                {% if ad_item_show %}
                    <div class="col-md-auto d-flex ad-item gap-between align-items-center justify-content-center">
                        {% include "snipplets/svg/icons-adbar-and-banner-services-path.tpl" with {'item' : ad_icon, 'custom_class' : 'icon-primary'} %}
                        {% if ad_url %}
                            <a class="text-secondary ad-link" href="{{ ad_url | setting_url }}">
                        {% endif %}
                            {% if ad_text %}
                                <p class="ad-text text-secondary mb-0">{{ ad_text }}</p>
                            {% endif %} 
                        {% if ad_url %}
                            </a>
                        {% endif %}
                    </div>
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}         
</div>