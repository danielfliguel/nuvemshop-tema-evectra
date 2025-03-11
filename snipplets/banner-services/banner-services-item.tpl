<div class="service-item-container col-md swiper-slide p-0 px-md-3">
    <div class="service-item mx-4 mx-md-0">
        {% if banner_services_url %}
            <a href="{{ banner_services_url | setting_url }}">
        {% endif %}
        <div class="row align-items-center justify-content-center">
            <div class="col-auto">
                {% include "snipplets/svg/icons-adbar-and-banner-services-path.tpl" with {'item' : banner_services_icon, 'custom_class': 'icon-xl icon-primary'} %}
            </div>
            <div class="w-fit-content">
                <h3 class="h5 m-0 text-primary">{{ banner_services_title }}</h3>
                <p class="m-0 text-primary">{{ banner_services_description }}</p>
            </div>
        </div>
        {% if banner_services_url %}
            </a>
        {% endif %}
    </div>
</div>
