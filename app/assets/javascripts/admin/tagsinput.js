$(document).ready(function() {
  $('#post_tags_list').tagsInput({
    autocomplete_url: '/admin/tags',
    autocomplete: { selectFirst: true, autoFill: true },
    width: '',
    height: '',
    defaultText: I18n.t('add_tag_placeholder')
  })
});
