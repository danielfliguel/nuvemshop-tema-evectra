{% embed "snipplets/page-header.tpl" %}
	{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page  #}

<section class="user-content pb-5">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-10 bg-white p-lg-5 p-md-3 p-2 border-radius-10 page-content-container text-medium">
				{{ page.content }}
			</div>
		</div>
	</div>
</section>
