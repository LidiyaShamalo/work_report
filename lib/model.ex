defmodule Model do

  defmodule Task do
    @type t() :: %__MODULE__{
            type: String.t(),         # DEV
            description: String.t(),  # "..."
            duration: String.t()      # "30m"
          }

    @enforce_keys [:type, :description, :duration]

    defstruct [:type, :description, :duration]

  end

  defmodule Day do
    @type t() :: %__MODULE__{
      subtitle: String.t(),    # "3 mon"
      tasks: [Task.t()],       # [DEV, COMM...]
      total_time:  String.t()  # "4h 10m"
    }

    defstruct [:subtitle, :tasks, :total_time]

  end

  defmodule Month do

    @type t() :: %__MODULE__{
      month_name: String.t(),                        # "May"
      category_totals: %{String.t() => String.t()},  # %{DEV => "7h 56m"}
      stats: LeadTime.t()                            # total_time: "13h 29m", working_days: 3, avg_time: "4h 29m"
    }

    defstruct [:month_name, :category_totals, :stats]

    end

    defmodule LeadTime do

    @type t() :: %__MODULE__{
      total_time: String.t(),       # "13h 29m"
      working_days: Integer.t(),    # 3
      avg_time: String.t()          # 4h 29m"
    }

    defstruct [:total_time, :working_days, :avg_time]

  end

end
