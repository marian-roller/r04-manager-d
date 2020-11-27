class MymovieObserver < ActiveRecord::Observer
  def before_save(mymovie)
    # Notifications.comment("admin@do.com", "New comment was posted", comment).deliver
    abort "test".inspect
  end
end
