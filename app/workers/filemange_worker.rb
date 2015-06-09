require 'csv'

class FilemangeWorker

  include Sidekiq::Worker

  def perform()
    csv_text = File.read('info.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.find_or_create_by(row.to_hash)
    end
  end

end


=begin

def perform()
  Rake::Task['autoloadrecode:create_customer'].invoke
end


lib => autoloadrecode => autoloadrecode_job.rb

module AutoresponderJob
  csv_text = File.read('info.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Customer.find_or_create_by(row.to_hash)
  end
end


task

autoloadrecode.rake

=end
