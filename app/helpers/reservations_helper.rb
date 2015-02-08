module ReservationsHelper
  def tab_item(name, type)
    if type.to_i == Reservation::DESP_DEMAND[:code]
      name = (name + demand_badge(type)).html_safe
    end
    active = "active" if type.to_i == desp_type

    html = ""
    html += "<li class='#{active}'>"
    html += link_to(name, reservations_path(desp_type: type))
    html += "</li>"
    return html.html_safe
  end

  def demand_badge(type)
    return "" if @demand_count.to_i <= 0
    return "&nbsp;&nbsp;<span class='badge'>#{@demand_count}</span>".html_safe
  end

  def desp_type
    return params[:desp_type].to_i
  end
end
