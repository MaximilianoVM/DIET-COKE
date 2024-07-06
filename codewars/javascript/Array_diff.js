function arrayDiff(a, b) {
    let i = 0;
    while (i < a.length) {
        if (b.includes(a[i])) {
            a.splice(i, 1); //eliminar 1 elemento a partir del indice i
        } else {
            i++; //en else para no saltarnos el siguiente elemento despues de desplazarse 
        }
    }
    return a;
}