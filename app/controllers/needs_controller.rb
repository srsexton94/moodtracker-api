# frozen_string_literal: true

class NeedsController < ProtectedController
  before_action :set_need, only: %i[show update destroy]

  # GET /needs
  def index
    @needs = current_user.needs.all

    render json: @needs
  end

  # GET /needs/1
  def show
    render json: @need
  end

  # POST /needs
  def create
    @need = current_user.needs.build(need_params)

    if @need.save
      render json: @need, status: :created, location: @need
    else
      render json: @need.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /needs/1
  def update
    if @need.update(need_params)
      render json: @need
    else
      render json: @need.errors, status: :unprocessable_entity
    end
  end

  # DELETE /needs/1
  def destroy
    @need.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_need
    @need = current_user.needs.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def need_params
    params.require(:need).permit(:hunger,
                                 :comfort,
                                 :bladder,
                                 :energy,
                                 :fun,
                                 :social,
                                 :hygiene,
                                 :environment,
                                 :mood_id)
  end
end
