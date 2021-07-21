class TestWorker
  include Sidekiq::Worker

  def perform(*args)
    console.log('niezly performens')
  end
end
