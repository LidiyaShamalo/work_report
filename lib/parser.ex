defmodule WorkReport.Parser do

  @spec parse_time(String.t()) :: integer()

  def parse_time(time_str) do
    #[["2h", "2", "h"], ["20m", "20", "m"]]
    list = Regex.scan(~r/(\d+)\s*([hm])/, time_str)
    get_time(list)

  end

  def get_time([]), do: 0

  def get_time([hd|tl]) do
    hd = List.to_tuple(hd)
    {_total, int, str} = hd
    result = case str do
      "h" ->
        String.to_integer(int) * 60
      "m" -> String.to_integer(int)
      _ -> 0
    end
    result + get_time(tl)
  end



end
