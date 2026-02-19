defmodule WorkReport.Formatter do

  @spec format_time(integer) :: String.t()
  def format_time(time) do
    #"1h 30m"
    cond do
      time == 60 ->
        hour = div(time, 60)
        "#{hour}h"
      time > 60 ->
        hour = div(time, 60)
        min = rem(time, 60)
        if min > 0 do
          "#{hour}h #{min}m"
        else
          "#{hour}h"
        end
      time == 0 ->
        "0"
      true ->
        "#{rem(time, 60)}m"
    end
  end
end
