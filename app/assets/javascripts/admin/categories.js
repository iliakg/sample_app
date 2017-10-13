$(document).ready(function() {

if ($('#categories').length > 0) {
  var categoriesData = JSON.parse($('#categories_data').val());
  $('#categories').html('<ul class="base_category"></ul>');

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
  var formPath = '/admin/categories/'+category.id+'/edit';
  var categoryHtml =  '<li><div class="target_link" data-category-id="'+category.id+'"><span>'+category.title+'</span><a href="'+formPath+'" data-remote="true" class="edit_link"><i class="material-icons">edit</i></a></div><ul data-category-id="'+category.id+'" class="parent_category"></ul></li>';

  if (category.parent_id) {
    $('.parent_category[data-category-id="'+category.parent_id+'"]').append(categoryHtml)
  } else {
    $('#categories .base_category').append(categoryHtml);
  }
}

function updateCreateCategoryLinks() {
  $('#categories ul .add_category').remove();
  $('#categories ul').each(function(el) {
    var formPath = '/admin/categories/new?parent_category_id='+($(this).data('category-id') || '');
    $(this).append('<li class="add_category"><a href="'+formPath+'" data-remote="true" class="new_category_link">+ Add</a></li>');
  });
}

function createCategory(category) {
  addCategoryToHtml(category);
  updateCreateCategoryLinks();
}

