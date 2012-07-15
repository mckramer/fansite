$ ->
  $('form .btn-group[data-field]').each ->
    $group = $(this)
    $form = $group.parents('form').get(0)
    $field = $('input#' + $group.data('field'), $form)
    $('button', $group).each ->
      $button = $(this)
      $button.click ->
        $field.val($button.val())