function toggleHideShow(y) {
    var x = document.getElementById("myDIV" + y);
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}