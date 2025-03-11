<ul class="footer-menu">
	{% for item in menus[settings.footer_menu] %}
		{% set footer_menu_icon = "footer_menu_icon_" ~ loop.index ~ ".png" %}
		{% set footer_menu_icon_show = attribute(settings,"footer_menu_icon_" ~ loop.index ~ "_show") %}
		<li class="footer-menu-item d-flex align-items-center gap-between">
	        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ footer_menu_icon | static_url }}" class="lazyload footer-nav-icon" alt="Ícone" />
			<a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>