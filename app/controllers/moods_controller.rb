# frozen_string_literal: true

class MoodsController < ProtectedController
  before_action :set_mood, only: %i[show update destroy]

  # GET /moods
  def index
    @moods = Mood.all

    render json: @moods
  end

  # GET /moods/1
  def show
    render json: @mood
  end

  # POST /moods
  def create
    @mood = current_user.moods.build(mood_params)
    # @example = current_user.examples.build(example_params)
    if @mood.save
      render json: @mood, status: :created, location: @mood
    else
      render json: @mood.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /moods/1
  def update
    if @mood.update(mood_params)
      render json: @mood
    else
      render json: @mood.errors, status: :unprocessable_entity
    end
  end

  # DELETE /moods/1
  def destroy
    @mood.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mood
    @mood = current_user.moods.find(params[:id])
    # @example = current_user.examples.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mood_params
    params.require(:mood).permit(:happy,
                                 :calm,
                                 :sad,
                                 :nervous,
                                 :motivated,
                                 :angry)
  end
end
