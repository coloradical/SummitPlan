class ChangeFourteenerKmlTypeToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :fourteeners, :kml, :string
  end
end
