$( document ).ready(function() {
var $categoriesEl = $('#categories');

if ($categoriesEl.length > 0){
  var categoriesData = JSON.parse($('#categories_data').val());
  var html = '<ul class="base_category"></ul>';

  $categoriesEl.html(html);

  categoriesData.forEach(function(el){
    addCategoryToHtml(el);
  });

  $('ul').each(function(el){
    $(this).append('<li><div class="target_link">+ Добавить</div></li>');
  });

  $($categoriesEl).on('click', '.target_link', function(a, b){
    $('.target_link').next('ul').hide();
    $(this).parents('ul').show();
    $(this).next('ul').show();
  })
}

function addCategoryToHtml(category){
  var $categoriesList = $categoriesEl.find('.base_category');
  var categoryHtml =  '<li><div class="target_link">'+category.title+'</div><ul data-category-id="'+category.id+'" class="parent_category"></ul></li>';

  if(category.parent_id){
    $('.parent_category[data-category-id="'+category.parent_id+'"]').append(categoryHtml)
  }else{
    $categoriesList.append(categoryHtml);
  }
}

});