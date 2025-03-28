<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />

        {# Preload of first image of Slider to improve LCP #}
        {% if template == 'home'%}
            {% snipplet 'preload-images.tpl' %}
        {% endif %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>
            {# Font families #}

            {% if params.preview %}

                {# If page is loaded from customization page on the admin, load all fonts #}

                @import url('https://fonts.googleapis.com/css?family=Barlow:400,700|Muli:400,700|Lato:400,700|Open+Sans:400,700|Lora:400,700|Slabo+27px|Playfair+Display:400,700|Droid+Sans:400,700|Montserrat:400,700|Nunito:400,700|Fredoka+One');

            {% else %}

                {# If page is NOT loaded from customization only load saved fonts #}

                {# Get only the saved fonts on settings #}

                @import url('{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400, 500, 600, 700') | raw  }}');

            {% endif %}

            

            {% include "static/css/style-critical.tpl" %}
        </style>

        {# Custom CSS #}

        {{ 'css/custom.scss.tpl' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss.tpl' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss.tpl' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="{% if settings.head_fix %}js-head-offset head-offset{% endif %} {% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {% if settings.icons_solid %}
            {% include "snipplets/svg/icons-solid.tpl" %}
        {% else %}
            {% include "snipplets/svg/icons-regular.tpl" %}
        {% endif %}

        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Facebook account login and register #}

        {% if template == 'account.login' or template == 'account.register' %}
            {{ fb_js }}
            <script>
                function loginFacebook() {
                    LS.ready.then(function(){
                        LS.facebookLogin(FB, function(status, hasEmail) {
                            if (status === 'connected') {
                                if (hasEmail) {
                                    window.location = "{{ store.url }}/account/facebook_login/";
                                } else {
                                    jQueryNuvem('#login-form').prepend(
                                            "<div class=\"alert alert-danger\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                                }
                            } else {
                                jQueryNuvem('#login-form').prepend(
                                        "<div class=\"alert alert-danger\">{{ 'Debes completar el login.' | translate }}</div>");
                            }
                        });
                    });
                }
            </script>
        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% if template != 'home' or (template == 'home' and settings.slider is empty) %}

        <div>

        {% endif %}

        {% if template == 'home' %}
            {% if settings.slider and settings.slider is not empty %}
                {#  **** Home slider ****  #}
                <section data-store="home-slider">
                    {% include 'snipplets/home/home-slider.tpl' %}
                    {% if settings.toggle_slider_mobile and settings.slider_mobile is not empty %}
                        {% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
                    {% endif %}
                </section>
            {% endif %}
            {% if settings.home_side_navigation_menu %}
                <div class="home-with-side-menu">
                    <div class="d-flex">
                        <div class="col-2 px-0 d-none d-lg-block bg-white">
                            {% include "snipplets/navigation/navigation-panel.tpl" with {primary_links: true} %}
                        </div>
                        <div class="col-12 col-lg-10 pl-lg-5">
            {% endif %}
        {% endif %}

            {% template_content %}
    
        {% if template == 'home' and settings.home_side_navigation_menu %}
                    </div>
                </div>
            </div>
            {% if settings.news_show %}
                {% include 'snipplets/newsletter.tpl' %}
            {% endif %}
        {% endif %}

        {% if template != 'home' or (template == 'home' and settings.slider and settings.slider is not empty) %}

        </div>

        {% endif %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {#% if store.useStoreJsV2() %#}
                    {% include "static/js/store-v2.js.tpl" %}
                {#% else %#}
                    {#% include "static/js/store.js.tpl" %#}
                {#% endif %#}
            });
        </script>

        {# Google reCAPTCHA on register page #}

        {% if template == 'account.register' %}
            {% if not store.hasContactFormsRecaptcha() %}
                {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
            {% endif %}
            <script type="text/javascript">
                var recaptchaCallback = function() {
                    jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
                };
            </script>
        {% endif %}

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

        {{ component('assorted-js', {}) }}

    </body>
</html>
