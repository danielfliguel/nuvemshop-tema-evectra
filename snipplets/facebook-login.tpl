{% if store_fb_app_id %}

    <a class="btn btn-secondary btn-facebook d-block mb-4" onclick="loginFacebook();" >
        <svg class="icon-inline svg-fb-icon"><use xlink:href="#facebook"/></svg>
        {{ 'Facebook login' | translate }}
    </a>
    {% if result.facebook and result.invalid %}
        <div class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
    {% endif %}

{% endif %}
