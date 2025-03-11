{% set whatsapp_number = store.whatsapp |trim('https://wa.me/') %}
{% set country_code = whatsapp_number|slice(0, 2) %}
{% set state_code = whatsapp_number|slice(2, 2) %}
{% set number_without_code = whatsapp_number[4:] %}
{% if number_without_code | length > 8 %}
	{% set number_first_half = number_without_code[0:5] %}
	{% set number_last_half = number_without_code[5:] %}
{% else %}
	{% set number_first_half = number_without_code[0:4] %}
	{% set number_last_half = number_without_code[4:] %}
{% endif %}

{{ '(' ~ state_code ~ ')' ~ ' ' ~ number_first_half ~ '-' ~ number_last_half }}