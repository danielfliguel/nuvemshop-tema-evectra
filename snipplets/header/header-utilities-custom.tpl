<div class="d-flex justify-content-between w-100">
    <div class="col-auto d-none d-lg-block">
        <div class="d-flex welcome-header align-items-center gap-between">
            <svg class="icon-inline icon-lg icon-primary"><use xlink:href="#user"/></svg>
            <span class="font-weight-semi-bold">{{ 'Bien venido' | translate }}</span>
        </div>
        {% if not customer %}
            <span class="nav-accounts-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'js-login nav-accounts-link') }}</span>
            <span>ou</span>
            {% if 'mandatory' not in store.customer_accounts %}
                <span class="nav-accounts-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'nav-accounts-link') }}</span>
            {% endif %}
            {% else %}
            <li class="nav-accounts-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'nav-accounts-link') }}</li>
            <li class="nav-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'nav-accounts-link') }}</li>
        {% endif %}
    </div>
    {% if store.whatsapp %}
        <div class="col-auto d-none d-lg-block">
            <a class="whatsapp-header d-flex gap-between" target="_blank" href="{{ store.whatsapp }}">
                <svg class="icon-inline icon-lg"><use xlink:href="#whatsapp"/></svg>
                <span class="font-weight-semi-bold">{{ 'Comprar por Whatsapp' | translate }}
            </a>
            <a class="whatsapp-header d-block font-weight-semi-bold" target="_blank" href="{{ store.whatsapp }}">
                {% include "snipplets/whatsapp-formatted-text.tpl" %}
            </a>
        </div>
    {% endif %}
    <div class="col-auto">
        <div id="ajax-cart" class="cart-summary transition-soft utility-head text-center" data-component='cart-button'>
			<a {% if settings.ajax_cart and template != 'cart' %}href="#" class="js-modal-open js-toggle-cart js-fullscreen-modal-open" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart"{% else %}href="{{ store.cart_url }}"{% endif %}>
				<svg class="icon-inline icon-2x icon-w-19 icon-text {{ icon_desktop_class }}"><use xlink:href="#cart"/></svg>
				<span class="js-cart-widget-amount badge badge-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
			</a>	
		</div>
    </div>
</div>