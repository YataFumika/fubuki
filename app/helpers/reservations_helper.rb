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

  def desp_user_th
    if desp_type == Reservation::DESP_RENT[:code]
      html = "貸し手"
    else
      html = "依頼者"
    end
    return html
  end

  def desp_user_name(reservation)
    if desp_type == Reservation::DESP_RENT[:code]
      html = reservation.parking.user.name
    else
      html = reservation.user.name
    end
    return html
  end

  def desp_type
    return params[:desp_type].to_i
  end
end
