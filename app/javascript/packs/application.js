require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import jquery from 'jquery';
window.$ = window.jquery = jquery;

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all';
import 'custom/sweetalert';
import 'custom/parsley';
import 'custom/script';

import '../stylesheets/application'
