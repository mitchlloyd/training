module AsyncHelpers
  def eventually(options = {})
    timeout = options[:timeout] || 2
    interval = options[:interval] || 0.1
    time_limit = Time.now + timeout
    loop do
      begin
        result = yield
      rescue RSpec::Expectations::ExpectationNotMetError => error
      end
      return result if error.nil?
      raise error if Time.now >= time_limit
      sleep interval
    end
  end

  def wait_for(&block)
    eventually {
      result = yield
      expect(result).to be_present
      result
    }
  end
end
