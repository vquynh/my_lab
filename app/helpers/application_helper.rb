module ApplicationHelper
    def login_helper(params = { list_class: "nav-item", link_class: "nav-link" } )
        if current_user.is_a?(GuestUser) 
            ('<li class="' + params[:list_class] + '">' + 
            	(link_to "Register", new_user_registration_path, class: params[:link_class]) + ' ' +
            '</li>' +
            '<li class="' + params[:list_class] + '">' + 
            	(link_to "Login", new_user_session_path, class: params[:link_class]) +
            '</li>').html_safe
        else 
        	('<li class="' + params[:list_class] + '">' + 
            	(link_to "Logout", destroy_user_session_path, method: :delete, class: params[:link_class]) +
            '</li>').html_safe
        end 
    end
end
