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

    def user_can_comment(user)
        user.has_permission?('comment') || user.has_permission?('admin')
    end

    def current_user_can_comment
        user_logged_in ? user_can_comment(Current.user) : false
    end

end
