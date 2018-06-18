module ApplicationHelper

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, sticky: false, time: 1000)
  end

  def active?(path)
  "active" if current_page?(path)
  end

  def weekday day
    case day
      when 0
        "Sunday"
      when 1
        "Monday"
      when 2
        "Tuesday"
      when 3
        "Wednesday"
      when 4
        "Thursday"
      when 5
        "Friday"
      when 6
        "Saturday"
    end
  end

end
