class CreateKpis < ActiveRecord::Migration[5.0]
  def change

    table_name = :stardust_rails_kpis_kpis
    old_table_name = :kpis

    if table_exists?(old_table_name)
      rename_table old_table_name,table_name
    else
      create_table table_name do |t|
        t.string :name, null: false
        t.jsonb :details, null: false
        t.timestamps
      end unless table_exists?(table_name)
    end

  end
end
