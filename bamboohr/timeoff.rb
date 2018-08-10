module Bamboohr
  class Timeoff
    def all_from_employee_id(id)
      time_off_collection(id).sort_by do |timeoff|
        timeoff.start
      end
    end

    private
    def time_off_collection(id)
      find_from_api(id).map do |r|
        create_timeoff_object(r)
      end
    end

    def create_timeoff_object(attributes)
      new_attributes = {}
      attributes.each do |a|
        new_attributes[:start] = a[:start] if a.has_key?(:start)
        new_attributes[:end0] = a[:end] if a.has_key?(:end)

        if a.has_key?(:employee)
          key, _ = a[:employee]
          new_attributes[:employee_id] = key[:id]
        end

        if a.has_key?(:status)
          _, status = a[:status]
          new_attributes[:status] = status
        end
      end
      TimeoffObject.new(new_attributes)
    end

    def find_from_api(id)
      @doc ||= Api.call("time_off/requests", params: {employeeId: id}).to_s
      Ox.load(@doc, mode: :hash).dig(:requests, :request)
    end
  end

  class TimeoffObject
    attr_reader :employee_id, :start, :end, :status
    def initialize(employee_id:, start:, end0:, status:)
      @employee_id = employee_id
      @start = start
      @end = end0
      @status = status
    end
  end
end
