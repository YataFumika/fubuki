module ApplicationHelper

  # flashmessageを表示
  def flash_messages(flash)
    return "" if flash.blank?
    types = { alert: "error", notice: "success"}
    tags = ""
    flash.each do |type, message|
      tags += div_flash(types[type], message)
    end
    tags.html_safe
  end

  def constance_to_list(list)
    list.map { |item| [item[:label], item[:code]] }
  end

  private

  # divを表示
  def div_flash(type, message)
    content_tag(:div, class: "alert alert-#{type}") do
      content_tag(:button, '×', class: "close", data: { dismiss: "alert"}) + message
    end
  end

end
