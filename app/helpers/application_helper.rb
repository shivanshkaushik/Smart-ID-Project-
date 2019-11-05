module ApplicationHelper

  def gravatar_for(obj, options = {size:80})
    gravatar_id = Digest::MD5::hexdigest(obj.firstname.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: obj.firstname, style:'border-radius:50%;')
  end

end
