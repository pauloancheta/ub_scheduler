module OpsGenie
  class OnCall
    def call(team)
      schedule = Schedule.new.find(team)
      participants = JSON.parse(Api.call("schedules/#{schedule.id}/on-calls"))
                      .fetch("data")
                      .fetch("onCallParticipants")
      # we only have one on call
      participants.first.fetch("name")
    end
  end

  class Schedule
    def find(team)
      all.find { |t| t.name.include?(team) }
    end

    def all
      @teams ||= call_api.map do |team|
        # get the keys and turn to symbol
        team = team.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
        team = team.select {|key, value| [:id, :name, :description, :enabled].include?(key) }

        Team.new(team)
      end
    end

    private
    def call_api
      JSON.parse(Api.call("schedules").to_s).fetch("data")
    end
  end

  class Team
    attr_reader :id, :name, :description, :enabled

    def initialize(id:, name:, description:, enabled:)
      @id = id
      @name = name
      @description = description
      @enabled = enabled
    end
  end
end
