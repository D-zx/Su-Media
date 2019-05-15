class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.text :studentid
      t.text :studentname
      t.text :fos
      t.text :status
      t.text :creationdate
      t.text :expirydate
      t.text :batchbookname

      t.timestamps
    end
  end
end
