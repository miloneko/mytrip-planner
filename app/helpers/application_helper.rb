module ApplicationHelper
  def flash_class(type)
    { danger: 'red', notice: 'white', warning: 'yellow' }.fetch(type.to_sym)
  end
end
