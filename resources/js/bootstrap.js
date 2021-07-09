// jquery
window.$ = window.Jquery = require("jquery");

// popper.js
window.Popper = require("popper.js").default;

// axios
window.axios = require("axios");
window.axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";

// vue.js
window.Vue = require("vue");
Vue.component(
    "task-component",
    require("./components/TaskComponent.vue").default
);

// pusher
window.Pusher = require("pusher-js");

// laravel-echo
import Echo from "laravel-echo";
window.Echo = new Echo({
    broadcaster: "pusher",
    key: "592aca6a5f3059fcda8e",
    cluster: "eu",
    forceTLS: true
});

const app = new Vue({
    el: "#app"
});
