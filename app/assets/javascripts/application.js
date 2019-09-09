//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap
//= require_tree .

$(document).on("turbolinks:load", function() {
  $('#products_form_shop_ids').selectize({
    plugins: ['remove_button', 'drag_drop'],
    delimiter: ',',
    persist: false
  });

  $('.table_columns').selectize({
    plugins: ['remove_button', 'drag_drop'],
    delimiter: ',',
    persist: true
  });

  $('.sortable_columns').selectize({
    plugins: ['remove_button', 'drag_drop'],
    delimiter: ',',
    persist: true
  });

  $('.table_columns').change(function() {
    let sortable_columns = $('.sortable_columns')[0].selectize;
    sortable_columns.clear();
    sortable_columns.clearOptions();
    
    for (let i = 0; i < $(this)[0].options.length; i++) {
      let text = $(this)[0].options[i].text;
      let value = $(this)[0].options[i].value;
      sortable_columns.addOption({ text: text, value: value });
    }
  });
});