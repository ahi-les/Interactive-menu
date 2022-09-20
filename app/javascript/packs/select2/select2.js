import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'
import * as Select2Ru from 'select2/src/js/select2/i18n/ru'
import * as Select2En from 'select2/src/js/select2/i18n/en'
import * as Select2Uk from 'select2/src/js/select2/i18n/uk'

const select2_langs = {
  ru: Select2Ru,
  en: Select2En,
  uk: Select2Uk
}

/// if you don't have turnbolinks then use this:
//// document.addEventListener('DOMContentLoaded', () => { 

$(document).on("turbolinks:before-cache", function() {
    $('.select2-hidden-accessible').select2('destroy');
   
});

 $(document).on("turbolinks:load", function() {
  $('.select2').select2({
    tags: true,
    tokenSeparators: [',', ' ']
 
  });
})