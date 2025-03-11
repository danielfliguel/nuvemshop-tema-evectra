{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

{% if settings.news_show %}
    <section class="section-newsletter-home bg-primary" data-store="home-newsletter">
        <div class="container">
            <div class="d-flex mx-lg-auto">
                <div class="col-md-2 col-3 d-flex flex-column justify-content-center">
                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ 'newsletter_icon.png' | static_url }}" class="newsletter-logo lazyload" alt="Ícone da newsletter">
                </div>
                <div class="col-md-6 col-9 mb-3 mb-md-0 d-flex align-items-center">
                    <div class="js-newsletter newsletter">
                        {% if settings.news_title %}
                            <h2 class="news-title title-medium mb-2">{{ settings.news_title }}</h2>
                        {% endif %}
                        {% if settings.news_text %}
                            <p class="font-weight-semi-bold text-medium mb-0">{{ settings.news_text | raw }}</p>
                        {% endif %}
                    
                        {% if contact and contact.type == 'newsletter' %}
                            {% if contact.success %}
                                <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                            {% else %}
                                <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                            {% endif %}
                        {% endif %}

                        
                    </div>
                </div>
                <div class="col-md-4 pl-0">
                    <form class="news-form" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
                        <div class="input-append">
                            {% embed "snipplets/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_placeholder: 'Escriba su nombre' | translate, input_custom_class: "form-control-big border-squared", input_group_custom_class: "mb-1", input_aria_label: 'Nombre' | translate } %}
                            {% endembed %}
                            {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_custom_class: "form-control-big border-squared", input_group_custom_class: "mb-1", input_aria_label: 'Email' | translate } %}
                            {% endembed %}

                        <div class="winnie-pooh" style="display: none;">
                            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                        </div>
                        <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                        <input type="hidden" name="type" value="newsletter" />
                        <input type="submit" name="contact" class="btn bg-buy form-control-big newsletter-btn text-white font-weight-bold" value="{{ "Enviar" | translate }}" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
{% endif %}