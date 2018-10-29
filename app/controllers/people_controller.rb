class PeopleController < ApplicationController
  before_action :authenticate_user!

  def new
    @person = Person.new
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

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
