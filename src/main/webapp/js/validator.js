
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('button[id^=btn]').forEach(btn => {
        btn.addEventListener('click', buttonValidate);
    });
});

    let pred_btn = null;
    let r_value = null;

    /*---------------Проверка данных--------------------*/

    function checkY(y) {
        let answer = {
            isValid: false,
            errorMessage: ""
        }
        if (/[.|,]/.test(y)) {
            //проверяем формат числа с плавающей точкой/запятой
            if (!/^-?\d+[.|,]\d+$/.test(y)) {
                answer.errorMessage = "Y: неправильный формат ввода числа с плавающей точкой";
                return answer;
            }
            // кол-во знаков после точки/запятой больше 8
            if (!/[.|,]\d{1,8}$/.test(y)) {
                answer.errorMessage = "Y: количество символов после запятой больше 8";
                return answer;
            }
            // перед запятой 1 цифра
            if (!/^-?\d{1}[.|,]/.test(y)) {
                answer.errorMessage = "Y: число не попадает в указанный диапазон";
                return answer;
            }
        } else if (!/^-?\d{1}$/.test(y)) {
            if (/^-?\d+$/.test(y)) answer.errorMessage = "Y: число не попадает в указанный диапазон";
            else answer.errorMessage = "Y: неправильный формат ввода целого числа";
            return answer;
        }

        let value = y;
        value = Number(value.replace('\,', '.'));
        if (value <= -5 || value >= 3) answer.errorMessage = "Y: число не попадает в указанный диапазон";
        else answer.isValid = true;
        return answer;
    }

    function checkX(x) {
        const xValues = ["-5", "-4", "-3", "-2", "-1", "0", "1", "2", "3"];
        let answer = {
            isValid: false,
            errorMessage: ""
        }
        if (x != null) {
            if (xValues.includes(x)) answer.isValid = true;
            else answer.errorMessage = "X: некорректное значение";
        } else answer.errorMessage = "X: не выбрано";
        return answer;
    }

    function checkR(r) {
        const rValues = ["1", "2", "3", "4", "5"];
        let answer = {
            isValid: false,
            errorMessage: ""
        }
        if (r != null) {
            if (rValues.includes(r)) answer.isValid = true;
            else answer.errorMessage = "R: некорректное значение";
        } else answer.errorMessage = "R: не выбрано";
        return answer;
    }

    function cleanErrors() {
        document.getElementById("error_x").innerHTML = "";
        document.getElementById("error_y").innerHTML = "";
        document.getElementById("error_r").innerHTML = "";
    }

    function validateData(x, y, r) {
        cleanErrors();
        let check1 = checkX(x);
        let check2 = checkY(y);
        let check3 = checkR(r);
        if (check1.isValid && check2.isValid && check3.isValid) return true;
        if (!check1.isValid) document.getElementById("error_x").innerHTML = check1.errorMessage;
        if (!check2.isValid) document.getElementById("error_y").innerHTML = check2.errorMessage;
        if (!check3.isValid) document.getElementById("error_r").innerHTML = check3.errorMessage;
        return false;
    }

    /*------------Определение выбранной кнопки-----------*/

    function buttonValidate(event) {
            r_value = event.target.value;
            console.log(event.target.value);
            event.target.classList.add("active_btn");
            if (pred_btn == null) pred_btn = event.target;
            else {
                pred_btn.classList.remove("active_btn");
                if (event.target == pred_btn) {
                    pred_btn = null;
                    r_value = null;
                } else pred_btn = event.target;

            }
    }




