$(document).ready(function ($) {

 $("#search-btn").click(function (e) {
        e.preventDefault();

        $(".search-wrapper").fadeIn();
    });

    $("#close-search").click(function (e) {
        e.preventDefault();

        $(".search-wrapper").fadeOut();
    });
    
    $(window).scroll(function () {
        if($(window).scrollTop() > 10) {
            $("nav").addClass('fixed-nav');
        } else {
            $("nav").removeClass('fixed-nav');
        }
    });
});


var loader = document.getElementById("preloader");
window.addEventListener("load", function()
{
    loader.style.display ="none"
});


/*
const hamburger = document.getElementById('hamburger-btn');
const hamburger_list_logo = document.getElementById('logo_responsive');
const hamburger_list_nav_products = document.getElementById('nav-products');

hamburger.addEventListener('click', () =>
{
    hamburger_list_logo.classList.toggle('show');
    hamburger_list_nav_products.classList.toggle('show');
});


 // PC PRODUCTS
const pc = document.getElementById('pc');
const nav_products_pc = document.getElementById('pc-products');

pc.addEventListener('mouseover', () =>
{
    nav_products_pc.classList.toggle('show');
});

pc.addEventListener('mouseout', () =>
{
    nav_products_pc.classList.toggle('show');
});

nav_products_pc.addEventListener('mouseover', () =>
{
    nav_products_pc.classList.toggle('show');
});

nav_products_pc.addEventListener('mouseout', () =>
{
    nav_products_pc.classList.toggle('show');
});


// CONSOLE PRODUCTS
const console = document.getElementById('console');
const nav_products_console = document.getElementById('console-products');

console.addEventListener('mouseover', () =>
{
    nav_products_console.classList.toggle('show');
});

console.addEventListener('mouseout', () =>
{
    nav_products_console.classList.toggle('show');
});

nav_products_console.addEventListener('mouseover', () =>
{
    nav_products_console.classList.toggle('show');
});

nav_products_console.addEventListener('mouseout', () =>
{
    nav_products_console.classList.toggle('show');
});


// MOBILE PRODUCTS
const mobile = document.getElementById('mobile');
const nav_products_mobile = document.getElementById('mobile-products');

mobile.addEventListener('mouseover', () =>
{
    nav_products_mobile.classList.toggle('show');
});

mobile.addEventListener('mouseout', () =>
{
    nav_products_mobile.classList.toggle('show');
});

nav_products_mobile.addEventListener('mouseover', () =>
{
    nav_products_mobile.classList.toggle('show');
});

nav_products_mobile.addEventListener('mouseout', () =>
{
    nav_products_mobile.classList.toggle('show');
});

*/


// SLIDESHOW
$('.owl-carousel').owlCarousel({
    autoplay: true,
    autoplayHoverPause: true,
    autoplayTimeout:2500,
    items:4,
    loop: true,
    responsive:
    {
        0:{
            items:0,
            dots:false
        },

        485:{
            items:1,
            dots:false
        },

        728:{
            items:2,
            dots:false
        },

        960:{
            items:2,
            dots:false
        },

        1200:{
            items:4,
            dots:true
        },
    }
});




