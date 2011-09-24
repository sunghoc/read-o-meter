module ApplicationHelper

  # Return a image tag for the logo
  def logo
    image_tag("logo.png", :alt => "Read-O-Meter", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Read-O-Meter: Track your reading"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
