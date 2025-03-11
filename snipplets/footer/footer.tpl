{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-hide-footer-while-scrolling display-when-content-ready" data-store="footer">
	<div class="container">
		<div class="row element-footer">
			
			{% if template != 'password' %}

				<div class="col-lg col-md-6 mb-4">
					{{ component('logos/logo', {logo_img_classes: 'transition-soft mb-5', logo_text_classes: 'h5 h3-md mb-0'}) }}
					{% if has_shipping_logos %}
						<h4 class="text-medium font-weight-semi-bold mb-1">{{ "Medios de envío" | translate }}</h4>
						{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
					{% endif %}
				</div>

				{# About #}
				{% if has_footer_about %}

					<div class="col-lg col-md-6 mb-4">
						{% if settings.footer_about_title %}
							<h4 class="text-medium font-weight-semi-bold">{{ settings.footer_about_title }}</h4>
						{% endif %}
						{% if settings.footer_about_description %}
							<p>{{ settings.footer_about_description }}</p>
						{% endif %}
					</div>

				{% endif %}

				{# Foot Nav #}
				{% if has_footer_menu %}
					<div class="col">
						{% if settings.footer_menu_title %}
							<h4 class="text-medium font-weight-semi-bold">{{ settings.footer_menu_title }}</h4>
						{% endif %}
						{% include "snipplets/navigation/navigation-foot.tpl" %}
					</div>
				{% endif %}

				{# Foot Nav Secondary #}
				{% if has_footer_menu_secondary %}
					<div class="col">
						{% if settings.footer_menu_secondary_title %}
							<h4 class="text-medium font-weight-semi-bold">{{ settings.footer_menu_secondary_title }}</h4>
						{% endif %}
						{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
					</div>
				{% endif %}

				{# Contact info #}
				{% if has_footer_contact_info %}
					<div class="col-lg col-md-6 mb-4">
						{% if settings.footer_contact_title %}
							<h4 class="text-medium font-weight-semi-bold">{{ settings.footer_contact_title }}</h4>
						{% endif %}
						{% include "snipplets/contact-links.tpl" %}
						{% if store.whatsapp %}
							<a href="{{ store.whatsapp }}" target="_blank" class="bg-secondary font-weight-bold form-control-big text-uppercase d-block mt-3 w-fit-content text-small text-primary border-radius-8">{{ "Hable con nosotros" | translate }}</a>
						{% endif %}
					</div>
				{% endif %}

			{% endif %}
			
			{# Social #}
	 		{% if has_social_network %}

				<div class="col-lg col-md-6 mb-4{% if template == 'password' %} text-center{% endif %}">
					{% if settings.footer_social_title %}
						<h4 class="mb-2 text-medium font-weight-semi-bold">{{ settings.footer_social_title }}</h4>
					{% endif %}
					{% include "snipplets/social/social-links.tpl" with {'circle': true} %}

					{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
						{% if "seal_img.jpg" | has_custom_image %}
							<h4 class="mb-2 text-medium font-weight-semi-bold mt-5">{{ "Certificaciones" | translate }}</h4>
							<div class="custom-seal">
								{% if settings.seal_url != '' %}
									<a href="{{ settings.seal_url | setting_url }}" target="_blank">
								{% endif %}
									{% set seal_image = "seal_img.jpg" | static_url %}
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ seal_image | settings_image_url('large') }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}" />
								{% if settings.seal_url != '' %}
									</a>
								{% endif %}
							</div>
						{% endif %}
						{% if settings.custom_seal_code %}
							<div class="custom-seal custom-seal-code">
								{{ settings.custom_seal_code | raw }}
							</div>
						{% endif %}
					{% endif %}
				</div>

			{% elseif show_help %}

				<div class="col-lg col-md-6 mb-4{% if template == 'password' %} text-center{% endif %}">
					{% if settings.footer_social_title %}
						<h4 class="text-medium font-weight-semi-bold">{{ settings.footer_social_title }}</h4>
					{% endif %}

					{# Social icons that work as examples #}
					<a class="social-icon">
						<svg class="icon-inline icon-lg icon-primary"><use xlink:href="#facebook-f"/></svg>
					</a>
					<a class="social-icon">
						<svg class="icon-inline icon-lg icon-primary"><use xlink:href="#instagram"/></svg>
					</a>
					<a class="social-icon">
						<svg class="icon-inline icon-lg icon-primary"><use xlink:href="#twitter"/></svg>
			        </a>
				</div>

			{% endif %}

		</div>

		{% if template != 'password' %}

			{% if has_shipping_payment_logos or has_seal_logos %}

				<div class="divider mb-5"></div>

				<div class="row element-footer">

					{# Logos Payments and Shipping #}
			 		{% if has_shipping_payment_logos %}
			 			<div class="col-md-9">
				 			<div class="footer-payments-shipping-logos">
				 				{% if has_payment_logos %}
				 					<div class="row mb-4">
				 						<div class="col-md-4">
					 						<h4 class="text-medium font-weight-semi-bold">{{ "Medios de pago" | translate }}</h4>
					 					</div>
					 					<div class="col-md-8">
					 						{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
					 					</div>
				 					</div>
								{% endif %}
				 				
							</div>
						</div>
					{% endif %}

					{# AFIP - EBIT - Custom Seal #}
					{% if has_seal_logos %}
		 				<div class="col-md-3">
		 					{% if store.afip %}
		                        <div class="footer-logo afip seal-afip">
		                            {{ store.afip | raw }}
		                        </div>
		                    {% endif %}
		                    {% if ebit %}
		                        <div class="footer-logo ebit seal-ebit">
		                            {{ ebit }}
		                        </div>
		                    {% endif %}
		                    
		 				</div>
					{% endif %}

				</div>

			{% endif %}

		{% endif %}
	</div>
	<div class="footer-addresses bg-secondary py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-3 text-center text-primary footer-text">{{ settings.footer_text | raw }}</div>
				<div class="col-md-3">
					<h4 class="text-medium font-weight-semi-bold">{{ "Nuestras direcciones" | translate }}</h4>
				</div>
				{% if settings.footer_address_1 %}
					<div class="col-md-3 d-flex">
						{% if settings.footer_address_1_url %}
							<a class="d-flex w-100 gap-between-md" href="{{ settings.footer_address_1_url }}" target="_blank">
						{% endif %}
						<svg class="icon-inline icon-lg icon-w icon-primary"><use xlink:href="#map-marker-alt"/></svg>
						<p class="footer-address">{{ settings.footer_address_1 | raw }}</p>
						{% if settings.footer_address_1_url %}
							</a>
						{% endif %}
					</div>
				{% endif %}
				{% if settings.footer_address_2 %}
					<div class="col-md-3 d-flex">
						{% if settings.footer_address_2_url %}
							<a class="d-flex w-100 gap-between-md" href="{{ settings.footer_address_2_url }}" target="_blank">
						{% endif %}
						<svg class="icon-inline icon-lg icon-w icon-primary"><use xlink:href="#map-marker-alt"/></svg>
						<p class="footer-address">{{ settings.footer_address_2 | raw }}</p>
						{% if settings.footer_address_2_url %}
							</a>
						{% endif %}
					</div>
				{% endif %}
				{% if settings.footer_address_3 %}
					<div class="col-md-3 d-flex">
						{% if settings.footer_address_3_url %}
							<a class="d-flex w-100 gap-between-md" href="{{ settings.footer_address_3_url }}" target="_blank">
						{% endif %}
						<svg class="icon-inline icon-lg icon-w icon-primary"><use xlink:href="#map-marker-alt"/></svg>
						<p class="footer-address">{{ settings.footer_address_3 | raw }}</p>
						{% if settings.footer_address_3_url %}
							</a>
						{% endif %}
					</div>
				{% endif %}
			</div>
		</div>
	</div>
	<div class="js-footer-legal footer-legal py-3">
		<div class="container-fluid px-md-5">
			<div class="row">

	            <div class="col-md-9 text-md-left mb-3 mb-md-0">
	                <div class="d-inline-block mr-md-2">
	                   {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
	                </div>
	                {% if store.country == 'AR' %}
	                    <div class="claim-link d-md-inline-block mt-md-0 mt-3">
	                       {{ "Defensa de las y los consumidores. Para reclamos" | translate }}
	                       <a class="font-weight-bold" href="https://www.argentina.gob.ar/produccion/defensadelconsumidor/formulario" target="_blank">{{ "ingrese aquí" | translate }}</a>
	                    </div>
	                {% endif %}
	            </div>

				<div class="col-md text-left text-md-right">
	                {#
	                La leyenda que aparece debajo de esta linea de código debe mantenerse
	                con las mismas palabras y con su apropiado link a Tienda Nube;
	                como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
	                Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
	                tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
	                Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
	                palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
	                http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
	                e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
	                manter visivél e com um link funcionando.
	                #}
	                {{ new_powered_by_link }}
	            </div>
	            
	        </div>
    	</div>
    </div>
</footer>