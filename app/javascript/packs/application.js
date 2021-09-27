import $ from "jquery";
window.jQuery = $;
window.$ = $;

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
ActiveStorage.start()

require("bootstrap/dist/js/bootstrap.bundle.js")