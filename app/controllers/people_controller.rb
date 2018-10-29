class PeopleController < ApplicationController
  before_action :authenticate_user!

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.new
    if @person.update(person_params)
      redirect_to person_path(@person.id), notice: 'Person updated.'
    else
      redirect_to edit_person_path, alert: 'Error detected: Person not updated.'
    end
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person.id), notice: 'Person added.'
    else
      redirect_to new_person_path, alert: 'Error detected: Person not added.'
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy
    if Person.delete(params[:id])
      redirect_to people_path, notice: 'Person removed.'
    else
      redirect_to people_path, alert: 'Error detected: Person not removed.'
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
