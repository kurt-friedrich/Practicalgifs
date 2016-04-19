class AddGifToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :gif_id, :string
    add_column :gifs, :string, :string
  end
end
