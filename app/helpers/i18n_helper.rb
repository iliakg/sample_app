module I18nHelper
  def tt(*keys)
    I18n.t(keys.join('.'))
  end
end
