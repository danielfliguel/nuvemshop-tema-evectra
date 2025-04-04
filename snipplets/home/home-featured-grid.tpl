{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}
{% set extra1_products = extra1_products | default(false) %}
{% set extra2_products = extra2_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format != 'grid' %}
{% set has_new_products_and_slider = new_products and settings.new_products_format != 'grid' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format != 'grid' %}
{% set has_extra1_products_and_slider = extra1_products and settings.extra1_products_format != 'grid' %}
{% set has_extra2_products_and_slider = extra2_products and settings.extra2_products_format != 'grid' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider or has_extra1_products_and_slider or has_extra2_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set section_title = settings.featured_products_title %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set section_title = settings.new_products_title %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set section_title = settings.sale_products_title %}
{% endif %}
{% if extra1_products %}
    {% set sections_products = sections.extra1.products %}
    {% set section_name = 'extra1' %}
    {% set section_title = settings.extra1_products_title %}
{% endif %}
{% if extra2_products %}
    {% set sections_products = sections.extra2.products %}
    {% set section_name = 'extra2' %}
    {% set section_title = settings.extra2_products_title %}
{% endif %}


<div class="container position-relative">
    <div class="row">
        {% if section_title %}
            <div class="col-12 text-center">
                <h2 class="showcase-title title-medium text-primary h1{% if settings.theme_rounded %} text-primary{% endif %}">{{ section_title }}</h2>
            </div>
        {% endif %}
        {% if use_slider %}
            <div class="col-12 p-0">
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% elseif sale_products %}sale{% elseif extra1_products %}extra1{% else %}extra2{% endif %} swiper-container p-md-1">
                    <div class="swiper-wrapper">
        {% endif %}

        {% for product in sections_products %}
            {% if use_slider %}
                {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name} %}
            {% else %}
                {% include 'snipplets/grid/item.tpl' %}
            {% endif %}
        {% endfor %}

        {% if use_slider %}
                    </div>
                </div>
            </div>
        {% endif %}

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
    {% if use_slider %}
        <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% elseif sale_products %}sale{% elseif extra1_products %}extra1{% else %}extra2{% endif %}-prev swiper-button-prev d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <!--<svg class="icon-inline icon-2x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg>-->
            <svg width="13" height="19" viewBox="0 0 13 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M9.95418 2.95418L3.46797 9.37211C3.46797 9.37211 4.98683 10.891 5.96004 11.8642C7.51985 13.424 9.95418 15.8583 9.95418 15.8583" stroke="#E6643A" stroke-width="4" stroke-linecap="square"/>
            </svg>
        </div>
        <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% elseif sale_products %}sale{% elseif extra1_products %}extra1{% else %}extra2{% endif %}-next swiper-button-next d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <!--<svg class="icon-inline icon-2x ml-1"><use xlink:href="#chevron"/></svg>-->
            <svg width="13" height="19" viewBox="0 0 13 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M3.04582 16.0458L9.53203 9.62789C9.53203 9.62789 8.01317 8.10904 7.03996 7.13582C5.48015 5.57601 3.04582 3.14168 3.04582 3.14168" stroke="#E6643A" stroke-width="4" stroke-linecap="square"/>
            </svg>
        </div>
    {% endif %}
</div>

