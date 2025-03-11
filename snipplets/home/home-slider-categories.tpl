{% set has_main_slider = settings.slider_categories and settings.slider_categories is not empty %}

<section class="section-banners-categories-home banners-categories-slider" data-store="banner-home-categories-slider">

    <div class="container position-relative">
        <div class="row">
            <div class="js-home-slider-categories swiper-container">
                <div class="swiper-wrapper d-flex justify-content-center">
                    {% set slider = settings.slider_categories %}
                    {% for slide in slider %}
                        <div class="slide-category-item text-center swiper-slide">
                            {% if slide.link %}
                            <a href="{{ slide.link }}">
                            {% endif %}
                            <img class="slide-category-image w-100" src="{{ slide_src }}" srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" />
                            {% if slide.title %}
                            <p class="slide-category-title d-flex justify-content-center align-items-center text-primary mb-0">{{ slide.title | raw }}</p>
                            {% endif %}
                            {% if slide.link %}
                            </a>
                            {% endif %}
                        </div>
                    {% endfor %}
                </div>
                
            </div>
        </div>
        <div class="js-swiper-home-categories-prev swiper-button-prev d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <svg width="18" height="27" viewBox="0 0 18 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M14.5966 3.35029L4.46809 13.3722C4.46809 13.3722 6.83986 15.744 8.35959 17.2637C10.7953 19.6994 14.5966 23.5008 14.5966 23.5008" stroke="#04065A" stroke-width="6" stroke-linecap="round"/>
            </svg>
        </div>
        <div class="js-swiper-home-categories-next swiper-button-next d-none d-md-flex align-items-center justify-content-center svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %} border-none bg-white">
            <svg width="18" height="27" viewBox="0 0 18 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M3.40337 23.6497L13.5319 13.6278C13.5319 13.6278 11.1601 11.256 9.64041 9.73628C7.20469 7.30056 3.40336 3.49922 3.40336 3.49922" stroke="#04065A" stroke-width="6" stroke-linecap="round"/>
            </svg>
        </div>
    </div>
</section>