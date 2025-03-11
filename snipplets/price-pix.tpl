{% if product.maxPaymentDiscount.value > 0 %}
    {% set discount = product.maxPaymentDiscount.value %}
    {% set price_discount = product.price/100 - ((discount/100)*(product.price/100)) %}
    <div class="d-flex align-items-center gap-between {% if template == 'product' %}pl-3{% endif %}">
        <svg class="icon-inline icon-lg svg-icon-primary"><use xlink:href="#pix"/></svg>
        <span class="{% if template == 'product' %}product-page h1 text-primary {% else %}h3 text-accent {% endif %}font-weight-bold d-block price-discount">R$ {% if template == 'product' %}<span class="js-price-pix">{% endif %}{{ price_discount | number_format(2,',','.') }}{% if template == 'product' %}</span>{% endif %} <small style="font-size: 10px">no PIX</small></span>
    </div>
{% endif %}