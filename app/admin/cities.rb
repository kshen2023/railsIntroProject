ActiveAdmin.register City do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :city_name, :country_id, :city_area, :latitude, :longitude

#   or

#   permit_params do
#     permitted = [:city_name, :country_id, :city_area, :latitude, :longitude]
#     permitted << :other if params[:action] == 'create' && current_user.admin?
#     permitted
#   end

end
