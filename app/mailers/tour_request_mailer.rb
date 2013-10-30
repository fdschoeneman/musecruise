class TourRequestMailer < ActionMailer::Base

  default from: "admin@musecruise.com"

  def tour_request_notifier(tour)
    @tour = tour
    mail( 
      to: "agent@musecruise.com",
      subject: "#{tour.tourist.full_name} requested a tour"
    )

  end
end
