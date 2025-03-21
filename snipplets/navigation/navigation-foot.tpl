<ul class="footer-menu">
	{% for item in menus[settings.footer_menu] %}
		<li class="footer-menu-item d-flex align-items-center gap-between">
			<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ settings.footer_menu_icons[loop.index - 1].image | static_url | settings_image_url('large') }}" class="lazyload footer-icon" alt="Ícone {{ slide.title }}">
			<a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>