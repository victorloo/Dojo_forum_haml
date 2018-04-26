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
end