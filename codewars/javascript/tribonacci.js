function tribonacci(signature, n){
    if (n > 3){
        for (let i=0; i < n-3; i++){
            let last = signature[signature.length - 1] + signature[signature.length - 2] + signature[signature.length - 3];
            signature.push(last);
        }
        return signature;
    } 
    else{
        return signature.slice(0, n);
    }
}