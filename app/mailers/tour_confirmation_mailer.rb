class TourConfirmationMailer < ActionMailer::Base

  default from: "agent@musecruise.com"

  def notifier(tour)
    @tour = tour
    mail(
      to: @tour.tourist.email,
      subject: "Glad to have you aboard"
    )
  end
end
