const order = document.getElementById("order");
const orderInput = document.getElementById("orderInput");

const orderBy = () => {

    switch(order.value){
        case "order1" : orderInput.value = 1; break;
        case "order2" : orderInput.value = 2; break;
        case "order3" : orderInput.value = 3; break;
        case "order4" : orderInput.value = 4; break;
    }

    document.getElementById("frmSearchBase").submit();
};