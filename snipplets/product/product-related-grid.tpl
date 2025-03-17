{# /*============================================================================
  #Product Related Grid
==============================================================================*/

#Properties

#Related Slider

#}

{% set related_slider = related_slider | default(false) %}
{% set related_products = [] %}
{% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
{% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}
{% if has_related_products_from_app %}
    {% set related_products = related_products_ids_from_app | get_products %}
{% endif %}
{% if related_products is empty %}
    {% set max_related_products_length = 8 %}
    {% set max_related_products_achieved = false %}
    {% set related_products_without_stock = [] %}
    {% set max_related_products_without_achieved = false %}
    
    {% set products_from_category = category.products | shuffle %}
    {% for product_from_category in products_from_category if not max_related_products_achieved and product_from_category.id != product.id %}
        {%  if product_from_category.stock is null or product_from_category.stock > 0 %}
            {% set related_products = related_products | merge([product_from_category]) %}
        {% elseif (related_products_without_stock | length < max_related_products_length) %}
            {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
        {% endif %}
        {%  if (related_products | length == max_related_products_length) %}
            {% set max_related_products_achieved = true %}
        {% endif %}
    {% endfor %}
    {% if (related_products | length < max_related_products_length) %}
        {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
        {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}
        
        {% set related_products = related_products | merge(related_products_for_refill)  %}
    {% endif %}
{% endif %}

{% if related_products | length > 0 %}
    <div class="container position-relative">
        <div class="row">
            {% if settings.products_related_title %}
                <div class="col-12 mb-3 text-center d-flex gap-between-md align-items-center justify-content-center">
                    <svg class="icon-inline icon-lg"><use xlink:href="#star"/></svg>
                    <h3 class="mb-0 title-medium">{{ settings.products_related_title }}</h3>
                </div>
            {% endif %}
            {% if related_slider %}
                <div class="col-12 p-0">
                    <div class="js-swiper-related swiper-container p-md-1" data-related-products-amount="{{ related_products | length }}">
                        <div class="swiper-wrapper">
            {% endif %}

            {% for related in related_products %}
                {% if related_slider %}
                    {% include 'snipplets/grid/item.tpl' with {'product': related, 'slide_item': true} %}
                {% else %}
                    {% include 'snipplets/grid/item.tpl' with {'product': related} %}
                {% endif %}
            {% endfor %}
        </div>
        
    </div>
{% endif %}
{% if related_slider %}
            </div>
        </div>
        <div class="js-swiper-related-prev swiper-button-prev d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <!--<svg class="icon-inline icon-2x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg>-->
            <svg width="13" height="19" viewBox="0 0 13 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M9.95418 2.95418L3.46797 9.37211C3.46797 9.37211 4.98683 10.891 5.96004 11.8642C7.51985 13.424 9.95418 15.8583 9.95418 15.8583" stroke="#E6643A" stroke-width="4" stroke-linecap="square"/>
            </svg>
        </div>
        <div class="js-swiper-related-next swiper-button-next d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <!--<svg class="icon-inline icon-2x ml-1"><use xlink:href="#chevron"/></svg>-->
            <svg width="13" height="19" viewBox="0 0 13 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M3.04582 16.0458L9.53203 9.62789C9.53203 9.62789 8.01317 8.10904 7.03996 7.13582C5.48015 5.57601 3.04582 3.14168 3.04582 3.14168" stroke="#E6643A" stroke-width="4" stroke-linecap="square"/>
            </svg>
        </div>
    </div>
{% endif %}