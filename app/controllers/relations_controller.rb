class RelationsController < ApplicationController


    def create
        @user = User.find(params[:relation][:following_id])
        #following = current_user.follow(user)
        #following.save
        #current_user.follow!(@user)
        current_user.follow!(@user)
        redirect_to request.referrer
      end
    
      def destroy
        @user = Relation.find(params[:id]).following
        current_user.unfollow!(@user)
        redirect_to request.referrer#@user
      end

      #private
      #def relation_params
       # params.require(:relation).permit(:relation, :following_id)
      #end

end