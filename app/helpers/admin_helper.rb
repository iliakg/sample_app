module AdminHelper
  def popup_wrapper
    '<div id="fog_popup">
      <div id="popup">
        <div id="close_popup"><i class="material-icons">close</i></div>
        <div id="content_popup"></div>
      </div>
    </div>'.html_safe
  end

  def full_date(time)
    time.strftime('%d.%m.%Y %H:%M')
  end
end
