{# Product quantity #}
        
<div class="col-lg-4 col-6 pl-md-0">
    <span class="d-block mb-2 text-uppercase text-medium font-weight-bold form-quantity-label">{{ "Cantidad:" | translate }}</span>
    {% set form_quantity_class = settings.product_stock ? ' mb-2' : '' %}

    {% embed "snipplets/forms/form-input.tpl" with{
    type_number: true, input_value: '1',
    input_name: 'quantity' ~ item.id, 
    input_custom_class: 'js-quantity-input bg-white position-relative', 
    input_label: false, 
    input_append_content: true, 
    input_group_custom_class: 'js-quantity form-quantity p-0 border-none' ~ form_quantity_class, 
    form_control_container_custom_class: 'col px-0 form-quantity-container',
    form_data_component: 'product.adding-amount',
    form_control_quantity: true,
    input_min: '1',
    data_component: 'adding-amount.value',
    input_aria_label: 'Cambiar cantidad' | translate } %}
        {% block input_prepend_content %}
        <div class="form-row m-0 align-items-center bg-product-form-grey" data-component="product.quantity">
            <span class="js-quantity-down form-quantity-icon icon-white btn d-flex align-items-center justify-content-center border-radius-4" data-component="product.quantity.minus">
                <svg><use xlink:href="#minus"/></svg>
            </span>
        {% endblock input_prepend_content %}
        {% block input_append_content %}
            <span class="js-quantity-up form-quantity-icon btn d-flex align-items-center justify-content-center border-radius-4" data-component="product.quantity.plus">
                <svg class="icon-white"><use xlink:href="#plus"/></svg>
            </span>
        </div>
        {% endblock input_append_content %}
    {% endembed %}
    {% if settings.product_stock %}
        <div class="font-small pt-2 pb-3 text-center">
            <span class="js-product-stock">{{ product.selected_or_first_available_variant.stock }}</span> {{ "en stock" | translate }}
        </div>
    {% endif %}
</div>