class HoursController < ApplicationController
  before_action :authorize_partner

  def index
    hours = Hour.where(business_id: params[:id])
    hash = {}
    hours.each do |hour|
      if hash[hour.day]
        hash[hour.day] = [hash[hour.day], hour.text].join(", ")
      else
        hash[hour.day] = hour.text
      end
    end

    render json: { hours: hash }, status: 200
  end

  def create
    hours = Hour.create!(create_params)
    render json: { hours: hours.map { |hour| { id: hour.id } } }, status: 201
  end

  private

  def create_params
    hash = params.require(:hours)
      .permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    hash.each_value { |value| value.squish! if value.kind_of? String }

    hours = []
    hash.map do |k, v|
      times = parse_time(v)
      times.each do |time|
        hours << { day: k.downcase,
                   business_id: params[:id],
                   start_time: time[1],
                   end_time: time[2],
                   text: time[0] }
      end
    end
    hours
  end

  # 8am to 5pm
  # 8am to 5pm, 7pm to 11pm
  # 10pm to 3am
  # Open
  # All Day
  # 08:00 to 13:00, 17:00 to 23:00
  def parse_time(hour)
    return [[hour, "00:00", "24:00"]] if hour.downcase == "open" || hour.downcase == "all day"
    return [] if hour.downcase == "closed"
    if hour.split(",").length > 1
      # 08:00 to 13:00, 17:00 to 23:00 or 8am to 5pm, 7pm to 11pm
    else
      slots = hour.split("to")
      if slots.length > 1
        if slots[0].split(":").length > 1
          # 08:00 to 13:00
          return [[hour, slots[0], slots[1]]]
        else
          # 8am to 5pm
          open_hour = to_24hours_format(slots[0].squish)
          close_hour = to_24hours_format(slots[1].squish)
          return [[hour, "#{open_hour}:00", "#{close_hour}:00"]]
        end
      end
    end
  end

  def to_24hours_format(hour12)
    period = period(hour12)
    hour24 = hour12.gsub(period, "")
    period.downcase == "pm" ? (hour24.to_i + 12).to_s : hour24
  end

  def period(indicator)
    len = indicator.length
    indicator[len - 2..len]
  end

end
