{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set empty_placeholder_image = 'images/empty-placeholder.png' | static_url %}

{% set slide_item = slide_item | default(false) %}
{% set columns = settings.grid_columns %}

{% if slide_item %}
    <div class="swiper-slide{% if settings.theme_rounded %} p-3{% endif %}">
{% endif %}
{% if settings.theme_rounded %}
    <div class="js-item-product {% if not slide_item %} {% if columns == 1 %}col-12 col-md-6 col-lg-4{% else %}col-6 col-md-4 col-lg-3{% endif %}{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}">
        <div class="item item-rounded item-product box-rounded p-0">
{% else %}
    <div class="js-item-product {% if not slide_item %} {% if columns == 1 %}col-12 col-md-6 col-lg-4{% else %}col-6 col-md-4 {% if template != 'category' %}col-lg-3{% endif %}{% endif %}{% endif %} item item-product" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}">
{% endif %}
        {% if settings.quick_shop or settings.product_color_variants %}
            <div id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}" class="js-product-container bg-white border-radius-15 js-quickshop-container position-relative {% if product.variations %}js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}">
        {% endif %}
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

        {% set item_img_width = product.featured_image.dimensions['width'] %}
        {% set item_img_height = product.featured_image.dimensions['height'] %}
        {% set item_img_srcset = product.featured_image %}
        {% set item_img_alt = product.featured_image.alt %}
        {% set item_img_spacing = item_img_height / item_img_width * 100 %}
        {% set show_secondary_image = settings.product_hover and product.other_images %}

        <div class="{% if show_secondary_image %}js-item-with-secondary-image{% endif %} item-image{% if columns == 1 %} item-image-big{% endif %}">
            <div style="padding-bottom: {{ item_img_spacing }}%;" class="position-relative" data-store="product-item-image-{{ product.id }}">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" >
                    <img alt="{{ item_img_alt }}" data-expand="-10" src="{{ empty_placeholder_image }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w, {{ item_img_srcset | product_image_url('large')}} 480w" class="js-item-image lazyautosizes lazyload img-absolute img-absolute-centered fade-in {% if show_secondary_image %}item-image-primary{% endif %}" width="{{ item_img_width }}" height="{{ item_img_height }}" /> 
                    <div class="placeholder-fade">
                    </div>

                    {% if show_secondary_image %}
                        {% set secondary_image = product.other_images | first %}
                        <img alt="{{ item_img_alt }}" data-sizes="auto" src="{{ empty_placeholder_image }}" data-srcset="{{ secondary_image | product_image_url('small')}} 240w, {{ secondary_image | product_image_url('medium')}} 320w, {{ secondary_image | product_image_url('large')}} 480w" class="js-item-image js-item-image-secondary lazyautosizes lazyload img-absolute img-absolute-centered fade-in item-image-secondary" style="display:none;" />
                    {% endif %}
                </a>
            </div>
            {% if settings.product_color_variants %}
                {% include 'snipplets/labels.tpl' with {color: true} %}
                {% include 'snipplets/grid/item-colors.tpl' %}
            {% else %}
                {% include 'snipplets/labels.tpl' %}
            {% endif %}
            {% if (settings.quick_shop or settings.product_color_variants) and product.available and product.display_price and product.variations %}
                <div class="item-buy{% if settings.product_color_variants and not settings.quick_shop %} hidden{% endif %}">
                    <div class="js-item-variants item-buy-variants{% if settings.theme_rounded %} px-1 py-2 p-md-3{% endif %}">
                        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                            {% endif %}
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            {# Add to cart CTA #}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-small w-100 mb-2"} %}
                        </form>
                        <a href="#" class="js-item-buy-close">
                            <svg class="icon-inline icon-lg svg-circle svg-icon-text"><use xlink:href="#times"/></svg>
                        </a>
                    </div>
                </div>
            {% endif %}
        </div>
        <div class="item-description py-4{% if settings.theme_rounded %} px-3{% else %} px-1{% endif %}" data-store="product-item-info-{{ product.id }}">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                <div class="js-item-name item-name mb-3 font-weight-semi-bold" data-store="product-item-name-{{ product.id }}">{{ product.name }}</div>
                {% if product.display_price %}
                    <div class="item-price-container mb-1" data-store="product-item-price-{{ product.id }}">
                        <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                            {{ product.compare_at_price | money }}
                        </span>
                        <span class="js-price-display item-price">
                            {{ product.price | money }}
                        </span>
                    </div>
                {% endif %}
            </a>
            {% include 'snipplets/price-pix.tpl' %}
            {% if settings.product_installments %}
                {{ component('installments', {'location' : 'product_item', container_classes: { installment: "item-installments"}}) }}
            {% endif %}
        </div>
        {% if settings.quick_shop %}
            <div class="item-actions gap-between d-flex justify-content-center{% if settings.theme_rounded %} m-0 mb-3{% endif %}">
                
                {% if product.available and product.weight > 0 %}
                    <div class="col-md-6 col-12 p-0">
                        {% if product.variations %}
                            <a href="#" class="js-item-buy-open item-buy-open border-none d-flex align-items-center gap-between-md justify-content-center btn border-radius-8 btn-secondary btn-small bg-buy" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}">
                                <svg class="icon-inline icon-grid icon-white"><use xlink:href="#bag"/></svg>
                                <span class="text-white font-weight-bold">{{ 'Comprar' | translate }}</span>
                            </a>
                        {% else %}
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                {% if product.weight > 0 and settings.quote %}
                                <button type="submit" class="js-addtocart js-prod-submit-form border-none d-flex align-items-center gap-between-md justify-content-center btn border-radius-8 btn-secondary btn-small bg-buy {{ state }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}">
                                    <svg class="icon-inline icon-grid icon-white"><use xlink:href="#bag"/></svg>
                                    <span class="text-white font-weight-bold">{{ texts[state] | translate }}</span>
                                </button>
                                {% endif %}

                                {# Fake add to cart CTA visible during add to cart event #}

                                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-small w-100 mb-2", direct_add: true} %}
                            </form>
                        {% endif %}
                    </div>
                {% endif %}
                <div class="{% if product.available and product.display_price and product.weight > 0 %}col-md-6 col-12 p-0{% else %}col-12{% endif %}">
                    {% if settings.quote %}
                    <a href="/contato/?product={{ product.id }}" aria-label="{{ product.name }}" class="d-flex align-items-center gap-between-md {% if product.weight > 0 %} justify-content-center{% else %}justify-content-center{% endif %} border-none btn border-radius-8 btn-secondary btn-small bg-text">
                        <svg class="icon-inline icon-grid icon-white"><use xlink:href="#calculator"/></svg>
                        <span class="text-white font-weight-bold">{{ "Presupuestar" | translate }}</span>
                    </a>
                    {% else %}
                    <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="d-block btn btn-secondary btn-small">
                        <svg class="icon-inline svg-icon-primary icon-w-19"><use xlink:href="#eye"/></svg>
                        <span class="{% if product.available and product.display_price %}d-none d-md-inline-block{% endif %}">{{ "Ver" | translate }}</span></a>
                    {% endif %}
                </div>
            </div>
        {% endif %}
        {% if settings.quick_shop or settings.product_color_variants %}
            </div>{# This closes the quickshop tag #}
        {% endif %}

        {# Structured data to provide information for Google about the product content #}
        {{ component('structured-data', {'item': true}) }}
    </div>
{% if settings.theme_rounded %}
    </div>
{% endif %}
{% if slide_item %}
    </div>
{% endif %}
