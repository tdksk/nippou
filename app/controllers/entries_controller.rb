class EntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :initialize_filter
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @my_entries = Entry.where(user_id: current_user.id).order('date desc')
  end

  def new
    @entry = Entry.new
    @entry.date = params[:date] ? params[:date] : Date.today
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    if @entry.save
      redirect_to :root
    else
      render action: 'new'
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to :root
    else
      render action: 'edit'
    end
  end

  def destroy
    return head 403 unless @entry.user == current_user
    @entry.destroy
    redirect_to entries_url
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:date, :body)
  end
end
