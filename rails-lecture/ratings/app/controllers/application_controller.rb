class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  # Call our custom authenticate function before every controller
   before_filter :authenticate!

   # Custom authenticate function
   # return from this function to allow user to continue
   def authenticate!
     # use the devise authenticate to make user a user is signed in
     # Could customize by checking for each controller/action pair
     authenticate_user!

     # only allow a user to edit/update or delete ratings created by the user
     if params[:controller] == 'ratings' && (params[:action] == 'edit' || params[:action] == 'update' || params[:action] == 'destroy')
       current_rating = Rating.find(params[:id])

       if current_rating.user_id == current_user.id
         # when you return from authentication!, the program continues to requested page
         return
       else
         # by redirecting here, we are preventing the user from visiting the requested page
         redirect_to root_url, notice: "Record not found"
       end
     end
   end
end
