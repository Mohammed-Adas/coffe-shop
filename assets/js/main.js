let search = document.querySelector('.search-box');

document.querySelector('#search-icon').onclick =() =>{
    search.classList.toggle('active');
    navbar.classList.remove('active');

}
let navbar = document.querySelector('.navbar');

document.querySelector('#menu-icon').onclick =() =>{
    navbar.classList.toggle('active');
    search.classList.remove('active');
}
window.onscroll = () => {
    navbar.classList.remove('active');
    search.classList.remove('active');
}




let header = document.querySelector('header');

window.addEventListener('scroll', () => {
    header.classList.toggle('shadow', window.scrollY > 0);
});



document.getElementById('cart-icon').addEventListener('click', function() {
    window.location.href = 'cart.html';
});




document.addEventListener("DOMContentLoaded", function() {
    var form = document.getElementById("orderForm");
    form.addEventListener("submit", function(event) {
        event.preventDefault();
        var formData = new FormData(form);
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "process_order.asp", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("confirmationMessage").innerHTML = xhr.responseText;
                form.reset(); // Optional: Reset the form after successful submission
            }
        };
        xhr.send(formData);
    });
});

