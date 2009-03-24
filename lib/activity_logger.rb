module ActivityLogger

  def add_activities(options = {})
    user = options[:user]
    #include_user = options[:include_user]
    activity = options[:activity] ||
      Activity.create(:item => options[:item], :user => user)
  end
end
