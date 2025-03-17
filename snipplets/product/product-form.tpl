{# Product name and breadcrumbs #}

{% embed "snipplets/page-header.tpl" %}
	{% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
{% endembed %}

{# Product price #}

<div class="price-container bg-white px-3" data-store="product-price-{{ product.id }}">
    <span class="d-block">
	   <h4 id="compare_price_display" class="js-compare-price-display mb-0 price-compare font-weight-normal {% if product_can_show_installments or (product.promotional_offer and not product.promotional_offer.script.is_percentage_off) %}mb-2{% endif %}" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</h4>
    </span>
    <span class="d-inline-block">
    	<h2 class="js-price-display {% if product_can_show_installments or (product.promotional_offer and not product.promotional_offer.script.is_percentage_off) %}mb-2{% endif %}" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</h2>
    </span>
</div>

{% if product.maxPaymentDiscount.value > 0 %}
    <span class="d-block my-1 pl-3 text-featured">{{ 'o' | translate }}</span>
{% endif %}
{% include 'snipplets/price-pix.tpl' %}

{# Promotional text #}

{% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
    <div class="js-product-promo-container" data-store="product-promotion-info">
        {% if product.promotional_offer.script.is_discount_for_quantity %}
            {% for threshold in product.promotional_offer.parameters %}
                <h4 class="mb-3 text-accent"><strong>{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h4>
            {% endfor %}
        {% else %}
            <h4 class="mb-3 text-accent"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4>
        {% endif %}
        {% if product.promotional_offer.scope_type == 'categories' %}
            <p>{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
            {% for scope_value in product.promotional_offer.scope_value_info %}
               {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
            {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
        {% elseif product.promotional_offer.scope_type == 'all'  %}
            <p>{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
        {% endif %}
    </div>
{% endif %}

{# Product installments #}

{% set installments_info = product.installments_info_from_any_variant %}
{% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
{% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

{% if show_payments_info or hasDiscount %}
    <div data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments" class="js-modal-open js-fullscreen-modal-open js-product-payments-container row no-gutters p-3 mb-4" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
            
        {% if show_payments_info %}
            {% set max_installments_without_interests = product.get_max_installments(false) %}
            {% set installments_without_interests = max_installments_without_interests and max_installments_without_interests.installment > 1 %}
            {% set card_icon_color = installments_without_interests ? 'svg-icon-accent' : 'svg-icon-text' %}   

            <div class="col-12 mb-2">
                <span class="float-left mr-2">
                    <svg class="icon-inline icon-lg {{ card_icon_color }}"><use xlink:href="#credit-card"/></svg>
                </span>
                {{ component('installments', {'location' : 'product_detail', container_classes: { installment: "product-detail-installments d-block"}}) }}
            </div>
        {% endif %}

        {% if hasDiscount %}
            <span class="col-12 mb-2">
                <span class="float-left mr-2">
                    <svg class="icon-inline svg-icon-accent icon-lg"><use xlink:href="#money-bill"/></svg>
                </span>
                <span><strong class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}</span>
            </span>
        {% endif %}
        <a id="btn-installments" class="btn-link btn-link-primary font-small col mt-1" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
            <span class="d-table">
                {% if not hasDiscount and not settings.product_detail_installments %}
                    <svg class="icon-inline icon-lg svg-icon-primary mr-1"><use xlink:href="#credit-card"/></svg>
                    {{ "Ver medios de pago" | translate }}
                {% else %}
                    {{ "Ver más detalles" | translate }}
                {% endif %}
            </span>
        </a>
    </div>
{% endif %}

{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
	<input type="hidden" name="add_to_cart" value="{{product.id}}" />
 	{% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" with {show_size_guide: true} %}
    {% endif %}

    {% set show_product_quantity = product.available and product.display_price %}

    {% if settings.last_product and show_product_quantity %}
        <div class="{% if product.variations %}js-last-product {% endif %}text-accent font-weight-bold mb-4"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
            {{ settings.last_product_text }}
        </div>
    {% endif %}

    {# Define contitions to show shipping calculator and store branches on product page #}

    {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

    {% if show_product_fulfillment %}

        {# Shipping calculator and branch link #}

        <div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

            {% if store.has_shipping %}
                {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
            {% endif %}
            {% if store.branches %}

                {# Link for branches #}
                {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
            {% endif %}
        </div>
    {% endif %}

    <div class="d-flex flex-wrap p-3 mb-2 w-100 price-and-quantity-container bg-product-form-grey">
        {% if show_product_quantity and product.weight > 0 %}
            {% include "snipplets/product/product-quantity.tpl" %}
        {% endif %}
        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
        <div class="{% if product.weight > 0 %}col-lg-8{% else %}col-lg-12{% endif %} col-md-6 col-12 pr-md-0">

            {# Add to cart CTA #}

            {% if product.weight > 0 %}
            <button type="submit" class="js-addtocart js-prod-submit-form btn btn-primary gap-between-md d-flex align-items-center justify-content-center bg-buy border-radius-4 btn-block mb-4 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart">
                <svg class="icon-inline icon-grid icon-white"><use xlink:href="#bag"/></svg>
                <span class="text-white font-weight-semi-bold text-uppercase text-medium">{{ texts[state] | translate }}</span>
            </button>
            {% endif %}

            {% if settings.quote %}
                <a href="/contato/?product={{ product.id }}" aria-label="{{ product.name }}" class="product-page-quote-btn d-flex align-items-center justify-content-center gap-between-md border-none btn border-radius-4 btn-primary bg-text">
                    <svg class="icon-inline icon-grid icon-white"><use xlink:href="#calculator"/></svg>
                    <span class="text-white font-weight-semi-bold text-medium text-uppercase">{{ "Solicitud de cotización" | translate }}</span>
                </a>
            {% endif %}

            {# Fake add to cart CTA visible during add to cart event #}

            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "mb-4"} %}
            
        </div>

        {% if settings.ajax_cart %}
            <div class="col-12">
                <div class="js-added-to-cart-product-message mb-4" style="display: none;">
                    <svg class="icon-inline svg-icon-text mr-2 d-table float-left"><use xlink:href="#check-double"/></svg>
                    <span class="d-table">
                        {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-link ml-1 text-primary" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                    </span>
                </div>
            </div>
        {% endif %}
    </div>

    {# Product informative banners #}

    {% include 'snipplets/product/product-informative-banner.tpl' %}
 </form>

{# Product payments details #}

{% include 'snipplets/product/product-payment-details.tpl' %}

