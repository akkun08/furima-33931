function count() {
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener("keyup", () => {
        const tax = 0.1;
        const countVal = itemPrice.value * tax;
        const addTaxPrice = document.getElementById("add-tax-price");
        addTaxPrice.innerHTML = `${Math.floor(countVal).toLocaleString()}`;
    });

    itemPrice.addEventListener("keyup", () => {
        const tax = 0.1;
        const countVal = itemPrice.value * (1 - tax);
        const profit = document.getElementById("profit");
        profit.innerHTML = `${Math.round(countVal).toLocaleString()}`;
    });
}

window.addEventListener("load", count);