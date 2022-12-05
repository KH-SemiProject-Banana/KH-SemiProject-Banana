const order = document.getElementById("orderBy");
const order1 = document.getElementById("order1");

const orderBy = () => {

    switch(order.value){
        case "order1" : order1.setAttribute("value", 1); break;
        case "order2" : order1.setAttribute("value", 2); break;
        case "order3" : order1.setAttribute("value", 3); break;
        case "order4" : order1.setAttribute("value", 4); break;
    }

    document.getElementById("frmSearchBase").submit();
};


