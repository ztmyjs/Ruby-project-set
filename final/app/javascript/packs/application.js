// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.auto_fill_delivery =  function(){
    let delivery1 = document.getElementById("survey_delivery_1_not_applicable");
    let delivery2 = document.getElementById("survey_delivery_2_not_applicable");
    let delivery3 = document.getElementById("survey_delivery_3_not_applicable");

    delivery1.setAttribute("checked", "checked");
    delivery2.setAttribute("checked", "checked");
    delivery3.setAttribute("checked", "checked");
}