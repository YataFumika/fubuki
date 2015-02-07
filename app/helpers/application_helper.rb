module ApplicationHelper
  def constance_to_list(list)
    list.map { |item| [item[:label], item[:code]] }
  end
end
