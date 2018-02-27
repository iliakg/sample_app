$(document).ready(function() {

if ($('#categories').length > 0) {
  var categoriesData = JSON.parse($('#categories_data').val());
  $('#categories').html('<ul class="base_category" data-level="1"></ul>');

  categoriesData.forEach(function(el) {
    addCategoryToHtml(el);
  });
  updateCreateCategoryLinks();

  $('#categories').on('click', '.target_link', function(e) {
    if (e.target.className == 'edit_link' || $(e.target).parents('.edit_link').length > 0) {
      e.preventDefault();
      return;
    }

    $('.target_link').next('ul').hide();
    $(this).parents('ul').show();
    $(this).next('ul').show();
  });
}
});

function addCategoryToHtml(category) {
  var nested_level_limit = $('#categories').data('nested-level-limit')
  var formPath = '/admin/categories/'+category.id+'/edit';
  var categoryHtml = $('<li><div class="target_link" data-category-id="'+category.id+'"><span>'+category.title+'</span><a href="'+formPath+'" data-remote="true" class="edit_link"><i class="material-icons">edit</i></a></div><ul data-category-id="'+category.id+'" class="parent_category"></ul></li>');

  if (category.parent_id) {
    var $parent_el = $('ul.parent_category[data-category-id="'+category.parent_id+'"]');
    var next_level = $parent_el.data('level') + 1;

    if(next_level > nested_level_limit){
      categoryHtml.addClass('last_level');
      $('ul.parent_category', categoryHtml).remove();
    }

    $('ul.parent_category', categoryHtml).data('level', next_level)
    $parent_el.append(categoryHtml)
  } else {
    $('ul.parent_category', categoryHtml).data('level', 2)
    $('#categories ul.base_category').append(categoryHtml);
  }
}

function updateCreateCategoryLinks() {
  $('#categories ul .add_category').remove();
  $('#categories ul').each(function(el) {
    var formPath = '/admin/categories/new?parent_category_id='+($(this).data('category-id') || '');
    $(this).append('<li class="add_category"><a href="'+formPath+'" data-remote="true" class="new_category_link">+ '+I18n.t('add')+'</a></li>');
  });
}

function createCategory(category) {
  addCategoryToHtml(category);
  updateCreateCategoryLinks();
}
