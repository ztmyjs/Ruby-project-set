function auto_fill_delivery(){
    let delivery1 = document.getElementById("survey_delivery_1_not_applicable");
    let delivery2 = document.getElementById("survey_delivery_2_not_applicable");
    let delivery3 = document.getElementById("survey_delivery_3_not_applicable");

    delivery1.setAttribute("checked", "checked");
    delivery2.setAttribute("checked", "checked");
    delivery3.setAttribute("checked", "checked");
}