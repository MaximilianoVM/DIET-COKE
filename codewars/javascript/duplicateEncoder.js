function duplicateEncode(word) {
    let characters = {};
    let lowerWord = word.toLowerCase();

    //contamos ocurrencias
    for (let c of lowerWord) {
        characters[c] = (characters[c] || 0) + 1;
    }

    //cadena resultante
    let res = "";
    for (let c of lowerWord) {
        if (characters[c] > 1) {
            res += ")";
        } else {
            res += "(";
        }
    }

    return res;
}