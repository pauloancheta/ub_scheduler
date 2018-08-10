module Bamboohr
  class User
    def call
      ENV["BAMBOO_API_KEY"]
    end
  end
end
