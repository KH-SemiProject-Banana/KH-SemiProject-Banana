// 검색어가 ""인 경우 검색 X
document.getElementById("searchFrm").addEventListener("submit", event => {
    const query = document.getElementById("query").value;

    if(query.length == 0) {
        event.preventDefault();
        return;
    }
})