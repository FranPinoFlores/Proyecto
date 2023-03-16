window.onload = function(){
    var botones = document.querySelectorAll('button');
    for (var i = 0; i < botones.length; i++) {
        botones[i].addEventListener('click', function(){
            alert('Producto añadido al carrito');
        });
    }
}