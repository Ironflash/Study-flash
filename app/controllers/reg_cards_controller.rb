class RegCardsController < ApplicationController
  # GET /reg_cards
  # GET /reg_cards.json
  def index
    @reg_cards = RegCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reg_cards }
    end
  end

  # GET /reg_cards/1
  # GET /reg_cards/1.json
  def show
    @reg_card = RegCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reg_card }
    end
  end

  # GET /reg_cards/new
  # GET /reg_cards/new.json
  def new
    @reg_card = RegCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reg_card }
    end
  end

  # GET /reg_cards/1/edit
  def edit
    @reg_card = RegCard.find(params[:id])
  end

  # POST /reg_cards
  # POST /reg_cards.json
  def create
    @reg_card = RegCard.new(params[:reg_card])

    respond_to do |format|
      if @reg_card.save
        flash[:success] = "Card Created Successfully!"
        format.html { redirect_to group_path(@reg_card.group) }
        format.json { render json: @reg_card, status: :created, location: @reg_card }
      else
        format.html { redirect_to group_path(@reg_card.group)  }
        format.json { render json: @reg_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reg_cards/1
  # PUT /reg_cards/1.json
  def update
    @reg_card = RegCard.find(params[:id])

    respond_to do |format|
      if @reg_card.update_attributes(params[:reg_card])
        flash[:success] = "Card Updated!"
        format.html { redirect_to @reg_card }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @reg_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reg_cards/1
  # DELETE /reg_cards/1.json
  def destroy
    @reg_card = RegCard.find(params[:id])
    @reg_card.destroy
    flash[:success] = "Card Destroyed!"

    respond_to do |format|
      format.html { redirect_to group_path(Group.find(@reg_card.group_id)) }
      format.json { head :no_content }
    end
  end
end
