class ApplyingsController < ApplicationController
  def create
    @applying = current_user.applyings.build(target_id: params[:target_id])

    if @applying.save
      flash[:notice] = "已送出邀請"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @applying.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm
    @friend = current_user.confirmations.build(friend_id: params[:friend_id])

    if @friend.save
      applying = Applying.where(user_id: params[:friend_id], target_id: current_user.id)
      applying.destroy_all

      flash[:notice] = "接受邀請"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friend.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
  
  def ignore
    @nobody = current_user.disregards.build(nobody_id: params[:nobody_id])

    if @nobody.save
      applying = Applying.where(user_id: params[:nobody_id], target_id: current_user.id)
      applying.destroy_all

      flash[:notice] = "已忽略該用戶"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @nobody.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
end