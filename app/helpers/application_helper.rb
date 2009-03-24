# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def delete_comment_path(options)
   comment_path(:id => options[:id], :backurl => request.url)
  end
end
