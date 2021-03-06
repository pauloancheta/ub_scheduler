module Bamboohr
  class User
    def find(id)
      all.select do |user|
        user.id == id
      end
    end

    %w|first_name last_name display_name|.each do |method|
      define_method "find_by_#{method}" do |match|
        all.select do |user|
          user.send(method) == match
        end
      end
    end

    def all
      @users ||= user_collection
    end

    private
    def user_collection
      all_from_api.map do |user_attributes|
        UserObject.new(create_user_attributes(user_attributes))
      end
    end

    def create_user_attributes(user_attributes)
      new_attributes = {}
      user_attributes.each do |user|
        new_attributes[:id] = user[:id].to_i if user.has_key?(:id)

        if user.has_key?(:field)
          key, value = user.fetch(:field)
          new_attributes[:first_name] = value if key.fetch(:id) == "firstName"
          new_attributes[:last_name] = value if key.fetch(:id) == "lastName"
          new_attributes[:display_name] = value if key.fetch(:id) == "displayName"
        end
      end
      new_attributes
    end

    def all_from_api
      @doc ||= Api.call("employees/directory").to_s
      Ox.load(@doc, mode: :hash).dig(:directory, :employees, :employee)
    end
  end

  class UserObject
    attr_reader :id, :first_name, :last_name, :display_name
    def initialize(id:, first_name:, last_name:, display_name:)
      @id = id
      @first_name = first_name
      @last_name = last_name
      @display_name = display_name
    end
  end
end
