$(document).ready(function(){
  if (window.location.pathname == '/cgi-bin/koha/cataloguing/z3950_search.pl') {
    var field = 'body#cat_z3950_search input#title';
    $(field).val($(field).val().replace(/ *[;:,.\/-] *$/, ''));

    field = 'body#cat_z3950_search input#author';
    $(field).val($(field).val().replace(/ *[;:,.\/-] *$/, ''));
  }
});
