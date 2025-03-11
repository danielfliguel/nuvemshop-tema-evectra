{# /** Color variables */ #}
$text: {{ settings.text_color }};
$primary: {{ settings.primary_color }};
$secondary: {{ settings.secondary_color }};
$buy: {{ settings.buy_color }};
$background: {{ settings.background_color }};
$white: #ffffff;

{# /** Settings */ #}

.list-style-none{
    list-style: none!important;
}

.bg-primary{
    background: $primary!important;
}

.bg-text{
    background: $text!important;
}

.text-primary{
    color: $primary!important;
}

.icon-primary{
    fill: $primary!important;
}

.icon-text{
    fill: $text!important;
}

.bg-secondary{
    background: $secondary!important;
}

.text-secondary{
    color: $secondary!important;
}

.icon-secondary{
    fill: $secondary!important;
}

.text-bg{
    color: $background!important;
}

.icon-bg{
    fill: $background!important;
}

.bg-buy{
    background: $buy!important;
}

.icon-xl{
    font-size: 2em!important;
}

.bg-white{
    background: #ffffff!important;
}

.text-white{
    color: #ffffff!important;
}

.icon-white{
    fill: #ffffff!important;
}

.bg-product-form-grey{
    background: #E4E4E4!important;
}

.text-small{
    font-size: 12px!important;
}

.text-medium{
    font-size: 16px!important;
}

.title-medium{
    font-size: 20px;
}

.gap-between{
    gap: 7px;
}

.gap-between-md{
    gap: 15px;
}

.gap-between-lg{
    gap: 30px!important;
}

.w-fit-content{
    width: fit-content!important;
}

.border-squared{
    border-radius: 0!important;
}

.font-weight-medium{
    font-weight: 500!important;
}

.font-weight-semi-bold{
    font-weight: 600!important;
}

.border-none{
    border: none!important;
}

.border-radius-8{
    border-radius: 8px!important;
}

.border-radius-10{
    border-radius: 10px!important;
}

.border-radius-15{
    border-radius: 15px!important;
}

{# /** Header Advertising /* #}

.ad-item{
    svg{
        width: 25px!important;
    }
}

{# /** Header */ #}

header{
    filter: drop-shadow(0px 2px 4px #0000001A);
    background: #F8F8F8!important;
}

.js-search-input.form-control.search-input::placeholder{
    color: $text;
}

.js-search-input.form-control.search-input{
    border-radius: 4px;
    border-color: #D8D8D8;
    padding: 9.5px;
}

{# /** Home Side Menu */ #}

.nav-primary a.active{
    color: $white;
    svg{
        fill: $white;
    }
}

 .nav-primary > .nav-list > .item-with-subitems > div > a.active{
    background: $primary;
 }

 .nav-primary > .nav-list > .item-with-subitems > .list-subitems > .item-with-subitems > div > a.active{
    background: rgba($primary, .6);
 }

 .nav-primary > .nav-list > .item-with-subitems > .list-subitems > .item-with-subitems > .list-subitems > .item-with-subitems > div > a.active{
    background: rgba($primary, .3);
 }


{# /** Slider Home */ #}

.section-slider{
    height: auto;
}

.js-swiper-home-control{
    width: 50px;
    height: 50px;
}

{# /** Services Banners */ #}

.section-informative-banners{
    padding: 15px 0;
}

{# /** Featured Products */ #}

.showcase-title{
    margin-bottom: 40px;
}

.js-product-container{
border: 1px solid rgba(0, 0, 0, 0.10);

}

.section-featured-home{
    .swiper-button-prev, .swiper-button-next{
        filter: drop-shadow(0px 0px 8px rgba(0, 0, 0, 0.25));
    }
}

.home-with-side-menu .swiper-button-prev, .js-swiper-related-prev{
    left: -5px;
}

.home-with-side-menu .swiper-button-next, .js-swiper-related-next{
    right: -5px;
}

.js-product-container{
    padding: 20px 10px;
}

.icon-grid{
    font-size: 25px;
}

.item-actions{
    gap: 5px;
    .btn{
        gap: 5px;
        padding: 8px 10px!important;
        font-size: 15px;
    }
}

.item-name{
    min-height: 32px;
}

{# /** Promotional Banners */ #}

.section-banners-home .row > div{
    padding: 0 5px;
}

.section-banners-home .row > div:last-child{
    padding-right: 0!important;
    padding-left: 5px;
}

{# /** Categories Slider */ #}

.js-swiper-home-categories-prev.swiper-button-prev{
    left: -25px;
}

.js-swiper-home-categories-next.swiper-button-next{
    right: -25px;
}

.slide-category-title{
    height: 40px;
}

{# /** Newsletter */ #}

.newsletter-btn{
    font-size: 15px;
}

{# /** Footer */ #}

.element-footer h4{
    margin-bottom: 35px;
}

footer{
    h4, p, a, li{
        font-family: 'Roboto', sans-serif!important;
    }
}

.footer-text{
   background: #FEF12D;
   border-radius: 11px;
   padding: 10px 40px;
   font-size: 16px;
   margin-bottom: 45px;
}

{# /** Product page */ #}

.form-control.js-shipping-input.form-control-inline{
    border: 1px solid #E9E9E9;
    background: #F6F9F8;
}

input[type=number]::-webkit-outer-spin-button,
input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none!important;
    margin: 0!important;
}

input[type=number] {
    -moz-appearance:textfield!important;
}

.form-control.js-shipping-input.form-control-inline::placeholder{
    color: $text;
    font-size: 15px;
}

.js-calculate-shipping.btn.btn-secondary.btn-block{
    border-radius: 5px;
}

.form-quantity-icon.btn{
    width: 30px;
    height: 30px;
    z-index: 1;
}

.js-quantity-input{
    height: 30px;
}

.form-quantity-container{
    margin: 0 -10px;
}

.js-quantity-down.btn{
    background: #D9D9D9;
}

.js-quantity-up.btn{
    background: $text;
}

.form-quantity-icon svg{
    width: 9px;
}

.form-quantity-container{
    max-width: 85px;
}

.price-and-quantity-container{
    border-bottom-left-radius: 14px;
    border-bottom-right-radius: 14px;
}

.cloud-zoom-big {
  /* Importants necesaries to overide plugin inline styles */
  width: 100%!important;
  overflow:hidden;
  background-color:#fff;
  z-index: 1!important;
  background-repeat: no-repeat;
}
.mousetrap{
  /* Importants necesaries to overide plugin inline styles */
  width: 100%!important;
  z-index: 2!important;
}
.cloud-zoom-wrap{
  max-height: 550px;
  overflow: hidden;
}
.cloud-zoom-loading {
  color:white;
  background:#222;
  padding:3px;
  border:1px solid #000;
}

.desktop-zoom-big {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 1;
  background-position: 50% 50%;
  opacity: 0;
  transition: opacity 0.5s;
}

.desktop-zoom-container {
  cursor: zoom-in;
}

.desktop-zoom-container:hover .product-slider-image:not(.desktop-zoom-big) {
  opacity: 0;
}

.desktop-zoom-container:hover .desktop-zoom-big {
  opacity: 1;
}

{# /** Page */ #}
.page-content-container > p:last-child{
    margin-bottom: 0!important;
}

{# /** Media queries */ #}

@media (max-width: 767px){
    .section-newsletter-home > .container > .d-flex{
        flex-wrap: wrap;
    }

    .title-medium:not(.showcase-title){
        font-size: 16px;
    }

    .price-and-quantity-container .btn-primary{
        padding: 12px 20px;
    }

    .item-actions{
        .btn{
            font-size: 12px;
        }
    }

    .footer-text{
        padding: 15px;
        width: 90%;
        margin-left: auto;
        margin-right: auto;
    }

    .item-actions.d-flex{
        flex-wrap: wrap;
    }

    .item-actions .btn{
        padding: 8px 20px!important;
        width: 100%;
    }

    .js-item-product{
        padding: 0 7.5px;
    }
}

@media (min-width: 768px){
    .section-banners-home .row > div:first-child{
        padding-left: 0!important;
        padding-right: 5px;
    }
}

@media (min-width: 768px) and (max-width: 992px){
    .form-quantity-container{
        max-width: 65%;
    }
}

@media (min-width: 992px){
    .js-search-input.form-control{
        width: 80%;
    }

    .search-input-submit{
        right: 21%;
    }
    
    .header-elements > div:nth-child(3), .header-elements > div:last-child{
        max-height: 100px;
    }

    .logo-img{
        max-height: 120px!important;
        margin: 10px 0;
        max-width: inherit!important;
    }

    .section-newsletter-home .d-flex{
        max-width: 975px;
    }

    .nav-primary .nav-list .nav-list-link{
        padding: 5%!important;
    }

    .nav-primary .nav-list .nav-item{
        border-top-width: 0!important;
        border-top-style: none!important;
    }

    .nav-primary .nav-list-arrow{
        right: 5px!important;
    }

    .product-slider-image{
        width: 75%;
        height: auto!important;
    }

    .nav-list-link:hover{
        transition: .3s;
        background: $primary;
        color: $white;
        svg{
            fill: $white;
        }
    }
}

@media (min-width: 1200px) and (max-width: 1399px){
    .home-with-side-menu{
        --window: 100vw;
        --container: 1140px;
        --difference: calc(var(--window) - var(--container));
        margin-right: calc(var(--difference) / 2);
    }
}

@media (min-width: 1400px) and (max-width: 1649px){
    .home-with-side-menu{
        --window: 100vw;
        --container: 1300px;
        --difference: calc(var(--window) - var(--container));
        margin-right: calc(var(--difference) / 2);
    }
}

@media (min-width: 1400px){
    .category-body .js-item-product{
        -ms-flex: 0 0 25%!important;
        flex: 0 0 25%!important;
        max-width: 25%!important;
    }
}

@media (min-width: 1650px){
    .container {
        max-width: 1570px;
    }

    .home-with-side-menu{
        --window: 100vw;
        --container: 1570px;
        --difference: calc(var(--window) - var(--container));
        margin-right: calc(var(--difference) / 2);
    }

    .title-medium{
        font-size: 24px;
    }

    .product-slider-image{
        width: 65%;
    }
}