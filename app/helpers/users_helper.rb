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

end
