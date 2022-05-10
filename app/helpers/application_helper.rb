module ApplicationHelper
  def flash_class(type)
    { danger: 'red', notice: 'white' }.fetch(type.to_sym)
  end
end
