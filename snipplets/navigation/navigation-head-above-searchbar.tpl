<ul class="header-menu-above-searchbar gap-between-lg list-style-none p-0 d-none d-lg-flex justify-content-start">
	{% for item in menus[settings.header_menu_above_searchbar] %}
		<li class="header-menu-item">
	        <a class="header-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>