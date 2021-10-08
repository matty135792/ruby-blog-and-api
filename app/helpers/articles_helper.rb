module ArticlesHelper
    
    def user_can_create_article(user)
        user.has_permission?('article') || current_user_is_admin
    end

    def current_user_can_create_article
        user_logged_in ? user_can_create_article(Current.user) : false
    end

    def user_can_edit_article(user, article_user_id)
        (user.id == article_user_id) || current_user_is_admin
    end

    def current_user_can_edit_article(article_user_id)
        user_logged_in ? user_can_edit_article(Current.user,article_user_id) : false
    end

end
