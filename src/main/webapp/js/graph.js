document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("graph").addEventListener("click", graphSend);
});

let xARR = [-5, -4, -3, -2, -1, 0, 1, 2, 3]
const size = 500;
let width = size;
let height = size;

function graphSend(){
    cleanErrors();
    clearPoints();
    if (!checkR(r_value).isValid) {
        document.getElementById("error_r").innerHTML = checkR().errorMessage;
        return;
    }
    let xPx = -(width/2 - event.offsetX)
    let yPx = height/2 - event.offsetY;

    let m = r_value/160;
    let x = xPx * m;
    let y = yPx * m;

    let diff = Infinity;
    let closestX, closestY;
    for (let i = 0; i < xARR.length; i++){
        if (Math.abs(xARR[i] - x) < diff){
            diff = Math.abs(xARR[i] - x);
            closestX = xARR[i];
        }
    }
    let yString = String(y);
    if (yString.length > 8) yString = yString.substring(0, 8);
    closestY = Number(yString);

    let r_path = 'controllerServlet?xVal='
        + closestX + '&yVal='
        + closestY + '&rVal='
        + r_value + '&async=' + true;


    let request = new XMLHttpRequest();

    request.open("GET", r_path, true);
    request.onreadystatechange=function() {
        if (request.readyState === XMLHttpRequest.DONE && request.status == 200) {
            location.reload();
        }
    }
    request.send();


}

function clearPoints(){
    let points = document.querySelectorAll("#graph circle");
    for (let i = 0; i < points.length; i++){
        points[i].remove();
    }
}
