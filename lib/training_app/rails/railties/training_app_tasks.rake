require 'csv'

namespace :training do
  namespace :import do
    desc 'import courses'
    task courses: :environment do
      CSV.foreach(ENV.fetch('CSV_FILE'), headers: true) do |row|
        next if row['Id'].blank?
        course = TrainingApp::Course.create! do |c|
          c.title = row['Title']
          c.description_main = row['Description Main']
          c.description_close = row['Description Close']
          c.start_date = row['Start Date']
          c.end_date = row['End Date']
          c.price = row['Price']
        end
        course.created_at = row['Created At']
        course.updated_at = row['Updated At']
        course.save!
      end
    end

    desc 'import workshops'
    task workshops: :environment do
      CSV.foreach(ENV.fetch('CSV_FILE'), headers: true) do |row|
        next if row['Id'].blank?
        workshop = TrainingApp::Workshop.create! do |w|
          w.id = row['Id']
          w.price = row['Price']
          w.start_date = row['Start Date']
          w.end_date = row['End Date']
          w.capacity = row['Capacity']
          w.early_bird_price = row['Early Bird Price']
          w.early_bird_end_date = row['Early Bird End Date']
          w.registration_link = row['Registration Link']
        end
        workshop.created_at = row['Created At']
        workshop.updated_at = row['Updated At']
        workshop.save!
      end
    end

    desc 'import registrations'
    task registrations: :environment do
      CSV.foreach(ENV.fetch('CSV_FILE'), headers: true) do |row|
        next if row['Id'].blank?
        registration = TrainingApp::Registration.create! do |r|
          r.id = row['Id']
          r.amount = row['Amount']
          r.stripe_token = row['Stripe Token']
          r.name = row['Name']
          r.email = row['Email']
          r.organization = row['Organization']
          r.phone = row['Phone']
          r.referral_token = row['Referral Token']
          r.code = row['Code']
          r.freebie = true
        end
        registration.created_at = row['Created At']
        registration.updated_at = row['Updated At']
        registration.save!
      end
    end

    desc 'import venues'
    task venues: :environment do
      CSV.foreach(ENV.fetch('CSV_FILE'), headers: true) do |row|
        next if row['Id'].blank?
        venue = TrainingApp::Venue.create! do |v|
          v.name = row['Name']
          v.address = row['Address']
          v.blurb = row['Blurb']
          v.city = row['City']
          v.id = row['Id']
        end
        venue.created_at = row['Created At']
        venue.updated_at = row['Updated At']
        venue.save!
      end
    end
  end
end

namespace :assets do
  task :precompile_client_assets do
    client_dir = File.expand_path("../../../../client", File.dirname(__FILE__))
    rails_dir = Rails.root.to_s
    ember_path = "./node_modules/ember-cli/bin/ember"
    sh "cd #{client_dir} && #{ember_path} build --environment production --output-path #{rails_dir}/public/training/classroom/"
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["assets:precompile_client_assets"].invoke
end
