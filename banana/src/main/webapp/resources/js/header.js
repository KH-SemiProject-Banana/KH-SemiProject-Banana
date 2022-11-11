document.getElementById("aaa").addEventListener("click", (event) => {
    const inkki = document.getElementById("inkki");
    console.log(inkki.innerText);

    $.ajax({
        url: "/category/product",
        data: {"inkki" : inkki.innerText},
        type: "GET"
    })
})