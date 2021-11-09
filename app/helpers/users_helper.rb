# frozen_string_literal: true

module UsersHelper
  def user_logged_in
    Current.user ? true : false
  end

  def user_is_admin(user)
    user.has_permission?('admin')
  end

  def current_user_is_admin
    user_logged_in ? user_is_admin(Current.user) : false
  end

  def user_can_create(user, object)
    user.has_permission?(object) || current_user_is_admin
  end

  def current_user_can_create(object)
    user_logged_in ? user_can_create(Current.user, object) : false
  end

  def user_can_edit(user, object_user_id)
    (user.id == object_user_id)
  end

  def current_user_can_edit(object_user_id)
    user_logged_in ? user_can_edit(Current.user, object_user_id) : false
  end

  def user_can_delete(user, object_user_id)
    (user.id == object_user_id) || current_user_is_admin
  end

  def current_user_can_delete(object_user_id)
    user_logged_in ? user_can_delete(Current.user, object_user_id) : false
  end
end
