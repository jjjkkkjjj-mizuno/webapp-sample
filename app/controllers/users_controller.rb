class UsersController < ApplicationController
    before_action :set_user, only: [:show, :follow]

    def follow
        if user_signed_in? && @user.id != current_user.id && Follow.find_by(following_id: @user.id) == nil
            # create following user
            Follow.create(following_id: @user.id, followed_by_id: current_user.id)
            Notification.create(notifying_id: @user.id, notified_by_id: current_user.id)
            @follow = "follow"
        elsif user_signed_in? && @user.id != current_user.id && Follow.find_by(following_id: @user.id) != nil
            # remove followed user
            Follow.find_by(following_id: @user.id, followed_by_id: current_user.id).destroy
            Notification.find_by(notifying_id: @user.id, notified_by_id: current_user.id).destroy
            @follow = "remove"
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
end
