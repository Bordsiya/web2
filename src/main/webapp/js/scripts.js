document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("clear_table").addEventListener('click', clearTable);
    document.getElementById("coordinateForm").addEventListener("submit", formSend);
});

function clearTable() {
    let r_path = "controllerServlet?clear_table=true";
    let request = new XMLHttpRequest();
    request.open("GET", r_path, true);
    request.addEventListener("readystatechange", () => {
        if (request.readyState === 4 && request.status == 200) {
            clearPoints();
        }
    });
    request.send();

}

/*-------Кнопка отправить--------*/

function formSend(evt) {
    let submitButton = document.getElementById("send_button");
    let form = document.getElementById("coordinateForm");
    submitButton.setAttribute("disabled","disabled");
    form.rVal.value = r_value;
    if (!validateData(document.getElementById("input_x").value,
        document.getElementById("input_y").value,
        r_value)){
        evt.preventDefault();
    }
    submitButton.removeAttribute("disabled");
}