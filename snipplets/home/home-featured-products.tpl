{% set has_featured = has_featured | default(false) and sections.primary.products %}
{% set has_new = has_new | default(false) and sections.new.products %}
{% set has_sale = has_sale | default(false) and sections.sale.products %}
{% set has_extra1 = has_extra1 | default(false) and sections.extra1.products %}
{% set has_extra2 = has_extra2 | default(false) and sections.extra2.products %}

{% if has_featured %}
    {% set data_store_name = 'featured' %}
{% elseif has_new %}
    {% set data_store_name = 'new' %}
{% elseif has_sale %}
    {% set data_store_name = 'sale' %}
{% elseif has_extra1 %}
    {% set data_store_name = 'extra1' %}
{% else %}
    {% set data_store_name = 'extra2' %}
{% endif %}

{% if has_featured or has_new or has_sale or has_extra1 or has_extra2 %}
    <section class="section-featured-home" data-store="home-products-{{ data_store_name }}">
    	{% if has_featured %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'featured_products': true} %}
        {% endif %}
        {% if has_new %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'new_products': true} %}
        {% endif %}
        {% if has_sale %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'sale_products': true} %}
        {% endif %}
        {% if has_extra1 %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'extra1_products': true} %}
        {% endif %}
        {% if has_extra2 %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'extra2_products': true} %}
        {% endif %}
    </section>
{% endif %}
