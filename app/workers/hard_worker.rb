class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    p 'aaaaaaaaaa'
  end
end
