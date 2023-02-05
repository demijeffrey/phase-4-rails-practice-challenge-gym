class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    def new_membership
        membership = Membership.new(membership_params)
        if membership.valid?
            membership.save
            render json: membership, status: :created
        else
            render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def record_not_found
        render json: { error: "gym not found"}, status: :not_found
    end

end
